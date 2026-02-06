package com.lebac.storage_dashboard.clear_space.utils

import android.content.Context
import android.database.ContentObserver
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore

/**
 * Observes MediaStore for changes to invalidate cache.
 */
class StorageContentObserver(
    private val context: Context,
    private val onContentChanged: (Uri?) -> Unit
) : ContentObserver(Handler(Looper.getMainLooper())) {
    
    private var isRegistered = false
    
    override fun onChange(selfChange: Boolean, uri: Uri?) {
        super.onChange(selfChange, uri)
        onContentChanged(uri)
    }
    
    override fun onChange(selfChange: Boolean) {
        super.onChange(selfChange)
        onContentChanged(null)
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
        
        context.contentResolver.unregisterContentObserver(this)
        isRegistered = false
    }
}
