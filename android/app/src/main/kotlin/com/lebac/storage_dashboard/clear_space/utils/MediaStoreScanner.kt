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
import android.content.pm.PackageManager
import android.util.Log
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
    private val similarPhotoDetector = SimilarPhotoDetector(context)
    private val largeFileTracker = LargeFileTracker(20)

    private var lastSimilarPhotos: List<DuplicateFileInfo> = emptyList()
    private val photoInfos = mutableListOf<SimilarPhotoDetector.PhotoInfo>()
    
    // Smart Cleanup Cache
    private val junkFilesCache = mutableListOf<String>()
    private val emptyFoldersCache = mutableListOf<String>()
    private val safeApkFilesCache = mutableListOf<String>()
    
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
            photoInfos.clear()
            junkFilesCache.clear()
            emptyFoldersCache.clear()
            safeApkFilesCache.clear()
            lastSimilarPhotos = emptyList()
            isPaused = false
            isCancelled = false
            
            var cloudOnlyCount = 0
            
            Log.d("StorageScanner", "Phase 1: Disk Space")
            // Phase 1: Get disk space (with fallback)
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.DISK_SPACE, 0, 1, 0L)))
            val diskSpace = getDiskSpaceSafe()
            val volumes = volumeHelper.getAllVolumes()
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.DISK_SPACE, 1, 1, 0L)))

            Log.d("StorageScanner", "Phase 2: Photos")
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

            Log.d("StorageScanner", "Phase 3: Videos")
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

            Log.d("StorageScanner", "Phase 4: Audio")
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

            Log.d("StorageScanner", "Phase 5: Documents")
            // Phase 5: Documents
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.DOCUMENTS, 0, 100, 0L)))
            val documentsResult = scanDocuments { progress ->
                emit(ScanUpdate.Progress(progress))
            }
            checkCancelled()

            Log.d("StorageScanner", "Phase 6: Junk")
            // Phase 6: Junk
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.JUNK, 0, 100, 0L)))
            val junkResult = scanJunkFiles { progress ->
                emit(ScanUpdate.Progress(progress))
            }
            checkCancelled()

            Log.d("StorageScanner", "Phase 7: Empty Folders")
            // Phase 7: Empty Folders
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.EMPTY_FOLDERS, 0, 100, 0L)))
            val emptyFolderCount = scanEmptyFolders { progress ->
                emit(ScanUpdate.Progress(progress))
            }
            checkCancelled()

            Log.d("StorageScanner", "Phase 8: APKs")
            // Phase 8: APKs
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.APKS, 0, 100, 0L)))
            val apkResult = scanApks { progress ->
                emit(ScanUpdate.Progress(progress))
            }
            checkCancelled()

            Log.d("StorageScanner", "Phase 8.5: Similar Photos")
            // Phase 8.5: Similar Photos
            if (photoInfos.isNotEmpty()) {
                // [C3] Pass defensive copy to avoid shared mutable state across coroutines
                // Progress is emitted by the detector's batch callback (safe for Flow emit)
                lastSimilarPhotos = similarPhotoDetector.findSimilarPhotos(photoInfos.toList()) { processed, total ->
                    emit(ScanUpdate.Progress(ScanProgress(ScanPhase.SIMILAR_PHOTOS, processed, total, 0L)))
                }
            }
            checkCancelled()

            Log.d("StorageScanner", "Phase 9: Calculating")
            // Phase 9: Calculate final values
            emit(ScanUpdate.Progress(ScanProgress(ScanPhase.CALCULATING, 0, 1, 0L)))
            
            val filesCount = documentsResult.count + audioResult.count
            val filesSize = documentsResult.size + audioResult.size
            val mediaSize = photosResult.size + videosResult.size
            val systemSize = max(0L, diskSpace.usedSpace - mediaSize - filesSize - junkResult.size - apkResult.size)
            
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
                appsCount = getInstalledAppsCount(),
                lastUpdated = System.currentTimeMillis(),
                isEstimated = false,
                duplicateCount = duplicateStats.totalDuplicateFiles,
                duplicateSize = duplicateStats.totalDuplicateSize,
                potentialSavings = duplicateStats.potentialSavings,
                similarPhotoCount = lastSimilarPhotos.sumOf { it.files.size },
                similarPhotoSize = lastSimilarPhotos.sumOf { it.totalSize },
                largeFiles = largeFileTracker.getLargestFiles(),
                storageVolumes = volumes,
                cloudOnlyCount = cloudOnlyCount,
                scanDurationMs = scanDuration,
                junkCount = junkResult.count,
                junkSize = junkResult.size,
                emptyFolderCount = emptyFolderCount,
                apkCount = apkResult.count,
                apkSize = apkResult.size
            )

            Log.d("StorageScanner", "Phase 10: Complete")
            // Phase 10: Complete
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
     * Scan for junk files (.log, .tmp, .temp) in public storage
     */
    private suspend fun scanJunkFiles(
        onProgress: suspend (ScanProgress) -> Unit
    ): MediaResult {
        var totalCount = 0
        var totalSize = 0L
        var processedSoFar = 0

        // Only for Android 11+ where we can query Files with relative ease in public dirs
        // For older versions, this might still work or we can rely on manual file walking (not implemented here)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val projection = arrayOf(
                MediaStore.Files.FileColumns._ID,
                MediaStore.Files.FileColumns.SIZE,
                MediaStore.Files.FileColumns.DISPLAY_NAME,
                MediaStore.Files.FileColumns.MIME_TYPE,
                MediaStore.Files.FileColumns.DATA // Add DATA column
            )

            // Select non-media files with junk extensions
            val selection = "${MediaStore.Files.FileColumns.MEDIA_TYPE} = ? AND (" +
                    "${MediaStore.Files.FileColumns.DISPLAY_NAME} LIKE ? OR " +
                    "${MediaStore.Files.FileColumns.DISPLAY_NAME} LIKE ? OR " +
                    "${MediaStore.Files.FileColumns.DISPLAY_NAME} LIKE ?)"
            
            val selectionArgs = arrayOf(
                MediaStore.Files.FileColumns.MEDIA_TYPE_NONE.toString(),
                "%.log",
                "%.tmp",
                "%.temp"
            )

            val cursor = context.contentResolver.query(
                MediaStore.Files.getContentUri("external"),
                projection,
                selection,
                selectionArgs,
                null
            )

            cursor?.use {
                val sizeIndex = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.SIZE)
                // Need DATA column for path
                val dataIndex = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DATA)

                totalCount = cursor.count

                while (cursor.moveToNext()) {
                    waitIfPaused()
                    
                    val size = cursor.getLong(sizeIndex)
                    if (size > 0) {
                        totalSize += size
                        // Add to cache
                        val path = cursor.getString(dataIndex)
                        if (path != null) {
                            junkFilesCache.add(path)
                        }
                    }
                    processedSoFar++

                    if (processedSoFar % 50 == 0) {
                        onProgress(
                            ScanProgress(
                                phase = ScanPhase.JUNK,
                                processedItems = processedSoFar,
                                totalItems = totalCount,
                                currentBytes = totalSize,
                                currentVolume = "External"
                            )
                        )
                    }
                }
            }
        }

        // Final progress
        onProgress(
            ScanProgress(
                phase = ScanPhase.JUNK,
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

    /**
     * Scan for empty folders in safe public directories
     */
    private suspend fun scanEmptyFolders(
        onProgress: suspend (ScanProgress) -> Unit
    ): Int {
        var emptyCount = 0
        var scannedCount = 0

        // SAFETY: Only scan explicit public folders
        val safeRoots = listOf(
            Environment.DIRECTORY_DOWNLOADS,
            Environment.DIRECTORY_DOCUMENTS,
            Environment.DIRECTORY_DCIM,
            Environment.DIRECTORY_PICTURES,
            Environment.DIRECTORY_MUSIC,
            Environment.DIRECTORY_MOVIES,
            Environment.DIRECTORY_PODCASTS
        )
        
        val externalStorage = Environment.getExternalStorageDirectory()

        for (rootName in safeRoots) {
            val rootDir = java.io.File(externalStorage, rootName)
            if (rootDir.exists() && rootDir.isDirectory) {
                // Recursive scan
                emptyCount += scanDirForEmpty(rootDir)
                scannedCount++
                
                // Note: scanDirForEmpty doesn't return paths, it recursively counts.
                // We need to modify scanDirForEmpty or add logic here.
                // Actually scanDirForEmpty should populate the cache directly.
                 onProgress(
                    ScanProgress(
                        phase = ScanPhase.EMPTY_FOLDERS,
                        processedItems = scannedCount,
                        totalItems = 100, // Dummy
                        currentBytes = 0,
                        currentVolume = rootName
                    )
                )
            }
        }
        
        return emptyCount
    }
    
    private fun scanDirForEmpty(dir: java.io.File): Int {
        var count = 0
        val files = dir.listFiles()
        
        if (files == null) return 0 // Access denied or IO error
        
        var isEmpty = true
        var hasSubDirs = false
        
        for (file in files) {
            // SAFETY: Skip hidden files/folders (starting with .)
            if (file.name.startsWith(".")) {
                // If it contains hidden files, is it "empty"? 
                // Usually yes for cleanup purposes if ONLY hidden files exist?
                // But safer to say: if it has hidden files, it's NOT empty to avoid breaking app config.
                isEmpty = false 
                continue 
            }
            
            if (file.isDirectory) {
                hasSubDirs = true
                // Recursive call
                val subCount = scanDirForEmpty(file)
                count += subCount
                
                // If subDir is NOT empty (subCount == 0 doesn't mean it wasn't empty, 
                // it means we found 0 empty folders inside it. Wait.)
                // Actually, to know if *this* dir is empty, we need to know if subDir is empty *and* we plan to delete it?
                // Simpler logic: A folder is empty if listFiles() is empty.
                // If it contains empty subfolders, it is NOT empty itself until those subfolders are deleted.
                // We are just *counting* empty leaf nodes here.
                
                // If we want to count nested empty folders:
                // We just sum up the counts.
                // Does this dir become empty? No, unless we delete the child.
                
                isEmpty = false // It has a subdirectory, so it's not a leaf empty node.
            } else {
                // It has a file
                isEmpty = false
            }
        }
        
        if (isEmpty && files.isEmpty()) {
            // It is a leaf empty folder
            count++
            // Add to cache logic
            emptyFoldersCache.add(dir.absolutePath)
        } else if (isEmpty && hasSubDirs) {
            // Logic above had isEmpty = false if hasSubDirs. 
            // So this block is unreachable with current logic.
            // Correct logic for "Empty Folder Cleaner":
            // Usually we find leaf nodes.
        }
        
        return count
    }

    /**
     * Scan for APKs and check installation status
     */
    private suspend fun scanApks(
        onProgress: suspend (ScanProgress) -> Unit
    ): MediaResult {
        var totalCount = 0
        var totalSize = 0L
        var processedSoFar = 0

        val projection = arrayOf(
            MediaStore.Files.FileColumns._ID,
            MediaStore.Files.FileColumns.SIZE,
            MediaStore.Files.FileColumns.DISPLAY_NAME,
            MediaStore.Files.FileColumns.DATA
        )

        // Select .apk files
        val selection = "${MediaStore.Files.FileColumns.DATA} LIKE ?"
        val selectionArgs = arrayOf("%.apk")

        val cursor = context.contentResolver.query(
            MediaStore.Files.getContentUri("external"),
            projection,
            selection,
            selectionArgs,
            null
        )

        cursor?.use {
            val sizeIndex = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.SIZE)
            val dataIndex = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DATA)
            totalCount = cursor.count

            while (cursor.moveToNext()) {
                waitIfPaused()
                
                val size = cursor.getLong(sizeIndex)
                val path = cursor.getString(dataIndex)
                
                // Verify it's an APK logic (Optional: PackageParser)
                // We just count for now, and ideally we would identify which are "junk" (installed) vs "keep"
                // For this phase, we are just counting ALL APKs found in public storage.
                // Refinement: If we want to identify "Safe to Delete", we need more logic.
                // Let's implement the basic check if possible.
                
                var isInstalled = false
                try {
                    val packageInfo = context.packageManager.getPackageArchiveInfo(path, 0)
                    if (packageInfo != null) {
                        val packageName = packageInfo.packageName
                        // Check if installed
                        try {
                            val installedInfo = context.packageManager.getPackageInfo(packageName, 0)
                            // If installed, check version
                            // If installed version >= apk version, it's redundant/safe to delete.
                            // If installed version < apk version, it's an update (Keep).
                            
                            val installedVersion = installedInfo.longVersionCodeCompat()
                            val apkVersion = packageInfo.longVersionCodeCompat()
                            
                            if (installedVersion >= apkVersion) {
                                isInstalled = true
                                // Safe to delete (Installed)
                                safeApkFilesCache.add(path)
                            }
                        } catch (e: Exception) {
                            // Not installed or hidden
                        }
                    }
                } catch (e: Exception) {
                   // Corrupt APK?
                }

                if (size > 0) {
                    // For now, allow user to review ALL APKs, but we highlight installed ones in the UI list later.
                    // Here we aggregate total APKs size occupying space.
                    totalSize += size
                }
                processedSoFar++

                if (processedSoFar % 50 == 0) {
                    onProgress(
                        ScanProgress(
                            phase = ScanPhase.APKS,
                            processedItems = processedSoFar,
                            totalItems = totalCount,
                            currentBytes = totalSize,
                            currentVolume = "External"
                        )
                    )
                }
            }
        }

        // Final progress
        onProgress(
            ScanProgress(
                phase = ScanPhase.APKS,
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

    private fun android.content.pm.PackageInfo.longVersionCodeCompat(): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            longVersionCode
        } else {
            @Suppress("DEPRECATION")
            versionCode.toLong()
        }
    }

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
                        duplicateDetector.addFile(id, name, size, path, fileUri, dateModified)

                        if (mediaType == MediaType.IMAGE && path.isNotEmpty()) {
                            // [C2] Pass fileSize directly so SimilarPhotoDetector skips redundant queries
                            photoInfos.add(SimilarPhotoDetector.PhotoInfo(
                                id = id,
                                path = path, 
                                contentUri = fileUri,
                                dateModified = dateModified,
                                fileSize = size
                            ))
                        }
                        
                        // Track large files
                        largeFileTracker.addFile(
                            id = id,
                            name = name,
                            size = size,
                            mimeType = mimeType,
                            dateModified = dateModified,
                            uri = fileUri,
                            path = path,
                            mediaType = mediaType
                        )
                        
                        processedSoFar++

                        // [P7] Adaptive progress emission — reduce overhead for large datasets
                        val progressInterval = when {
                            totalCount > 5000 -> 500
                            totalCount > 1000 -> 200
                            else -> 50
                        }
                        if (processedSoFar % progressInterval == 0) {
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

    /**
     * Move files to trash (Android 11+) or delete them (Android 10)
     * Returns IntentSender for user confirmation or null if immediate success
     */
    suspend fun moveToTrash(uris: List<String>): android.content.IntentSender? {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val uriList = uris.map { Uri.parse(it) }
            val editPendingIntent = MediaStore.createTrashRequest(context.contentResolver, uriList, true)
            return editPendingIntent.intentSender
        } else {
            // Android 10 and below: Try to delete directly. 
            // If strictly Android 10, it might throw RecoverableSecurityException which needs to be handled by caller
            deletePermanently(uris)
            return null
        }
    }

    /**
     * Delete files permanently
     * Returns IntentSender for user confirmation (Android 11+) or null
     */
    suspend fun deletePermanently(uris: List<String>): android.content.IntentSender? {
        val uriList = uris.map { Uri.parse(it) }
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val deletePendingIntent = MediaStore.createDeleteRequest(context.contentResolver, uriList)
            return deletePendingIntent.intentSender
        } else {
            // Pre-Android 11
            for (uri in uriList) {
                context.contentResolver.delete(uri, null, null)
            }
            return null
        }
    }

    /**
     * Get detailed duplicate files list
     */
    fun getDuplicateFiles(): Map<String, List<Map<String, Any>>> {
        val duplicates = duplicateDetector.getDuplicates()
        return duplicates.associate { group ->
            group.signature to group.files.map { file ->
                mapOf(
                    "id" to file.id,
                    "name" to file.name,
                    "size" to file.size,
                    "path" to file.path,
                    "uri" to file.uri,
                    "dateModified" to file.dateModified
                )
            }
        }
    }

    fun getSimilarPhotos(): Map<String, List<Map<String, Any>>> {
        return lastSimilarPhotos.associate { group ->
            group.signature to group.files.map { file ->
                file.toMap()
            }
        }
    }

    /**
     * Get photos with pagination
     */
    fun getPhotos(limit: Int, offset: Int): List<Map<String, Any>> {
        val photos = mutableListOf<Map<String, Any>>()
        
        Log.d("MediaStoreScanner", "getPhotos START: limit=$limit, offset=$offset, SDK=${Build.VERSION.SDK_INT}")
        
        // Android 10+ (Q): MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL)
        // Pre-Q: MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        val collection = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL)
        } else {
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        }
        
        Log.d("MediaStoreScanner", "getPhotos collection URI: $collection")

        val projection = arrayOf(
            MediaStore.Images.Media._ID,
            MediaStore.Images.Media.DISPLAY_NAME,
            MediaStore.Images.Media.SIZE,
            MediaStore.Images.Media.DATE_MODIFIED,
            MediaStore.Images.Media.DATA // Path
        )

        try {
            val cursor = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                // API 26+: Use Bundle for query arguments (supports LIMIT/OFFSET safely)
                val bundle = android.os.Bundle().apply {
                    // Limit & Offset (API 30 constants, but string keys work on 26+)
                    putInt(ContentResolver.QUERY_ARG_LIMIT, limit)
                    putInt(ContentResolver.QUERY_ARG_OFFSET, offset)
                    
                    // Sort (API 26+)
                    putStringArray(
                        ContentResolver.QUERY_ARG_SORT_COLUMNS, 
                        arrayOf(MediaStore.Images.Media.DATE_MODIFIED)
                    )
                    putInt(
                        ContentResolver.QUERY_ARG_SORT_DIRECTION, 
                        ContentResolver.QUERY_SORT_DIRECTION_DESCENDING
                    )
                }
                
                Log.d("MediaStoreScanner", "getPhotos using Bundle API (API ${Build.VERSION.SDK_INT})")
                context.contentResolver.query(
                    collection,
                    projection,
                    bundle,
                    null
                )
            } else {
                // Pre-O: Fallback to SQL hack in sortOrder
                val sortOrder = "${MediaStore.Images.Media.DATE_MODIFIED} DESC LIMIT $limit OFFSET $offset"
                Log.d("MediaStoreScanner", "getPhotos using sortOrder hack: $sortOrder")
                context.contentResolver.query(
                    collection,
                    projection,
                    null,
                    null,
                    sortOrder
                )
            }

            Log.d("MediaStoreScanner", "getPhotos cursor: ${cursor != null}, count: ${cursor?.count ?: "null"}")
            
            cursor?.use {
                val idColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.Media._ID)
                val nameColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DISPLAY_NAME)
                val sizeColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.SIZE)
                val dateColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATE_MODIFIED)
                val dataColumn = cursor.getColumnIndex(MediaStore.Images.Media.DATA)
                
                Log.d("MediaStoreScanner", "getPhotos columns: id=$idColumn, name=$nameColumn, size=$sizeColumn, date=$dateColumn, data=$dataColumn")

                while (cursor.moveToNext()) {
                     val id = cursor.getLong(idColumn)
                     val name = cursor.getString(nameColumn) ?: "unknown"
                     val size = cursor.getLong(sizeColumn)
                     val dateModified = cursor.getLong(dateColumn)
                     val path = if (dataColumn >= 0) cursor.getString(dataColumn) ?: "" else ""
                     
                     Log.d("MediaStoreScanner", "getPhotos found: id=$id, name=$name, size=$size, path=$path")
                     
                     val contentUri = ContentUris.withAppendedId(collection, id)

                     photos.add(mapOf(
                         "id" to id,
                         "name" to name,
                         "size" to size,
                         "dateModified" to dateModified,
                         "path" to path,
                         "uri" to contentUri.toString()
                     ))
                }
            }
        } catch (e: Exception) {
            Log.e("MediaStoreScanner", "Error fetching photos: ${e.message}", e)
        }
        
        Log.d("MediaStoreScanner", "getPhotos END: returning ${photos.size} photos")
        return photos
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
    
    /**
     * Smart Cleanup Logic
     */
    suspend fun cleanJunk(types: List<String>): Map<String, Any> {
        var deletedCount = 0
        var deletedBytes = 0L

        if (types.contains("junk")) {
            val iter = junkFilesCache.iterator()
            while (iter.hasNext()) {
                val path = iter.next()
                // [F3] Track file size before deletion
                val fileSize = java.io.File(path).let { if (it.exists()) it.length() else 0L }
                if (deleteSingleFile(path)) {
                    deletedCount++
                    deletedBytes += fileSize
                    iter.remove()
                }
            }
        }

        if (types.contains("empty_folders")) {
             // Delete in reverse order of depth (longest path first)
             val sorted = emptyFoldersCache.sortedByDescending { it.length }
             val remaining = mutableListOf<String>()
             for (path in sorted) {
                 if (deleteSingleFile(path)) {
                     deletedCount++
                     // Empty folders contribute 0 bytes, no need to track
                 } else {
                     remaining.add(path)
                 }
             }
             emptyFoldersCache.clear()
             emptyFoldersCache.addAll(remaining)
        }

        if (types.contains("apks")) {
            val iter = safeApkFilesCache.iterator()
            while (iter.hasNext()) {
                val path = iter.next()
                // [F3] Track file size before deletion
                val fileSize = java.io.File(path).let { if (it.exists()) it.length() else 0L }
                if (deleteSingleFile(path)) {
                    deletedCount++
                    deletedBytes += fileSize
                    iter.remove()
                }
            }
        }
        
        return mapOf("count" to deletedCount, "bytes" to deletedBytes)
    }

    /**
     * [S3] Delete a file with scoped storage awareness.
     * On Android 11+ without MANAGE_EXTERNAL_STORAGE, java.io.File.delete() may fail.
     * Falls back to ContentResolver delete via MediaStore URI lookup.
     */
    private fun deleteSingleFile(path: String): Boolean {
        val file = java.io.File(path)
        return try {
            // Try direct delete first (works if we have MANAGE_EXTERNAL_STORAGE or own the file)
            if (file.delete()) {
                return true
            }
            
            // [S3] Fallback: Try deleting via MediaStore for scoped storage compliance
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && !file.isDirectory) {
                val contentUri = MediaStore.Files.getContentUri("external")
                val selection = "${MediaStore.Files.FileColumns.DATA} = ?"
                val selectionArgs = arrayOf(path)
                val deleted = context.contentResolver.delete(contentUri, selection, selectionArgs)
                return deleted > 0
            }
            
            false
        } catch (e: Exception) {
            Log.w("MediaStoreScanner", "Failed to delete $path: ${e.message}")
            false
        }
    }

    private fun getInstalledAppsCount(): Int {
        return try {
            // Policy-safe: Use queryIntentActivities with MAIN/LAUNCHER intent
            // instead of getInstalledApplications (which requires QUERY_ALL_PACKAGES).
            // This returns only user-visible, launchable apps.
            val mainIntent = android.content.Intent(android.content.Intent.ACTION_MAIN, null)
            mainIntent.addCategory(android.content.Intent.CATEGORY_LAUNCHER)
            val apps = context.packageManager.queryIntentActivities(mainIntent, 0)
            apps.size
        } catch (e: Exception) {
            Log.e("MediaStoreScanner", "Error counting apps", e)
            0
        }
    }
}

sealed class ScanUpdate {
    data class Progress(val progress: ScanProgress) : ScanUpdate()
    data class Complete(val storageInfo: StorageInfo) : ScanUpdate()
    data class Error(val message: String) : ScanUpdate()
    object Cancelled : ScanUpdate()
}
