package com.lebac.storage_dashboard.clear_space.utils

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.media.ThumbnailUtils
import com.lebac.storage_dashboard.clear_space.models.DuplicateFileInfo
import com.lebac.storage_dashboard.clear_space.models.DuplicateItem
import java.io.File
import kotlin.math.cos
import kotlin.math.PI

/**
 * Detects similar photos using Perceptual Hashing (pHash).
 * 
 * Algorithm:
 * 1. Resize to 32x32.
 * 2. Convert to grayscale.
 * 3. Compute DCT (Discrete Cosine Transform).
 * 4. Take top-left 8x8 (low frequencies).
 * 5. Compute average value.
 * 6. Construct 64-bit hash (1 if > average, 0 if < average).
 * 7. Compare Hamming Distance (<= 5 is similar).
 */
class SimilarPhotoDetector {

    // Threshold for Hamming Distance (0-64). <= 5 implies ~90% similarity.
    private val SIMILARITY_THRESHOLD = 5
    
    // Safety: Exclude specific folders to avoid false positives on docs/screenshots
    private val EXCLUDED_FOLDERS = listOf("documents", "document", "screenshot", "screenshots", "notes", "invoice", "receipt")

    fun findSimilarPhotos(filePaths: List<String>): List<DuplicateFileInfo> {
        val hashes = mutableMapOf<Long, DuplicateItem>() // store hash -> first item (if we were doing exact) - wait, we need needed pairwise or grouping.
        // Actually for pHash grouping, we need to compare every new hash with existing group representatives.
        
        // Structure: List of Groups. Each Group has a "Representative Hash".
        val groups = mutableListOf<SimilarGroup>()
        
        for (path in filePaths) {
            val file = File(path)
            if (!file.exists()) continue
            
            // Safety Check 1: Folder Exclusion
            if (isExcludedFolder(path)) continue
            
            // Safety Check 2: File Size (skip too small images, icons)
            if (file.length() < 50 * 1024) continue // < 50KB skip

            val hash = computePHash(path) ?: continue
            
            var addedToGroup = false
            for (group in groups) {
                if (calculateHammingDistance(group.representativeHash, hash) <= SIMILARITY_THRESHOLD) {
                    group.items.add(
                        DuplicateItem(
                            id = hash, // Use hash as ID for now or generate distinct? Item needs actual ID. 
                            // Wait, input only has path. We need ID/Size/Date from scanner. 
                            // For simplicity in this specialized detector, we might need to parse file stats or accept rich objects.
                            // Let's assume for now we construct DuplicateItem from File.
                            name = file.name,
                            size = file.length(),
                            path = path,
                            uri = "file://$path", // Placeholder URI, real one should come from MediaStore
                            dateModified = file.lastModified()
                        )
                    )
                    addedToGroup = true
                    break
                }
            }
            
            if (!addedToGroup) {
                groups.add(
                    SimilarGroup(
                        representativeHash = hash,
                        items = mutableListOf(
                             DuplicateItem(
                                id = hash,
                                name = file.name,
                                size = file.length(),
                                path = path,
                                uri = "file://$path",
                                dateModified = file.lastModified()
                            )
                        )
                    )
                )
            }
        }

        // Convert to result format (only groups with > 1 item)
        return groups
            .filter { it.items.size > 1 }
            .map { group ->
                val totalSize = group.items.sumOf { it.size }
                // Smart Select logic will be in UI, here we just return the group
                val savings = totalSize - group.items.maxOf { it.size } // Keep largest
                
                DuplicateFileInfo(
                    signature = group.representativeHash.toString(), // Use hash as signature
                    files = group.items,
                    totalSize = totalSize,
                    savingsIfDeleted = savings,
                    type = "SIMILAR"
                )
            }
    }
    
    private fun isExcludedFolder(path: String): Boolean {
        val lowerPath = path.lowercase()
        return EXCLUDED_FOLDERS.any { lowerPath.contains("/$it/") || lowerPath.contains("/$it") }
    }

    private fun computePHash(path: String): Long? {
        try {
            val options = BitmapFactory.Options()
            options.inPreferredConfig = Bitmap.Config.ARGB_8888
            // Decode smaller to save memory
            options.inSampleSize = 4 
            
            var bitmap = BitmapFactory.decodeFile(path, options) ?: return null
            
            // 1. Resize to 32x32
            bitmap = Bitmap.createScaledBitmap(bitmap, 32, 32, true)
            
            // 2. Grayscale & 3. DCT
            // Simplified: We can do DCT on 32x32 matrix.
            // Converting to grayscale array
            val vals = DoubleArray(32 * 32)
            for (y in 0 until 32) {
                for (x in 0 until 32) {
                    val pixel = bitmap.getPixel(x, y)
                    // Luminance formula
                    val gray = 0.299 * Color.red(pixel) + 0.587 * Color.green(pixel) + 0.114 * Color.blue(pixel)
                    vals[y * 32 + x] = gray
                }
            }
            bitmap.recycle() // Clean up
            
            // 4. Compute DCT
            val dctVals = applyDCT(vals, 32)
            
            // 5. Reduce to 8x8 (top-left) and compute average (exclude DC at 0,0)
            var total = 0.0
            val subMatrix = DoubleArray(64)
            var idx = 0
            for (y in 0 until 8) {
                for (x in 0 until 8) {
                    subMatrix[idx] = dctVals[y * 32 + x]
                    if (x != 0 || y != 0) {
                        total += subMatrix[idx]
                    }
                    idx++
                }
            }
            val avg = total / 63.0
            
            // 6. Compute Hash
            var hash: Long = 0
            for (i in 0 until 64) {
                 if (subMatrix[i] >= avg) {
                     hash = hash or (1L shl i)
                 }
            }
            
            return hash
        } catch (e: Exception) {
            e.printStackTrace()
            return null
        }
    }
    
    // 1D DCT implementation for 32x32 input flatted
    private fun applyDCT(f: DoubleArray, N: Int): DoubleArray {
        val F = DoubleArray(N * N)
        val c = DoubleArray(N)
        c[0] = 1.0 / Math.sqrt(2.0)
        for (i in 1 until N) c[i] = 1.0
        
        for (u in 0 until N) {
            for (v in 0 until N) {
                var sum = 0.0
                for (i in 0 until N) {
                    for (j in 0 until N) {
                         sum += Math.cos(((2 * i + 1) * u * PI) / (2 * N)) *
                                Math.cos(((2 * j + 1) * v * PI) / (2 * N)) *
                                f[i * N + j]
                    }
                }
                F[u * N + v] = 0.25 * c[u] * c[v] * sum
            }
        }
        return F
    }

    private fun calculateHammingDistance(hash1: Long, hash2: Long): Int {
        var x = hash1 xor hash2
        var dist = 0
        while (x != 0L) {
            dist++
            x = x and (x - 1)
        }
        return dist
    }
    
    private data class SimilarGroup(
        val representativeHash: Long,
        val items: MutableList<DuplicateItem>
    )
}
