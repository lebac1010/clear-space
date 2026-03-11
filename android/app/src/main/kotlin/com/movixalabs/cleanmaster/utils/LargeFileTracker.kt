package com.movixalabs.cleanmaster.utils

import com.movixalabs.cleanmaster.models.LargeFileInfo
import com.movixalabs.cleanmaster.models.MediaType
import java.util.PriorityQueue

/**
 * Tracks the top N largest files efficiently using a min-heap.
 */
class LargeFileTracker(private val maxFiles: Int = 20) {
    
    // Min-heap: smallest of the large files is at the root
    private val heap = PriorityQueue<LargeFileInfo>(maxFiles + 1, compareBy { it.size })
    
    /**
     * Add a file to the tracker. Only keeps top N largest.
     */
    fun addFile(
        id: Long,
        name: String,
        size: Long,
        mimeType: String,
        dateModified: Long,
        uri: String,
        path: String,
        mediaType: MediaType
    ) {
        val file = LargeFileInfo(
            id = id,
            name = name,
            size = size,
            mimeType = mimeType,
            dateModified = dateModified,
            uri = uri,
            path = path,
            mediaType = mediaType
        )
        
        if (heap.size < maxFiles) {
            // Haven't filled up yet
            heap.add(file)
        } else if (size > heap.peek()!!.size) {
            // This file is larger than the smallest in our top N
            heap.poll()  // Remove smallest
            heap.add(file)  // Add new file
        }
        // else: file is smaller than all our top N, ignore
    }
    
    /**
     * Get the top N largest files, sorted by size descending
     */
    fun getLargestFiles(): List<LargeFileInfo> {
        return heap.toList().sortedByDescending { it.size }
    }
    
    /**
     * Get total size of all tracked large files
     */
    fun getTotalSize(): Long {
        return heap.sumOf { it.size }
    }
    
    /**
     * Clear tracker
     */
    fun clear() {
        heap.clear()
    }
}
