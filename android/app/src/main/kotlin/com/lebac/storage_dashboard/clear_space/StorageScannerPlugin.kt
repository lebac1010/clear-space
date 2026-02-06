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

class StorageScannerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var context: Context
    
    private val progressHandler = ProgressStreamHandler()
    private var scannerService: StorageScannerService? = null
    private var isBound = false

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

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startScan" -> {
                if (scannerService == null) {
                    result.error("NOT_BOUND", "Service not bound yet", null)
                    return
                }
                // Start service to ensure lifecycle promotion
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
            else -> result.notImplemented()
        }
    }
}
