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

    fun startScan(result: MethodChannel.Result) {
        if (currentJob?.isActive == true) {
            result.error("SCAN_IN_PROGRESS", "Scan already running", null)
            return
        }

        if (batteryMonitor?.isBatteryOk() == false) {
            result.error("LOW_BATTERY", "Battery too low", null)
            return
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
                scanner!!.scanStorage()
                    .catch { e ->
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
            startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC)
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
        stopSelf()
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
