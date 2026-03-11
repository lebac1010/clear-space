package com.movixalabs.cleanmaster.models

data class StorageInfo(
    // Disk space
    val totalSpace: Long,
    val freeSpace: Long,
    val usedSpace: Long,
    
    // Media counts & sizes
    val photosCount: Int,
    val photosSize: Long,
    val videosCount: Int,
    val videosSize: Long,
    val audioCount: Int,
    val audioSize: Long,
    val documentsCount: Int,
    val documentsSize: Long,
    
    // Derived
    val filesCount: Int,
    val filesSize: Long,
    val systemSize: Long,
    val appsCount: Int,
    
    // Metadata
    val lastUpdated: Long,
    val isEstimated: Boolean,
    
    // NEW: Enhanced features
    val duplicateCount: Int,
    val duplicateSize: Long,
    val potentialSavings: Long,
    val similarPhotoCount: Int,
    val similarPhotoSize: Long,
    val largeFiles: List<LargeFileInfo>,
    val storageVolumes: List<StorageVolumeInfo>,
    val cloudOnlyCount: Int,
    val scanDurationMs: Long,
    // NEW: Junk stats
    val junkCount: Int,
    val junkSize: Long,
    val emptyFolderCount: Int,
    val apkCount: Int, // NEW
    val apkSize: Long // NEW
) {
    fun toMap(): Map<String, Any> = mapOf(
        "totalSpace" to totalSpace,
        "freeSpace" to freeSpace,
        "usedSpace" to usedSpace,
        "photosCount" to photosCount,
        "photosSize" to photosSize,
        "videosCount" to videosCount,
        "videosSize" to videosSize,
        "audioCount" to audioCount,
        "audioSize" to audioSize,
        "documentsCount" to documentsCount,
        "documentsSize" to documentsSize,
        "filesCount" to filesCount,
        "filesSize" to filesSize,
        "systemSize" to systemSize,
        "appsCount" to appsCount,
        "lastUpdated" to lastUpdated,
        "isEstimated" to isEstimated,
        "duplicateCount" to duplicateCount,
        "duplicateSize" to duplicateSize,
        "potentialSavings" to potentialSavings,
        "similarPhotoCount" to similarPhotoCount,
        "similarPhotoSize" to similarPhotoSize,
        "largeFiles" to largeFiles.map { it.toMap() },
        "storageVolumes" to storageVolumes.map { it.toMap() },
        "cloudOnlyCount" to cloudOnlyCount,
        "scanDurationMs" to scanDurationMs,
        "junkCount" to junkCount,
        "junkSize" to junkSize,
        "emptyFolderCount" to emptyFolderCount,
        "apkCount" to apkCount,
        "apkSize" to apkSize
    )
}
