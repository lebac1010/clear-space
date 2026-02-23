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
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry

class StorageScannerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var context: Context
    
    private var activity: Activity? = null
    private var activityBinding: ActivityPluginBinding? = null
    
    private val progressHandler = ProgressStreamHandler()
    private var scannerService: StorageScannerService? = null
    private var isBound = false
    
    // Request Code for scoped storage deletion
    private val DELETE_REQUEST_CODE = 42

    private var pendingResult: MethodChannel.Result? = null

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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == DELETE_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                pendingResult?.success(true)
            } else {
                pendingResult?.success(false)
            }
            pendingResult = null
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
                val intent = Intent(context, StorageScannerService::class.java)
                context.startService(intent)
                
                scannerService?.startScan(result)
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
                // Delete files (handles both trash and permanent delete based on arg)
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

                // Launch coroutine scope from service or plugin? 
                // We need to call suspend function. Let's delegate to service to get the IntentSender.
                // But we need to update Service to expose this.
                // Quick fix: CoroutineScope in Plugin or Service? Service has scope.
                
                // We need a way to call suspend function from callback.
                // Ideally, Service exposes `deleteFiles` which returns CompletableFuture or Callback.
                // Let's modify Service to support this.
                
                scannerService?.requestDelete(uris, permanent) { intentSender ->
                    if (intentSender != null) {
                        try {
                            pendingResult = result
                            activity?.startIntentSenderForResult(
                                intentSender, 
                                DELETE_REQUEST_CODE, 
                                null, 0, 0, 0
                            )
                        } catch (e: IntentSender.SendIntentException) {
                            result.error("SEND_INTENT_ERROR", e.message, null)
                            pendingResult = null
                        }
                    } else {
                        // Success immediately (Android 10 or auto-granted)
                        result.success(true)
                    }
                }
            }

            "getDuplicateFiles" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                
                // This is synchronous but might be heavy. 
                // However, scanner.getDuplicateFiles() just returns memory state from last scan.
                // So it should be fast.
                val duplicates = scannerService?.getDuplicateFiles() ?: emptyMap()
                result.success(duplicates)
            }
            "getSimilarPhotos" -> {
                 if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val similar = scannerService?.getSimilarPhotos() ?: emptyMap()
                result.success(similar)
            }
            "getPhotos" -> {
                 android.util.Log.d("StorageScannerPlugin", "getPhotos called, isBound=$isBound, scannerService=${scannerService != null}")
                 if (scannerService == null) {
                    android.util.Log.e("StorageScannerPlugin", "getPhotos FAILED: Service not bound yet")
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                val limit = call.argument<Int>("limit") ?: 50
                val offset = call.argument<Int>("offset") ?: 0
                android.util.Log.d("StorageScannerPlugin", "getPhotos calling service with limit=$limit, offset=$offset")
                val photos = scannerService?.getPhotos(limit, offset) ?: emptyList()
                android.util.Log.d("StorageScannerPlugin", "getPhotos returning ${photos.size} photos to Flutter")
                result.success(photos)
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
            "cleanJunkBackground" -> {
                val types = call.argument<List<String>>("types") ?: emptyList()
                val workManager = androidx.work.WorkManager.getInstance(context)
                
                // Fix #4: Prune old finished/cancelled work to prevent REPLACE from being a no-op
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
                // This is a ListenableFuture. We need to wait for it or add listener.
                // Since we are in onMethodCall (Main Thread), we should use a listener or blocking if fast.
                // But get() is blocking. Ideally run in bg.
                // Quick hack: run in thread.
                
                statusFuture.addListener({
                    try {
                        val workInfoList = statusFuture.get()
                        if (workInfoList.isNotEmpty()) {
                            val info = workInfoList[0]
                            val state = info.state.name // ENQUEUED, RUNNING, SUCCEEDED, FAILED, BLOCKED, CANCELLED
                            // Output Data
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
            "getPhotoBytes" -> {
                val uri = call.argument<String>("uri")
                if (uri == null) {
                    result.error("INVALID_ARG", "uri is required", null)
                    return
                }
                try {
                    val contentUri = android.net.Uri.parse(uri)
                    val inputStream = context.contentResolver.openInputStream(contentUri)
                    if (inputStream != null) {
                        val bytes = inputStream.readBytes()
                        inputStream.close()
                        result.success(bytes)
                    } else {
                        result.error("IO_ERROR", "Could not open stream for $uri", null)
                    }
                } catch (e: Exception) {
                    android.util.Log.e("StorageScannerPlugin", "getPhotoBytes error: ${e.message}", e)
                    result.error("IO_ERROR", e.message, null)
                }
            }
            else -> result.notImplemented()
        }
    }
}

