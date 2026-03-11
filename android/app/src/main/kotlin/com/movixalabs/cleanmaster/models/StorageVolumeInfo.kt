package com.movixalabs.cleanmaster.models

data class StorageVolumeInfo(
    val name: String,
    val path: String,
    val totalSpace: Long,
    val freeSpace: Long,
    val isRemovable: Boolean,
    val isPrimary: Boolean
) {
    fun toMap(): Map<String, Any> = mapOf(
        "name" to name,
        "path" to path,
        "totalSpace" to totalSpace,
        "freeSpace" to freeSpace,
        "isRemovable" to isRemovable,
        "isPrimary" to isPrimary
    )
}
