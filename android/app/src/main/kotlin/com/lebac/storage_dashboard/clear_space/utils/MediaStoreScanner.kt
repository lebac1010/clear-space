package com.lebac.storage_dashboard.clear_space.utils

import android.content.ContentResolver
import android.content.ContentUris
import android.content.Context
import android.database.Cursor
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.app.usage.StorageStatsManager
import android.provider.MediaStore
import com.lebac.storage_dashboard.clear_space.models.*
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn
import java.util.UUID
import kotlin.math.max

class MediaStoreScanner(private val context: Context) {

    private val volumeHelper = VolumeHelper(context)
    private val fileSizeResolver = FileSizeResolver(context.contentResolver)
    private val duplicateDetector = DuplicateDetector()
    private val largeFileTracker = LargeFileTracker(20)  // Top 20
    
    @Volatile
    private var isPaused = false
    
    @Volatile
    private var isCancelled = false

    /**
     * Main scan function that returns a Flow of progress updates
     */
    fun scanStorage(): Flow<ScanUpdate> = flow {
        val startTime = System.currentTimeMillis()
        
        try {
            // Reset trackers
            duplicateDetector.clear()
            largeFileTracker.clear()
            isPaused = false
            isCancelled = false
            
            var cloudOnlyCount = 0
            
            // Phase 1: Get disk space (with fallback)
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.DISK_SPACE, 0, 1, 0L)))
            val diskSpace = getDiskSpaceSafe()
            val volumes = volumeHelper.getAllVolumes()
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.DISK_SPACE, 1, 1, 0L)))

            // Phase 2: Photos
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.PHOTOS, 0, 100, 0L)))
            val photosResult = scanMediaType(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                ScanPhase.PHOTOS,
                MediaType.IMAGE
            ) { progress, cloud -> 
                emit(ScanUpdate.Progress(progress))
                cloudOnlyCount += cloud
            }
            checkCancelled()

            // Phase 3: Videos
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.VIDEOS, 0, 100, 0L)))
            val videosResult = scanMediaType(
                MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
                ScanPhase.VIDEOS,
                MediaType.VIDEO
            ) { progress, cloud -> 
                emit(ScanUpdate.Progress(progress))
                cloudOnlyCount += cloud
            }
            checkCancelled()

            // Phase 4: Audio
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.AUDIO, 0, 100, 0L)))
            val audioResult = scanMediaType(
                MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                ScanPhase.AUDIO,
                MediaType.AUDIO
            ) { progress, cloud -> 
                emit(ScanUpdate.Progress(progress))
                cloudOnlyCount += cloud
            }
            checkCancelled()

            // Phase 5: Documents
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.DOCUMENTS, 0, 100, 0L)))
            val documentsResult = scanDocuments { progress ->
                emit(ScanUpdate.Progress(progress))
            }
            checkCancelled()

            // Phase 6: Calculate final values
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.CALCULATING, 0, 1, 0L)))
            
            val filesCount = documentsResult.count + audioResult.count
            val filesSize = documentsResult.size + audioResult.size
            val mediaSize = photosResult.size + videosResult.size
            val systemSize = max(0L, diskSpace.usedSpace - mediaSize - filesSize)
            
            // Get duplicate stats
            val duplicateStats = duplicateDetector.getStats()
            
            val scanDuration = System.currentTimeMillis() - startTime

            val storageInfo = StorageInfo(
                totalSpace = diskSpace.totalSpace,
                freeSpace = diskSpace.freeSpace,
                usedSpace = diskSpace.usedSpace,
                photosCount = photosResult.count,
                photosSize = photosResult.size,
                videosCount = videosResult.count,
                videosSize = videosResult.size,
                audioCount = audioResult.count,
                audioSize = audioResult.size,
                documentsCount = documentsResult.count,
                documentsSize = documentsResult.size,
                filesCount = filesCount,
                filesSize = filesSize,
                systemSize = systemSize,
                lastUpdated = System.currentTimeMillis(),
                isEstimated = false,
                duplicateCount = duplicateStats.totalDuplicateFiles,
                duplicateSize = duplicateStats.totalDuplicateSize,
                potentialSavings = duplicateStats.potentialSavings,
                largeFiles = largeFileTracker.getLargestFiles(),
                storageVolumes = volumes,
                cloudOnlyCount = cloudOnlyCount,
                scanDurationMs = scanDuration
            )

            // Phase 7: Complete
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.COMPLETE, 100, 100, 0L)))
            emit(ScanUpdate.Complete(storageInfo))
            
        } catch (e: CancellationException) {
            emit(ScanUpdate.Cancelled)
            throw e
        } catch (e: Exception) {
            emit(ScanUpdate.Error(e.message ?: "Unknown error"))
            throw e
        }
    }.flowOn(Dispatchers.IO)

    /**
     * Pause scanning
     */
    fun pause() {
        isPaused = true
    }

    /**
     * Resume scanning
     */
    fun resume() {
        isPaused = false
    }

    /**
     * Cancel scanning
     */
    fun cancel() {
        isCancelled = true
    }

    private suspend fun checkCancelled() {
        if (isCancelled) {
            throw CancellationException("Scan cancelled by user")
        }
    }

    private suspend fun waitIfPaused() {
        while (isPaused && !isCancelled) {
            delay(200)
        }
        checkCancelled()
    }

    /**
     * Get disk space with fallback for problematic devices
     */
    private fun getDiskSpaceSafe(): DiskSpaceData {
        return try {
            val stat = StatFs(Environment.getDataDirectory().path)
            DiskSpaceData(
                totalSpace = stat.blockSizeLong * stat.blockCountLong,
                freeSpace = stat.availableBlocksLong * stat.blockSizeLong,
                usedSpace = stat.blockSizeLong * (stat.blockCountLong - stat.availableBlocksLong)
            )
        } catch (e: Exception) {
            // Fallback: Use StorageStatsManager (Android 8+)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                try {
                    val storageStatsManager = context.getSystemService(StorageStatsManager::class.java)
                    val uuid = android.os.storage.StorageManager.UUID_DEFAULT
                    val totalBytes = storageStatsManager.getTotalBytes(uuid)
                    val freeBytes = storageStatsManager.getFreeBytes(uuid)
                    DiskSpaceData(
                        totalSpace = totalBytes,
                        freeSpace = freeBytes,
                        usedSpace = totalBytes - freeBytes
                    )
                } catch (e2: Exception) {
                    DiskSpaceData(0, 0, 0)
                }
            } else {
                DiskSpaceData(0, 0, 0)
            }
        }
    }

    /**
     * Scan a specific media type using MediaStore with enhanced processing
     */
    private suspend fun scanMediaType(
        uri: Uri,
        phase: ScanPhase,
        mediaType: MediaType,
        onProgress: suspend (ScanProgress, Int) -> Unit
    ): MediaResult {
        
        // Build projection with all needed columns
        val projection = mutableListOf(
            MediaStore.MediaColumns._ID,
            MediaStore.MediaColumns.SIZE,
            MediaStore.MediaColumns.DISPLAY_NAME,
            MediaStore.MediaColumns.MIME_TYPE,
            MediaStore.MediaColumns.DATE_MODIFIED,
            MediaStore.MediaColumns.DATA  // Legacy path for duplicate detection
        )
        
        // Android 10+ columns
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            projection.add(MediaStore.MediaColumns.IS_PENDING)
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            projection.add(MediaStore.MediaColumns.IS_TRASHED)
        }

        // Query all volumes
        // FIX #6: For Android < Q, we only scan external volume once
        val volumeNames = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            volumeHelper.getMediaStoreVolumeNames()
        } else {
            listOf("external")  // Placeholder, we'll use the passed uri directly
        }
        var totalCount = 0
        var totalSize = 0L
        var cloudCount = 0
        var processedSoFar = 0

        for (volumeName in volumeNames) {
            // FIX #1: Use media-type-specific URI, not Files URI
            val volumeUri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                // For Q+, we need to use the correct media collection for the volume
                when (mediaType) {
                    MediaType.IMAGE -> MediaStore.Images.Media.getContentUri(volumeName)
                    MediaType.VIDEO -> MediaStore.Video.Media.getContentUri(volumeName)
                    MediaType.AUDIO -> MediaStore.Audio.Media.getContentUri(volumeName)
                    else -> uri
                }
            } else {
                // Pre-Q: only external volume, use passed uri directly
                uri
            }

            // Now scan with actual data
            var cursor: Cursor? = null
            try {
                cursor = context.contentResolver.query(
                    volumeUri,
                    projection.toTypedArray(),
                    null,
                    null,
                    null
                )

                cursor?.let {
                    // FIX: Get count from main cursor instead of COUNT(*) query
                    totalCount += it.count

                    val idIndex = cursor.getColumnIndexOrThrow(MediaStore.MediaColumns._ID)
                    val sizeIndex = cursor.getColumnIndexOrThrow(MediaStore.MediaColumns.SIZE)
                    val nameIndex = cursor.getColumnIndexOrThrow(MediaStore.MediaColumns.DISPLAY_NAME)
                    val mimeIndex = cursor.getColumnIndexOrThrow(MediaStore.MediaColumns.MIME_TYPE)
                    val dateIndex = cursor.getColumnIndexOrThrow(MediaStore.MediaColumns.DATE_MODIFIED)
                    val dataIndex = cursor.getColumnIndex(MediaStore.MediaColumns.DATA)

                    while (cursor.moveToNext()) {
                        // Check for pause/cancel
                        waitIfPaused()
                        
                        val id = cursor.getLong(idIndex)
                        val name = cursor.getString(nameIndex) ?: "unknown"
                        val mimeType = cursor.getString(mimeIndex) ?: ""
                        val dateModified = cursor.getLong(dateIndex)
                        val path = if (dataIndex >= 0) cursor.getString(dataIndex) ?: "" else ""
                        
                        // Use FileSizeResolver for reliable size
                        val sizeResult = fileSizeResolver.getFileSize(
                            cursor, sizeIndex, idIndex, volumeUri
                        )
                        
                        if (!sizeResult.isAccessible) {
                            if (sizeResult.isCloudOnly) {
                                cloudCount++
                            }
                            continue
                        }
                        
                        val size = sizeResult.size
                        totalSize += size
                        
                        // Track for duplicate detection
                        val fileUri = ContentUris.withAppendedId(volumeUri, id).toString()
                        duplicateDetector.addFile(id, name, size, path, fileUri)
                        
                        // Track large files
                        largeFileTracker.addFile(
                            id = id,
                            name = name,
                            size = size,
                            mimeType = mimeType,
                            dateModified = dateModified,
                            uri = fileUri,
                            mediaType = mediaType
                        )
                        
                        processedSoFar++

                        // Emit progress every 50 items
                        if (processedSoFar % 50 == 0) {
                            onProgress(
                                ScanProgress(
                                    phase = phase,
                                    processedItems = processedSoFar,
                                    totalItems = totalCount,
                                    currentBytes = totalSize,
                                    currentVolume = volumeName
                                ),
                                0
                            )
                        }
                    }
                }
            } finally {
                cursor?.close()
            }
        }
        
        // Final progress update
        onProgress(
            ScanProgress(
                phase = phase,
                processedItems = processedSoFar,
                totalItems = totalCount,
                currentBytes = totalSize
            ),
            cloudCount
        )

        return MediaResult(
            count = processedSoFar,
            size = totalSize
        )
    }

    /**
     * Scan documents - FIX #11: Actually scan downloads and documents
     */
    private suspend fun scanDocuments(
        onProgress: suspend (ScanProgress) -> Unit
    ): MediaResult {
        var totalCount = 0
        var totalSize = 0L
        var processedSoFar = 0

        // Android 10+: Use MediaStore.Downloads
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val projection = arrayOf(
                MediaStore.Downloads._ID,
                MediaStore.Downloads.SIZE,
                MediaStore.Downloads.DISPLAY_NAME,
                MediaStore.Downloads.MIME_TYPE
            )

            val cursor = context.contentResolver.query(
                MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                projection,
                null,
                null,
                null
            )

            cursor?.use {
                val sizeIndex = cursor.getColumnIndexOrThrow(MediaStore.Downloads.SIZE)
                totalCount = cursor.count

                while (cursor.moveToNext()) {
                    waitIfPaused()
                    
                    val size = cursor.getLong(sizeIndex)
                    if (size > 0) {
                        totalSize += size
                    }
                    processedSoFar++

                    if (processedSoFar % 50 == 0) {
                        onProgress(
                            ScanProgress(
                                phase = ScanPhase.DOCUMENTS,
                                processedItems = processedSoFar,
                                totalItems = totalCount,
                                currentBytes = totalSize,
                                currentVolume = "Downloads"
                            )
                        )
                    }
                }
            }
        }

        // Final progress
        onProgress(
            ScanProgress(
                phase = ScanPhase.DOCUMENTS,
                processedItems = processedSoFar,
                totalItems = totalCount,
                currentBytes = totalSize
            )
        )

        return MediaResult(
            count = processedSoFar,
            size = totalSize
        )
    }

    // Data classes
    private data class DiskSpaceData(
        val totalSpace: Long,
        val freeSpace: Long,
        val usedSpace: Long
    )

    private data class MediaResult(
        val count: Int,
        val size: Long
    )
}

sealed class ScanUpdate {
    data class Progress(val progress: ScanProgress) : ScanUpdate()
    data class Complete(val storageInfo: StorageInfo) : ScanUpdate()
    data class Error(val message: String) : ScanUpdate()
    object Cancelled : ScanUpdate()
}
