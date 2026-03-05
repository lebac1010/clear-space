package com.lebac.storage_dashboard.clear_space

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.graphics.Color
import android.os.Binder
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.os.Environment
import androidx.core.app.NotificationCompat
import com.lebac.storage_dashboard.clear_space.models.ScanPhase
import com.lebac.storage_dashboard.clear_space.models.ScanProgress
import com.lebac.storage_dashboard.clear_space.utils.*
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.catch
import java.util.concurrent.atomic.AtomicReference

class StorageScannerService : Service() {

    // Communication binder
    private val binder = LocalBinder()
    
    // Dependencies (set via Binder)
    private var progressHandler: ProgressStreamHandler? = null

    // Job control
    private var serviceScope: CoroutineScope? = null
    private var currentJob: Job? = null
    private var scanner: MediaStoreScanner? = null
    
    // State
    private val pendingResult = AtomicReference<MethodChannel.Result?>(null)
    private var contentObserver: StorageContentObserver? = null
    private var batteryMonitor: BatteryMonitor? = null
    
    companion object {
        const val CHANNEL_ID = "storage_scan_channel"
        const val NOTIFICATION_ID = 423
    }

    inner class LocalBinder : Binder() {
        fun getService(): StorageScannerService = this@StorageScannerService
    }

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    override fun onCreate() {
        super.onCreate()
        
        // Initialize scope
        serviceScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
        
        // Create notification channel
        createNotificationChannel()
        
        // Setup content observer
        contentObserver = StorageContentObserver(this) { uri ->
            progressHandler?.sendCacheInvalidated()
        }
        contentObserver?.register()
        
        // Setup battery monitor
        batteryMonitor = BatteryMonitor(this)
    }

