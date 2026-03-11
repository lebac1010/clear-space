package com.movixalabs.cleanmaster.utils

import android.os.Handler
import android.os.Looper
import com.movixalabs.cleanmaster.models.ScanProgress
import io.flutter.plugin.common.EventChannel
import java.util.concurrent.atomic.AtomicBoolean

class ProgressStreamHandler : EventChannel.StreamHandler {
    
    private var eventSink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper())
    private val isStreamActive = AtomicBoolean(false)
    
    // FIX #8: Ensure cancellation callback is invoked only once
    private val hasCancelledBeenInvoked = AtomicBoolean(false)
    
    // Callback when stream is cancelled
    var onStreamCancelled: (() -> Unit)? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        isStreamActive.set(true)
        hasCancelledBeenInvoked.set(false)  // Reset on new listen
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
        isStreamActive.set(false)
        invokeStreamCancelledOnce()
    }
    
    private fun invokeStreamCancelledOnce() {
        if (hasCancelledBeenInvoked.compareAndSet(false, true)) {
            onStreamCancelled?.invoke()
        }
    }
    
    /**
     * Check if stream is still active before sending
     */
    fun isActive(): Boolean = isStreamActive.get() && eventSink != null

    fun sendProgress(progress: ScanProgress) {
        if (!isActive()) {
            // Stream cancelled, notify once
            invokeStreamCancelledOnce()
            return
        }
        
        mainHandler.post {
            eventSink?.success(mapOf(
                "type" to "progress",
                "data" to progress.toMap()
            ))
        }
    }

    fun sendComplete(data: Map<String, Any>) {
        if (!isActive()) return
        
        mainHandler.post {
            eventSink?.success(mapOf(
                "type" to "complete",
                "data" to data
            ))
        }
    }
    
    fun sendCacheInvalidated() {
        if (!isActive()) return
        
        mainHandler.post {
            eventSink?.success(mapOf(
                "type" to "cache_invalidated"
            ))
        }
    }

    // [F6] Send error as a data event, NOT EventSink.error() which kills the stream permanently.
    // Flutter side already handles type="error" in the onProgress mapper.
    fun sendError(errorCode: String, errorMessage: String) {
        if (!isActive()) return
        
        mainHandler.post {
            eventSink?.success(mapOf(
                "type" to "error",
                "code" to errorCode,
                "message" to errorMessage
            ))
        }
    }
}
