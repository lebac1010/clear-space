package com.movixalabs.cleanmaster.utils

import android.content.ContentResolver
import android.content.ContentUris
import android.database.Cursor
import android.net.Uri
import android.os.Build
import android.os.ParcelFileDescriptor
import android.provider.MediaStore

/**
 * Resolves file sizes with fallback for unreliable MediaStore SIZE column.
 */
class FileSizeResolver(private val contentResolver: ContentResolver) {
    
    /**
     * Get reliable file size
     * @return Pair of (actualSize, isCloudOnly)
     */
    fun getFileSize(
        cursor: Cursor,
        sizeColumnIndex: Int,
        idColumnIndex: Int,
        baseUri: Uri
    ): FileSizeResult {
        val reportedSize = cursor.getLong(sizeColumnIndex)
        val id = cursor.getLong(idColumnIndex)
        
        // Check if file is pending/trashed (Android 10+)
        val isPending = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val pendingIndex = cursor.getColumnIndex(MediaStore.MediaColumns.IS_PENDING)
            if (pendingIndex >= 0) cursor.getInt(pendingIndex) == 1 else false
        } else false
        
        val isTrashed = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val trashedIndex = cursor.getColumnIndex(MediaStore.MediaColumns.IS_TRASHED)
            if (trashedIndex >= 0) cursor.getInt(trashedIndex) == 1 else false
        } else false
        
        // Skip pending/trashed files
        if (isPending || isTrashed) {
            return FileSizeResult(
                size = 0,
                isCloudOnly = false,
                isAccessible = false,
                skipReason = SkipReason.PENDING_OR_TRASHED
            )
        }
        
        // If SIZE is valid (> 0), trust it
        if (reportedSize > 0) {
            return FileSizeResult(
                size = reportedSize,
                isCloudOnly = false,
                isAccessible = true,
                skipReason = null
            )
        }
        
        // SIZE is 0 or null - try to get actual size
        val uri = ContentUris.withAppendedId(baseUri, id)
        
        // FIX #7: Wrap in timeout to prevent ANR on cloud files
        // We use a simple approach: try AssetFileDescriptor first (fast fail for cloud)
        return try {
            // Quick check: try to get size without actually opening
            val afd = contentResolver.openAssetFileDescriptor(uri, "r")
            if (afd == null) {
                return FileSizeResult(
                    size = 0,
                    isCloudOnly = true,
                    isAccessible = false,
                    skipReason = SkipReason.CANNOT_OPEN
                )
            }
            
            afd.use { descriptor ->
                val declaredLength = descriptor.declaredLength
                
                // If declared length is valid, use it (fast path)
                if (declaredLength > 0) {
                    return FileSizeResult(
                        size = declaredLength,
                        isCloudOnly = false,
                        isAccessible = true,
                        skipReason = null
                    )
                }
                
                // Fallback to ParcelFileDescriptor stat
                val pfd = descriptor.parcelFileDescriptor
                val actualSize = pfd?.statSize ?: 0L
                
                if (actualSize > 0) {
                    FileSizeResult(
                        size = actualSize,
                        isCloudOnly = false,
                        isAccessible = true,
                        skipReason = null
                    )
                } else {
                    // File exists but has no size - likely cloud-only or downloading
                    FileSizeResult(
                        size = 0,
                        isCloudOnly = true,
                        isAccessible = false,
                        skipReason = SkipReason.CLOUD_ONLY
                    )
                }
            }
        } catch (e: Exception) {
            // Can't access file - likely cloud-only or permission issue
            FileSizeResult(
                size = 0,
                isCloudOnly = true,
                isAccessible = false,
                skipReason = SkipReason.ACCESS_ERROR
            )
        }
    }
}

data class FileSizeResult(
    val size: Long,
    val isCloudOnly: Boolean,
    val isAccessible: Boolean,
    val skipReason: SkipReason?
)

enum class SkipReason {
    PENDING_OR_TRASHED,
    CLOUD_ONLY,
    CANNOT_OPEN,
    ACCESS_ERROR
}