    override fun onDestroy() {
        cleanup()
        super.onDestroy()
    }
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // If system kills service, don't recreate automatically without intent
        return START_NOT_STICKY
    }

    fun setHandler(handler: ProgressStreamHandler) {
        this.progressHandler = handler
    }

    fun startScan(result: MethodChannel.Result, sensitivity: Int = 5, largeFileThreshold: Long = 10485760L) {
        if (currentJob?.isActive == true) {
            result.error("SCAN_IN_PROGRESS", "Scan already running", null)
            return
        }

        if (batteryMonitor?.isBatteryOk() == false) {
            result.error("LOW_BATTERY", "Battery too low", null)
            return
        }
        
        // [S2] Check MANAGE_EXTERNAL_STORAGE on Android 11+ (needed for junk/empty folder deletion)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && !Environment.isExternalStorageManager()) {
            Log.w("StorageScannerService", "MANAGE_EXTERNAL_STORAGE not granted. Junk/empty folder cleanup may be limited.")
        }

        // 1. Start Foreground immediately
        startForegroundServiceCompat()
        
        pendingResult.set(result)
        scanner = MediaStoreScanner(this)
        
        val scope = serviceScope ?: CoroutineScope(Dispatchers.Main + SupervisorJob()).also { serviceScope = it }

        currentJob = scope.launch {
            batteryMonitor?.startMonitoring(
                onLowBattery = { 
                    scanner?.pause()
                    progressHandler?.sendProgress(ScanProgress(ScanPhase.PAUSED, 0, 0, 0, isPaused = true))
                },
                onBatteryOk = { 
                    scanner?.resume() 
                }
            )

            try {
                // [P5] Suppress ContentObserver during scan to prevent self-invalidation
                contentObserver?.isSuppressed = true
                
                scanner!!.scanStorage(sensitivity, largeFileThreshold)
                    .catch { e ->
                        Log.e("StorageScannerService", "Scan error caught: ${e.message}", e)
                        progressHandler?.sendError("SCAN_ERROR", e.message ?: "Unknown")
                        sendResult { it.error("SCAN_ERROR", e.message, null) }
                    }
                    .collect { update ->
                        when (update) {
                            is ScanUpdate.Progress -> progressHandler?.sendProgress(update.progress)
                            is ScanUpdate.Complete -> {
                                progressHandler?.sendComplete(update.storageInfo.toMap())
                                sendResult { it.success(update.storageInfo.toMap()) }
                            }
                            is ScanUpdate.Cancelled -> sendResult { it.error("SCAN_CANCELLED", "Cancelled", null) }
                            is ScanUpdate.Error -> sendResult { it.error("SCAN_ERROR", update.message, null) }
                        }
                    }
            } finally {
                // [P5] Re-enable ContentObserver after scan completes
                contentObserver?.isSuppressed = false
                stopForegroundServiceCompat()
                batteryMonitor?.stopMonitoring()
            }
        }
    }

    fun pauseScan() = scanner?.pause()
    fun resumeScan() = scanner?.resume()
    
    fun cancelScan() {
        scanner?.cancel()
        currentJob?.cancel()
        currentJob = null
        stopForegroundServiceCompat()
        sendResult { it.error("SCAN_CANCELLED", "Scan cancelled", null) }
    }

    fun getDuplicateFiles(): Map<String, List<Map<String, Any>>> {
        return scanner?.getDuplicateFiles() ?: emptyMap()
    }

    fun getSimilarPhotos(): Map<String, List<Map<String, Any>>> {
        return scanner?.getSimilarPhotos() ?: emptyMap()
    }

    fun getPhotos(limit: Int, offset: Int): List<Map<String, Any>> {
        Log.d("StorageScannerService", "getPhotos called: limit=$limit, offset=$offset, scanner=${scanner != null}")
        if (scanner == null) {
            Log.d("StorageScannerService", "Creating new MediaStoreScanner instance for getPhotos")
            scanner = MediaStoreScanner(this)
        }
        val result = scanner?.getPhotos(limit, offset) ?: emptyList()
        Log.d("StorageScannerService", "getPhotos returning ${result.size} photos")
        return result
    }

    fun getMediaFiles(type: String, limit: Int, offset: Int): List<Map<String, Any>> {
        Log.d("StorageScannerService", "getMediaFiles called: type=$type, limit=$limit, offset=$offset")
        if (scanner == null) {
            scanner = MediaStoreScanner(this)
        }
        return scanner?.getMediaFiles(type, limit, offset) ?: emptyList()
    }

    fun getInstalledApps(): List<Map<String, Any>> {
        if (scanner == null) {
            scanner = MediaStoreScanner(this)
        }
        return scanner?.getInstalledApps() ?: emptyList()
    }


    fun requestDelete(uris: List<String>, permanent: Boolean, callback: (android.content.IntentSender?) -> Unit) {
        // Use service scope to ensure operation completes even if app backgrounds
        (serviceScope ?: CoroutineScope(Dispatchers.Main + SupervisorJob()).also { serviceScope = it }).launch {
            try {
                // Ensure scanner is initialized
                if (scanner == null) {
                    scanner = MediaStoreScanner(this@StorageScannerService)
                }
                
                val intentSender = if (permanent) {
                    scanner?.deletePermanently(uris)
                } else {
                    scanner?.moveToTrash(uris)
                }
                callback(intentSender)
            } catch (e: Exception) {
                // Log error or handle?
                // For now, return null as if failed (or caller handles timeout)
                callback(null)
            }
        }
    }
    
    private fun sendResult(block: (MethodChannel.Result) -> Unit) {
        pendingResult.getAndSet(null)?.let { res ->
            try { block(res) } catch (e: Exception) {}
        }
    }

    
    private fun cleanup() {
        cancelScan()
        contentObserver?.unregister()
        serviceScope?.cancel()
    }

    private fun startForegroundServiceCompat() {
        val notification = createNotification()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            // [P5] Must match manifest's android:foregroundServiceType="specialUse"
            // Using DATA_SYNC here crashed on Android 14+ when manifest declares specialUse
            startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }
    }
    
    private fun stopForegroundServiceCompat() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            stopForeground(true)
        }
        // Do NOT call stopSelf() here — the service must stay alive
        // so that junk/duplicate/media caches remain accessible.
        // Service lifecycle is managed by the plugin's bindService().
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Storage Scan Progress",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Shows progress of storage background scanning"
                enableLights(false)
                enableVibration(false)
            }
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }
    }

    fun cleanJunk(types: List<String>, callback: (Map<String, Any>) -> Unit) {
        val scope = serviceScope ?: CoroutineScope(Dispatchers.Main + SupervisorJob()).also { serviceScope = it }
        scope.launch {
            if (scanner == null) {
                scanner = MediaStoreScanner(this@StorageScannerService)
            }
            val stats = scanner?.cleanJunk(types) ?: mapOf("count" to 0, "bytes" to 0L)
            callback(stats)
        }
    }

    fun getJunkData(type: String): List<Map<String, Any>> {
        if (scanner == null) {
            scanner = MediaStoreScanner(this)
        }
        return scanner?.getJunkData(type) ?: emptyList()
    }

    fun deleteSpecificJunk(paths: List<String>, callback: (Map<String, Any>) -> Unit) {
        val scope = serviceScope ?: CoroutineScope(Dispatchers.Main + SupervisorJob()).also { serviceScope = it }
        scope.launch {
            if (scanner == null) {
                scanner = MediaStoreScanner(this@StorageScannerService)
            }
            val stats = scanner?.deleteSpecificJunk(paths) ?: mapOf(
                "deletedCount" to 0, "deletedBytes" to 0L, "skippedCount" to 0
            )
            callback(stats)
        }
    }

    private fun createNotification(): Notification {
        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Scanning Storage")
            .setContentText("Analyzing files in background...")
            .setSmallIcon(android.R.drawable.ic_menu_search) // Standard icon
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setOngoing(true)
            .build()
    }
}
