package com.lebac.storage_dashboard.clear_space.models

data class ScanProgress(
    val phase: ScanPhase,
    val processedItems: Int,
    val totalItems: Int,
    val currentBytes: Long,
    val currentVolume: String? = null,
    val isPaused: Boolean = false
) {
    fun toMap(): Map<String, Any?> = mapOf(
        "phase" to phase.name,
        "processedItems" to processedItems,
        "totalItems" to totalItems,
        "currentBytes" to currentBytes,
        "currentVolume" to currentVolume,
        "isPaused" to isPaused
    )
    
    val percentage: Double
        get() = if (totalItems == 0) 0.0 else processedItems.toDouble() / totalItems
}

enum class ScanPhase {
    DISK_SPACE,
    PHOTOS,
    VIDEOS,
    AUDIO,
    DOCUMENTS,
    JUNK,
    EMPTY_FOLDERS,
    APKS,
    SIMILAR_PHOTOS,
    CALCULATING,
    COMPLETE,
    PAUSED,
    CANCELLED,
    ERROR
}
