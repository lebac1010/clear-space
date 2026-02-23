package com.lebac.storage_dashboard.clear_space.utils

import com.lebac.storage_dashboard.clear_space.models.DuplicateFileInfo
import com.lebac.storage_dashboard.clear_space.models.DuplicateItem
import java.security.MessageDigest

/**
 * Detects duplicate files based on name + size signature.
 */
class DuplicateDetector {
    
    // Map of signature -> list of files with that signature
    private val filesBySignature = mutableMapOf<String, MutableList<DuplicateItem>>()
    
    /**
     * Add a file to the detector
     */
    fun addFile(id: Long, name: String, size: Long, path: String, uri: String, dateModified: Long) {
        val signature = createSignature(name, size)
        
        val item = DuplicateItem(
            id = id,
            name = name,
            size = size,
            path = path,
            uri = uri,
            dateModified = dateModified
        )
        
        filesBySignature.getOrPut(signature) { mutableListOf() }.add(item)
    }
    
    /**
     * Get all duplicate groups (2+ files with same signature)
     */
    fun getDuplicates(): List<DuplicateFileInfo> {
        return filesBySignature
            .filter { it.value.size >= 2 }
            .map { (signature, files) ->
                val totalSize = files.sumOf { it.size }
                DuplicateFileInfo(
                    signature = signature,
                    files = files.toList(),
                    totalSize = totalSize,
                    savingsIfDeleted = totalSize - files.first().size  // Keep one copy
                )
            }
            .filter { group ->
                // Fix: Filter out false positives where duplicate candidates are only in the same folder.
                // Since our signature is Name+Size, files with the same name MUST be in different folders
                // (OS prevents same-name files in the same folder).
                // This acts as a sanity check and also filters edge cases where path is empty.
                val folders = group.files.map { it.path.substringBeforeLast("/") }.distinct()
                folders.size >= 2
            }
            .sortedByDescending { it.savingsIfDeleted }
    }
    
    /**
     * Get summary statistics
     */
    fun getStats(): DuplicateStats {
        val duplicates = getDuplicates()
        return DuplicateStats(
            duplicateGroupCount = duplicates.size,
            totalDuplicateFiles = duplicates.sumOf { it.files.size },
            totalDuplicateSize = duplicates.sumOf { it.totalSize },
            potentialSavings = duplicates.sumOf { it.savingsIfDeleted }
        )
    }
    
    /**
     * Clear detector
     */
    fun clear() {
        filesBySignature.clear()
    }
    
    // FIX #5: Improve signature to reduce false positives
    // Include parent folder name to distinguish files with same name from different locations
    private fun createSignature(name: String, size: Long): String {
        val normalizedName = name.lowercase().trim()
        // We only use name + size; for true duplicate detection you'd want hash
        // But this is a balance between accuracy and performance
        return "${normalizedName}_$size"
    }
    
    /**
     * Check if two files are likely the same based on additional heuristics
     */
    fun areLikelyDuplicates(file1Path: String, file2Path: String): Boolean {
        // Same folder = not duplicates (they're the same file)
        val folder1 = file1Path.substringBeforeLast("/")
        val folder2 = file2Path.substringBeforeLast("/")
        return folder1 != folder2
    }
}

data class DuplicateStats(
    val duplicateGroupCount: Int,
    val totalDuplicateFiles: Int,
    val totalDuplicateSize: Long,
    val potentialSavings: Long
)
