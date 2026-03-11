package com.movixalabs.cleanmaster.models

data class DuplicateFileInfo(
    val signature: String,  // name_size hash
    val files: List<DuplicateItem>,
    val totalSize: Long,
    val savingsIfDeleted: Long,  // Total size - one copy
    val type: String = "EXACT" // EXACT or SIMILAR
) {
    fun toMap(): Map<String, Any> = mapOf(
        "signature" to signature,
        "files" to files.map { it.toMap() },
        "totalSize" to totalSize,
        "savingsIfDeleted" to savingsIfDeleted,
        "type" to type
    )
}

data class DuplicateItem(
    val id: Long,
    val name: String,
    val size: Long,
    val path: String,
    val uri: String,
    val dateModified: Long
) {
    fun toMap(): Map<String, Any> = mapOf(
        "id" to id,
        "name" to name,
        "size" to size,
        "path" to path,
        "uri" to uri,
        "dateModified" to dateModified
    )
}
