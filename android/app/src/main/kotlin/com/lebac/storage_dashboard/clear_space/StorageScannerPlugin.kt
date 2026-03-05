package com.lebac.storage_dashboard.clear_space

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import com.lebac.storage_dashboard.clear_space.utils.ProgressStreamHandler
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

import android.app.Activity
import android.content.IntentSender
import android.util.Log
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import kotlinx.coroutines.*
import java.util.concurrent.atomic.AtomicInteger

class StorageScannerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var context: Context
    
    private var activity: Activity? = null
    private var activityBinding: ActivityPluginBinding? = null
    
    private val progressHandler = ProgressStreamHandler()
    private var scannerService: StorageScannerService? = null
    private var isBound = false
    
    // [S4] Use a map of request codes to pending results to avoid race conditions
    private val requestCodeCounter = AtomicInteger(100)
    private val pendingResults = mutableMapOf<Int, MethodChannel.Result>()
    
    // [P4/P6] Background scope for I/O operations off main thread
    private var pluginScope: CoroutineScope? = null

    // [S1] Max photo bytes to read (10MB cap to prevent OOM)
    private val MAX_PHOTO_BYTES = 10L * 1024 * 1024

    private val connection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, service: IBinder) {
            val binder = service as StorageScannerService.LocalBinder
            scannerService = binder.getService()
            scannerService?.setHandler(progressHandler)
            isBound = true
        }

        override fun onServiceDisconnected(arg0: ComponentName) {
            scannerService = null
            isBound = false
        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        pluginScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
        
        // Bind to service
        val intent = Intent(context, StorageScannerService::class.java)
        context.bindService(intent, connection, Context.BIND_AUTO_CREATE)
        
        val packageName = "com.lebac.storage_dashboard.clear_space"
        
        methodChannel = MethodChannel(binding.binaryMessenger, "$packageName/storage_scanner")
        methodChannel.setMethodCallHandler(this)

        eventChannel = EventChannel(binding.binaryMessenger, "$packageName/storage_scanner_progress")
        eventChannel.setStreamHandler(progressHandler)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
        pluginScope?.cancel()
        pluginScope = null
        
        if (isBound) {
            context.unbindService(connection)
            isBound = false
        }
        scannerService = null
    }

    // ActivityAware Implementation
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        activityBinding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityBinding?.removeActivityResultListener(this)
        activity = null
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        onDetachedFromActivityForConfigChanges()
    }

    // [S4] Fixed: use unique request code from map, not single variable
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val result = pendingResults.remove(requestCode)
        if (result != null) {
            if (resultCode == Activity.RESULT_OK) {
                result.success(true)
            } else {
                result.success(false)
            }
            return true
        }
        return false
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startScan" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                
                // Extract parameters from Flutter arguments
                val sensitivity = call.argument<Int>("sensitivity") ?: 5
                val largeFileThreshold = (call.argument<Int>("largeFileThreshold") ?: 10485760).toLong()
                
                val intent = Intent(context, StorageScannerService::class.java)
                context.startService(intent)
                
                scannerService?.startScan(result, sensitivity, largeFileThreshold)
            }
            "pauseScan" -> {
                scannerService?.pauseScan()
                result.success(null)
            }
            "resumeScan" -> {
                scannerService?.resumeScan()
                result.success(null)
            }
            "cancelScan" -> {
                scannerService?.cancelScan()
                result.success(null)
            }
            "deleteFiles" -> {
                val uris = call.argument<List<String>>("uris") ?: emptyList()
                val permanent = call.argument<Boolean>("permanent") ?: false
                
                if (uris.isEmpty()) {
                    result.success(true)
                    return
                }
                
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }

                if (activity == null) {
                    result.error("NO_ACTIVITY", "Cannot delete files without foreground activity", null)
                    return
                }

                scannerService?.requestDelete(uris, permanent) { intentSender ->
                    if (intentSender != null) {
                        try {
                            // [S4] Generate unique request code for this operation
                            val requestCode = requestCodeCounter.getAndIncrement()
                            pendingResults[requestCode] = result
                            activity?.startIntentSenderForResult(
                                intentSender, 
                                requestCode, 
                                null, 0, 0, 0
                            )
                        } catch (e: IntentSender.SendIntentException) {
                            result.error("SEND_INTENT_ERROR", e.message, null)
                        }
                    } else {
                        result.success(true)
                    }
                }
            }

            // [P6] getDuplicateFiles — moved to background thread
            "getDuplicateFiles" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                getScope().launch(Dispatchers.IO) {
                    val duplicates = scannerService?.getDuplicateFiles() ?: emptyMap()
                    withContext(Dispatchers.Main) { result.success(duplicates) }
                }
            }
            // [P6] getSimilarPhotos — moved to background thread
            "getSimilarPhotos" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                getScope().launch(Dispatchers.IO) {
                    val similar = scannerService?.getSimilarPhotos() ?: emptyMap()
                    withContext(Dispatchers.Main) { result.success(similar) }
                }
            }
            // [P4] getPhotos — moved to background thread
            "getPhotos" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val limit = call.argument<Int>("limit") ?: 50
                val offset = call.argument<Int>("offset") ?: 0
                getScope().launch(Dispatchers.IO) {
                    val photos = scannerService?.getPhotos(limit, offset) ?: emptyList()
                    withContext(Dispatchers.Main) { result.success(photos) }
                }
            }
            "getScreenshots" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val limit = call.argument<Int>("limit") ?: 50
                val offset = call.argument<Int>("offset") ?: 0
                val olderThanDays = call.argument<Int>("olderThanDays") ?: 0
                getScope().launch(Dispatchers.IO) {
                    val screenshots = scannerService?.getScreenshots(limit, offset, olderThanDays) ?: emptyList()
                    withContext(Dispatchers.Main) { result.success(screenshots) }
                }
            }
            "getDownloads" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val limit = call.argument<Int>("limit") ?: 50
                val offset = call.argument<Int>("offset") ?: 0
                val olderThanDays = call.argument<Int>("olderThanDays") ?: 0
                getScope().launch(Dispatchers.IO) {
                    val downloads = scannerService?.getDownloads(limit, offset, olderThanDays) ?: emptyList()
                    withContext(Dispatchers.Main) { result.success(downloads) }
                }
            }
            "getMediaFiles" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val type = call.argument<String>("type") ?: return result.error("INVALID_ARGS", "Missing type", null)
                val limit = call.argument<Int>("limit") ?: 50
                val offset = call.argument<Int>("offset") ?: 0
                getScope().launch(Dispatchers.IO) {
                    val media = scannerService?.getMediaFiles(type, limit, offset) ?: emptyList()
                    withContext(Dispatchers.Main) { result.success(media) }
                }
            }
            "getInstalledApps" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                getScope().launch(Dispatchers.IO) {
                    val apps = scannerService?.getInstalledApps() ?: emptyList()
                    withContext(Dispatchers.Main) { result.success(apps) }
                }
            }
            "uninstallApp" -> {
                val packageName = call.argument<String>("packageName")
                if (packageName == null) {
                    result.error("INVALID_ARGS", "Missing packageName", null)
                    return
                }
                try {
                    val intent = android.content.Intent(android.content.Intent.ACTION_DELETE)
                    intent.data = android.net.Uri.parse("package:$packageName")
                    // If activity is available, use it (results in a smoother dialog without needing NEW_TASK)
                    if (activity != null) {
                        activity?.startActivity(intent)
                    } else {
                        intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                        context.startActivity(intent)
                    }
                    result.success(true)
                } catch (e: Exception) {
                    result.error("UNINSTALL_ERROR", e.message, null)
                }
            }
            "cleanJunk" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val types = call.argument<List<String>>("types") ?: emptyList()
                scannerService?.cleanJunk(types) { stats ->
                    result.success(stats)
                }
            }
            "getJunkData" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val type = call.argument<String>("type") ?: ""
                // Synchronous: reads from in-memory cache, no IO needed
                val data = scannerService?.getJunkData(type) ?: emptyList<Map<String, Any>>()
                result.success(data)
            }
            "deleteSpecificJunk" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val paths = call.argument<List<String>>("paths") ?: emptyList()
                scannerService?.deleteSpecificJunk(paths) { stats ->
                    result.success(stats)
                }
            }
            "cleanJunkBackground" -> {
                val types = call.argument<List<String>>("types") ?: emptyList()
                val workManager = androidx.work.WorkManager.getInstance(context)
                
                workManager.pruneWork()
                
                val inputData = androidx.work.workDataOf("types" to types.toTypedArray())
                
                val request = androidx.work.OneTimeWorkRequest.Builder(com.lebac.storage_dashboard.clear_space.workers.CleanupWorker::class.java)
                    .setInputData(inputData)
                    .setExpedited(androidx.work.OutOfQuotaPolicy.RUN_AS_NON_EXPEDITED_WORK_REQUEST)
                    .addTag("cleanup_job")
                    .build()

                workManager.enqueueUniqueWork(
                    "cleanup_job",
                    androidx.work.ExistingWorkPolicy.REPLACE,
                    request
                )
                
                result.success(true)
            }
            "getCleanupInfo" -> {
                val workManager = androidx.work.WorkManager.getInstance(context)
                val statusFuture = workManager.getWorkInfosForUniqueWork("cleanup_job")
                
                statusFuture.addListener({
                    try {
                        val workInfoList = statusFuture.get()
                        if (workInfoList.isNotEmpty()) {
                            val info = workInfoList[0]
                            val state = info.state.name
                            val output = info.outputData
                            val count = output.getInt("count", -1)
                            val bytes = output.getLong("bytes", -1)
                            
                            val map = mapOf(
                                "state" to state,
                                "count" to count,
                                "bytes" to bytes
                            )
                            result.success(map)
                        } else {
                            result.success(null)
                        }
                    } catch (e: Exception) {
                         result.error("WORK_INFO_ERROR", e.message, null)
                    }
                }, androidx.core.content.ContextCompat.getMainExecutor(context))
            }
            // [S1] getPhotoBytes — URI validation + size cap + .use{} + background thread
            "getPhotoBytes" -> {
                val uri = call.argument<String>("uri")
                if (uri == null) {
                    result.error("INVALID_ARG", "uri is required", null)
                    return
                }
                
                // [S1] Validate URI is a MediaStore content URI (not contacts/sms/etc.)
                if (!uri.startsWith("content://media/")) {
                    result.error("INVALID_URI", "Only MediaStore URIs are allowed", null)
                    return
                }
                
                // [P4] Move I/O to background thread
                getScope().launch(Dispatchers.IO) {
                    try {
                        val contentUri = android.net.Uri.parse(uri)
                        
                        // [S1] Check file size before reading to prevent OOM
                        val fileSize = getContentSize(contentUri)
                        if (fileSize > MAX_PHOTO_BYTES) {
                            withContext(Dispatchers.Main) {
                                result.error("FILE_TOO_LARGE", "File exceeds ${MAX_PHOTO_BYTES / 1024 / 1024}MB limit", null)
                            }
                            return@launch
                        }
                        
                        // [S1/F4] Use .use{} for guaranteed stream closure
                        val bytes = context.contentResolver.openInputStream(contentUri)?.use { stream ->
                            stream.readBytes()
                        }
                        
                        withContext(Dispatchers.Main) {
                            if (bytes != null) {
                                result.success(bytes)
                            } else {
                                result.error("IO_ERROR", "Could not open stream for $uri", null)
                            }
                        }
                    } catch (e: Exception) {
                        Log.e("StorageScannerPlugin", "getPhotoBytes error: ${e.message}", e)
                        withContext(Dispatchers.Main) {
                            result.error("IO_ERROR", e.message, null)
                        }
                    }
                }
            }
            // [D2] getPhotoThumbnail — efficient thumbnail loading via ContentResolver
            "getPhotoThumbnail" -> {
                val uri = call.argument<String>("uri")
                if (uri == null) {
                    result.error("INVALID_ARG", "uri is required", null)
                    return
                }
                
                if (!uri.startsWith("content://media/")) {
                    result.error("INVALID_URI", "Only MediaStore URIs are allowed", null)
                    return
                }
                
                val width = call.argument<Int>("width") ?: 200
                val height = call.argument<Int>("height") ?: 200
                
                getScope().launch(Dispatchers.IO) {
                    try {
                        val contentUri = android.net.Uri.parse(uri)
                        val bitmap = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
                            // API 29+: Use efficient loadThumbnail
                            context.contentResolver.loadThumbnail(
                                contentUri,
                                android.util.Size(width, height),
                                null
                            )
                        } else {
                            // Fallback: decode with inSampleSize for memory efficiency
                            val options = android.graphics.BitmapFactory.Options().apply {
                                inJustDecodeBounds = true
                            }
                            context.contentResolver.openInputStream(contentUri)?.use { stream ->
                                android.graphics.BitmapFactory.decodeStream(stream, null, options)
                            }
                            
                            val sampleSize = maxOf(
                                (options.outWidth / width),
                                (options.outHeight / height),
                                1
                            )
                            
                            val decodeOptions = android.graphics.BitmapFactory.Options().apply {
                                inSampleSize = sampleSize
                            }
                            context.contentResolver.openInputStream(contentUri)?.use { stream ->
                                android.graphics.BitmapFactory.decodeStream(stream, null, decodeOptions)
                            }
                        }
                        
                        if (bitmap != null) {
                            val stream = java.io.ByteArrayOutputStream()
                            bitmap.compress(android.graphics.Bitmap.CompressFormat.JPEG, 80, stream)
                            bitmap.recycle()
                            val bytes = stream.toByteArray()
                            
                            withContext(Dispatchers.Main) {
                                result.success(bytes)
                            }
                        } else {
                            withContext(Dispatchers.Main) {
                                result.error("THUMB_ERROR", "Could not generate thumbnail", null)
                            }
                        }
                    } catch (e: Exception) {
                        Log.e("StorageScannerPlugin", "getPhotoThumbnail error: ${e.message}", e)
                        withContext(Dispatchers.Main) {
                            result.error("THUMB_ERROR", e.message, null)
                        }
                    }
                }
            }
            else -> result.notImplemented()
        }
    }
    
    /**
     * [S1] Get content size from ContentResolver without reading the file.
     */
    private fun getContentSize(uri: android.net.Uri): Long {
        return try {
            context.contentResolver.openAssetFileDescriptor(uri, "r")?.use { afd ->
                val declared = afd.declaredLength
                if (declared > 0) declared else afd.parcelFileDescriptor?.statSize ?: 0L
            } ?: 0L
        } catch (e: Exception) {
            0L // Can't determine size — allow read (will fail on stream if truly inaccessible)
        }
    }
    
    private fun getScope(): CoroutineScope {
        return pluginScope ?: CoroutineScope(Dispatchers.Main + SupervisorJob()).also { pluginScope = it }
    }
}
