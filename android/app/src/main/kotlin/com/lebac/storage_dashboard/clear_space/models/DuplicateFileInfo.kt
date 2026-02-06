package com.lebac.storage_dashboard.clear_space.models

data class DuplicateFileInfo(
    val signature: String,  // name_size hash
    val files: List<DuplicateItem>,
    val totalSize: Long,
    val savingsIfDeleted: Long  // Total size - one copy
) {
    fun toMap(): Map<String, Any> = mapOf(
        "signature" to signature,
        "files" to files.map { it.toMap() },
        "totalSize" to totalSize,
        "savingsIfDeleted" to savingsIfDeleted
    )
}

data class DuplicateItem(
    val id: Long,
    val name: String,
    val size: Long,
    val path: String,
    val uri: String
) {
    fun toMap(): Map<String, Any> = mapOf(
        "id" to id,
        "name" to name,
        "size" to size,
        "path" to path,
        "uri" to uri
    )
}
