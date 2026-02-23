package com.lebac.storage_dashboard.clear_space.utils

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.net.Uri
import android.provider.MediaStore
import android.util.Log
import com.lebac.storage_dashboard.clear_space.models.DuplicateFileInfo
import com.lebac.storage_dashboard.clear_space.models.DuplicateItem
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
class SimilarPhotoDetector(private val context: Context) {

    // Threshold for Hamming Distance (0-64). <= 5 implies ~90% similarity.
    private val SIMILARITY_THRESHOLD = 5
    
    // Safety: Exclude specific folders to avoid false positives on docs/screenshots
    private val EXCLUDED_FOLDERS = listOf("documents", "document", "screenshot", "screenshots", "notes", "invoice", "receipt")

    /**
     * Data class to carry both path and content URI for each photo.
     */
    data class PhotoInfo(
        val id: Long,
        val path: String,
        val contentUri: String,
        val dateModified: Long
    )

    fun findSimilarPhotos(photos: List<PhotoInfo>): List<DuplicateFileInfo> {
        Log.d("SimilarPhotoDetector", "findSimilarPhotos called with ${photos.size} photos")
        val groups = mutableListOf<SimilarGroup>()
        
        for (photoInfo in photos) {
            val path = photoInfo.path
            val uriString = photoInfo.contentUri
            
            // Safety Check 1: Folder Exclusion
            if (isExcludedFolder(path)) {
                Log.d("SimilarPhotoDetector", "Skipping excluded folder: $path")
                continue
            }

            // Safety Check 2: File Size (skip too small images, icons)
            val fileSize = getFileSizeFromUri(uriString)
            if (fileSize < 50 * 1024) {
                Log.d("SimilarPhotoDetector", "Skipping small file ($fileSize bytes): $path")
                continue
            }

            val hash = computePHash(uriString) ?: run {
                Log.w("SimilarPhotoDetector", "Failed to compute pHash for: $path (uri: $uriString)")
                continue
            }
            
            Log.d("SimilarPhotoDetector", "Computed pHash for $path: $hash")
            
            var addedToGroup = false
            for (group in groups) {
                val distance = calculateHammingDistance(group.representativeHash, hash)
                if (distance <= SIMILARITY_THRESHOLD) {
                    Log.d("SimilarPhotoDetector", "Photo $path matches group (distance=$distance)")
                    group.items.add(
                        DuplicateItem(
                            id = photoInfo.id,
                            name = path.substringAfterLast("/"),
                            size = fileSize,
                            path = path,
                            uri = uriString,
                            dateModified = photoInfo.dateModified
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
                                id = photoInfo.id,
                                name = path.substringAfterLast("/"),
                                size = fileSize,
                                path = path,
                                uri = uriString,
                                dateModified = photoInfo.dateModified
                            )
                        )
                    )
                )
            }
        }

        // Convert to result format (only groups with > 1 item)
        val result = groups
            .filter { it.items.size > 1 }
            .map { group ->
                val totalSize = group.items.sumOf { it.size }
                val savings = totalSize - group.items.maxOf { it.size }
                
                DuplicateFileInfo(
                    signature = group.representativeHash.toString(),
                    files = group.items,
                    totalSize = totalSize,
                    savingsIfDeleted = savings,
                    type = "SIMILAR"
                )
            }
        
        Log.d("SimilarPhotoDetector", "findSimilarPhotos result: ${result.size} similar groups found")
        return result
    }
    
    private fun isExcludedFolder(path: String): Boolean {
        val lowerPath = path.lowercase()
        return EXCLUDED_FOLDERS.any { lowerPath.contains("/$it/") || lowerPath.contains("/$it") }
    }

    /**
     * Get file size from content URI via ContentResolver.
     */
    private fun getFileSizeFromUri(uriString: String): Long {
        return try {
            val uri = Uri.parse(uriString)
            val cursor = context.contentResolver.query(
                uri,
                arrayOf(MediaStore.MediaColumns.SIZE),
                null, null, null
            )
            cursor?.use {
                if (it.moveToFirst()) {
                    it.getLong(0)
                } else 0L
            } ?: 0L
        } catch (e: Exception) {
            Log.e("SimilarPhotoDetector", "Error getting file size from $uriString: ${e.message}")
            0L
        }
    }

    /**
     * Compute pHash using ContentResolver InputStream (scoped storage safe).
     */
    private fun computePHash(uriString: String): Long? {
        try {
            val uri = Uri.parse(uriString)
            
            // Use ContentResolver to open stream (works with scoped storage)
            val inputStream = context.contentResolver.openInputStream(uri) ?: run {
                Log.e("SimilarPhotoDetector", "openInputStream returned null for $uriString")
                return null
            }
            
            val options = BitmapFactory.Options()
            options.inPreferredConfig = Bitmap.Config.ARGB_8888
            options.inSampleSize = 4 
            
            var bitmap = BitmapFactory.decodeStream(inputStream, null, options)
            inputStream.close()
            
            if (bitmap == null) {
                Log.e("SimilarPhotoDetector", "BitmapFactory.decodeStream returned null for $uriString")
                return null
            }
            
            // 1. Resize to 32x32
            bitmap = Bitmap.createScaledBitmap(bitmap, 32, 32, true)
            
            // 2. Grayscale & 3. DCT
            val vals = DoubleArray(32 * 32)
            for (y in 0 until 32) {
                for (x in 0 until 32) {
                    val pixel = bitmap.getPixel(x, y)
                    val gray = 0.299 * Color.red(pixel) + 0.587 * Color.green(pixel) + 0.114 * Color.blue(pixel)
                    vals[y * 32 + x] = gray
                }
            }
            bitmap.recycle()
            
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
            Log.e("SimilarPhotoDetector", "Error computing pHash: ${e.message}", e)
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

