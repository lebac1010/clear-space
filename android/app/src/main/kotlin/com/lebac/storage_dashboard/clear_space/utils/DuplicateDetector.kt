package com.lebac.storage_dashboard.clear_space.utils

import com.lebac.storage_dashboard.clear_space.models.DuplicateFileInfo
import com.lebac.storage_dashboard.clear_space.models.DuplicateItem

/**
 * Detects duplicate files based on name + size signature.
 * 
 * [P1] Results are cached after first computation and invalidated on addFile/clear.
 * [F1] Signature includes normalized extension for robustness.
 * [F2] savingsIfDeleted keeps the largest file (consistent with SimilarPhotoDetector).
 */
class DuplicateDetector {
    
    // Map of signature -> list of files with that signature
    private val filesBySignature = mutableMapOf<String, MutableList<DuplicateItem>>()
    
    // [P1] Cached result — invalidated when data changes
    private var cachedDuplicates: List<DuplicateFileInfo>? = null
    
    /**
     * Add a file to the detector. Invalidates cached results.
     */
    fun addFile(id: Long, name: String, size: Long, path: String, uri: String, dateModified: Long) {
        cachedDuplicates = null // [P1] Invalidate cache
        
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
     * Get all duplicate groups (2+ files with same signature).
     * [P1] Results are cached — subsequent calls return immediately.
     */
    fun getDuplicates(): List<DuplicateFileInfo> {
        cachedDuplicates?.let { return it }
        
        val result = filesBySignature
            .filter { it.value.size >= 2 }
            .map { (signature, files) ->
                val totalSize = files.sumOf { it.size }
                DuplicateFileInfo(
                    signature = signature,
                    files = files.toList(),
                    totalSize = totalSize,
                    // [F2] Keep the largest file, consistent with SimilarPhotoDetector
                    savingsIfDeleted = totalSize - files.maxOf { it.size }
                )
            }
            .filter { group ->
                // Filter out false positives where all files are in the same folder.
                // Since signature is Name+Size, files with same name MUST be in different folders
                // (OS prevents same-name files in the same folder).
                // Also filter edge cases where path is empty.
                val folders = group.files.map { it.path.substringBeforeLast("/") }.distinct()
                folders.size >= 2
            }
            .sortedByDescending { it.savingsIfDeleted }
        
        cachedDuplicates = result // [P1] Cache the result
        return result
    }
    
    /**
     * Get summary statistics.
     * [P1] Uses cached getDuplicates() — no redundant computation.
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
     * Clear detector. Invalidates cache.
     */
    fun clear() {
        filesBySignature.clear()
        cachedDuplicates = null // [P1] Invalidate cache
    }
    
    /**
     * [F1] Improved signature to reduce false positives.
     * Uses normalized name + size + extension for better discrimination.
     * Two files with same name and size but different extensions are NOT duplicates.
     */
    private fun createSignature(name: String, size: Long): String {
        val normalizedName = name.lowercase().trim()
        val extension = normalizedName.substringAfterLast('.', "")
        // Separate extension in signature ensures "photo.jpg" (100KB) and "photo.png" (100KB)
        // are NOT treated as duplicates even if they happen to have the same size.
        return "${normalizedName}_${extension}_$size"
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
