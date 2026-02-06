package com.lebac.storage_dashboard.clear_space.models

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
    
    // Metadata
    val lastUpdated: Long,
    val isEstimated: Boolean,
    
    // NEW: Enhanced features
    val duplicateCount: Int,
    val duplicateSize: Long,
    val potentialSavings: Long,
    val largeFiles: List<LargeFileInfo>,
    val storageVolumes: List<StorageVolumeInfo>,
    val cloudOnlyCount: Int,
    val scanDurationMs: Long
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
        "lastUpdated" to lastUpdated,
        "isEstimated" to isEstimated,
        "duplicateCount" to duplicateCount,
        "duplicateSize" to duplicateSize,
        "potentialSavings" to potentialSavings,
        "largeFiles" to largeFiles.map { it.toMap() },
        "storageVolumes" to storageVolumes.map { it.toMap() },
        "cloudOnlyCount" to cloudOnlyCount,
        "scanDurationMs" to scanDurationMs
    )
}
