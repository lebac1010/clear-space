package com.movixalabs.cleanmaster.utils

import android.content.Context
import android.database.ContentObserver
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore

/**
 * Observes MediaStore for changes to invalidate cache.
 * [P5] Debounces onChange events with a 2-second delay to prevent flooding.
 */
class StorageContentObserver(
    private val context: Context,
    private val onContentChanged: (Uri?) -> Unit
) : ContentObserver(Handler(Looper.getMainLooper())) {
    
    private var isRegistered = false
    private val mainHandler = Handler(Looper.getMainLooper())
    
    // [P5] Debounce state
    private var debounceRunnable: Runnable? = null
    private val DEBOUNCE_DELAY_MS = 2000L
    
    // [P5] Suppress events during active scan to prevent self-invalidation
    @Volatile
    var isSuppressed = false
    
    override fun onChange(selfChange: Boolean, uri: Uri?) {
        super.onChange(selfChange, uri)
        if (isSuppressed) return
        debounceNotify(uri)
    }
    
    override fun onChange(selfChange: Boolean) {
        super.onChange(selfChange)
        if (isSuppressed) return
        debounceNotify(null)
    }
    
    /**
     * [P5] Debounce: only fire the callback after 2 seconds of silence.
     * If multiple changes arrive within 2 seconds, they collapse into a single event.
     */
    private fun debounceNotify(uri: Uri?) {
        debounceRunnable?.let { mainHandler.removeCallbacks(it) }
        debounceRunnable = Runnable { onContentChanged(uri) }
        mainHandler.postDelayed(debounceRunnable!!, DEBOUNCE_DELAY_MS)
    }
    
    /**
     * Start observing MediaStore changes
     */
    fun register() {
        if (isRegistered) return
        
        val urisToObserve = listOf(
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
            MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
            MediaStore.Files.getContentUri("external")
        )
        
        urisToObserve.forEach { uri ->
            context.contentResolver.registerContentObserver(
                uri,
                true,  // Notify for descendants
                this
            )
        }
        
        isRegistered = true
    }
    
    /**
     * Stop observing
     */
    fun unregister() {
        if (!isRegistered) return
        
        // Cancel any pending debounce
        debounceRunnable?.let { mainHandler.removeCallbacks(it) }
        debounceRunnable = null
        
        context.contentResolver.unregisterContentObserver(this)
        isRegistered = false
    }
}
