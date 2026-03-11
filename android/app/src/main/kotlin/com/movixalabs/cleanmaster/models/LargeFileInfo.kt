package com.movixalabs.cleanmaster.models

data class LargeFileInfo(
    val id: Long,
    val name: String,
    val size: Long,
    val mimeType: String,
    val dateModified: Long,
    val uri: String,
    val path: String,
    val mediaType: MediaType
) {
    fun toMap(): Map<String, Any> = mapOf(
        "id" to id,
        "name" to name,
        "size" to size,
        "mimeType" to mimeType,
        "dateModified" to dateModified,
        "uri" to uri,
        "path" to path,
        "mediaType" to mediaType.name
    )
}

enum class MediaType {
    IMAGE, VIDEO, AUDIO, DOCUMENT, OTHER
}
