package com.lebac.storage_dashboard.clear_space.utils

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.net.Uri
import android.util.Log
import com.lebac.storage_dashboard.clear_space.models.DuplicateFileInfo
import com.lebac.storage_dashboard.clear_space.models.DuplicateItem
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlin.math.PI
import kotlin.math.cos

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
 * 
 * Performance optimizations:
 * - Separable DCT: O(N^3) instead of O(N^4) via row-then-column passes
 * - Partial DCT: only computes 8x8 output frequencies (not full 32x32)
 * - Precomputed cosine lookup table in companion object (shared across instances)
 * - Parallel hashing: up to 4 concurrent coroutines
 * - File size passed from scan phase (no extra ContentResolver queries)
 */
class SimilarPhotoDetector(private val context: Context) {

    companion object {
        private const val N = 32
        private const val HASH_SIZE = 8 // Only need top-left 8x8 of DCT
        
        // [A1] Precomputed cosine table — shared across all instances (immutable)
        // cosTable[i][u] = cos((2*i+1)*u*PI / (2*N))
        val cosTable: Array<DoubleArray> = Array(N) { i ->
            DoubleArray(N) { u ->
                cos((2.0 * i + 1.0) * u * PI / (2.0 * N))
            }
        }
        
        // Precomputed DCT coefficients: c[0] = 1/sqrt(2), c[i>0] = 1.0
        val dctCoeff: DoubleArray = DoubleArray(N) { i ->
            if (i == 0) 1.0 / Math.sqrt(2.0) else 1.0
        }
    }

    // Threshold for Hamming Distance (0-64). <= 5 implies ~90% similarity.
    private val SIMILARITY_THRESHOLD = 5
    
    // Max parallel hash computations (limit memory pressure on low-end devices)
    private val MAX_PARALLEL = 4
    
    // Safety: Exclude specific folders to avoid false positives on docs/screenshots
    private val EXCLUDED_FOLDERS = listOf("documents", "document", "screenshot", "screenshots", "notes", "invoice", "receipt")

    /**
     * Data class to carry photo metadata.
     * [C2] fileSize is populated during scan phase to avoid redundant ContentResolver queries.
     */
    data class PhotoInfo(
        val id: Long,
        val path: String,
        val contentUri: String,
        val dateModified: Long,
        val fileSize: Long  // [C2] Passed from scan, no extra query needed
    )

    /**
     * Find similar photos using parallel pHash computation.
     * Returns list of groups where each group has 2+ visually similar photos.
     */
    suspend fun findSimilarPhotos(photos: List<PhotoInfo>): List<DuplicateFileInfo> = coroutineScope {
        Log.d("SimilarPhotoDetector", "findSimilarPhotos called with ${photos.size} photos")
        val startTime = System.currentTimeMillis()
        
        // Step 1: Filter out excluded folders and too-small files
        val candidates = photos.filter { photoInfo ->
            !isExcludedFolder(photoInfo.path) && photoInfo.fileSize >= 50 * 1024
        }
        Log.d("SimilarPhotoDetector", "After filter: ${candidates.size} candidates (excluded ${photos.size - candidates.size})")
        
        // Step 2: Compute pHash for all candidates in parallel (limited concurrency)
        val semaphore = Semaphore(MAX_PARALLEL)
        val hashResults: List<Deferred<HashResult?>> = candidates.map { photoInfo ->
            async(Dispatchers.Default) {
                semaphore.withPermit {
                    try {
                        val hash = computePHash(photoInfo.contentUri) ?: return@withPermit null
                        
                        HashResult(
                            photoInfo = photoInfo,
                            hash = hash
                        )
                    } catch (e: Exception) {
                        Log.w("SimilarPhotoDetector", "Error processing ${photoInfo.path}: ${e.message}")
                        null
                    }
                }
            }
        }
        
        // Step 3: Await all results
        val validResults = hashResults.awaitAll().filterNotNull()
        val hashTime = System.currentTimeMillis() - startTime
        Log.d("SimilarPhotoDetector", "Hashed ${validResults.size} photos in ${hashTime}ms")

        // Step 4: Group by similarity (single-threaded, fast — just integer comparison)
        // [P3] O(N×G) with Long.bitCount intrinsic (~2ns each). Acceptable for <50K photos.
        val groups = mutableListOf<SimilarGroup>()
        
        for (result in validResults) {
            var addedToGroup = false
            for (group in groups) {
                val distance = calculateHammingDistance(group.representativeHash, result.hash)
                if (distance <= SIMILARITY_THRESHOLD) {
                    group.items.add(result.toDuplicateItem())
                    addedToGroup = true
                    break
                }
            }
            
            if (!addedToGroup) {
                groups.add(
                    SimilarGroup(
                        representativeHash = result.hash,
                        items = mutableListOf(result.toDuplicateItem())
                    )
                )
            }
        }

        // Step 5: Convert to result format (only groups with > 1 item)
        val result = groups
            .filter { it.items.size > 1 }
            .map { group ->
                val totalSize = group.items.sumOf { it.size }
                val savings = totalSize - group.items.maxOf { it.size } // Keep largest
                
                DuplicateFileInfo(
                    signature = group.representativeHash.toString(),
                    files = group.items,
                    totalSize = totalSize,
                    savingsIfDeleted = savings,
                    type = "SIMILAR"
                )
            }
        
        val totalTime = System.currentTimeMillis() - startTime
        Log.d("SimilarPhotoDetector", "findSimilarPhotos complete: ${result.size} groups in ${totalTime}ms (hash: ${hashTime}ms)")
        result
    }
    
    private fun isExcludedFolder(path: String): Boolean {
        val lowerPath = path.lowercase()
        return EXCLUDED_FOLDERS.any { lowerPath.contains("/$it/") || lowerPath.contains("/$it") }
    }

    /**
     * Compute pHash using ContentResolver InputStream (scoped storage safe).
     * [C1] Fixed bitmap leak: recycles original decoded bitmap before scaling.
     * [F4] Fixed InputStream leak: uses .use{} block for safe resource management.
     * [P2] Uses partial DCT: only computes 8x8 output (not full 32x32).
     */
    private fun computePHash(uriString: String): Long? {
        try {
            val uri = Uri.parse(uriString)
            
            // [F4] Use .use{} to guarantee stream closure even on exception
            val decoded = context.contentResolver.openInputStream(uri)?.use { inputStream ->
                val options = BitmapFactory.Options().apply {
                    inPreferredConfig = Bitmap.Config.ARGB_8888
                    inSampleSize = 4
                }
                BitmapFactory.decodeStream(inputStream, null, options)
            } ?: return null
            
            // [C1] Resize to 32x32, then recycle original if a new bitmap was created
            val scaled = Bitmap.createScaledBitmap(decoded, N, N, true)
            if (scaled !== decoded) {
                decoded.recycle() // Recycle the large original bitmap
            }
            
            // Extract grayscale values using batch getPixels (faster than per-pixel)
            val pixels = IntArray(N * N)
            scaled.getPixels(pixels, 0, N, 0, 0, N, N)
            scaled.recycle()
            
            val vals = DoubleArray(N * N)
            for (i in pixels.indices) {
                val pixel = pixels[i]
                vals[i] = 0.299 * Color.red(pixel) + 0.587 * Color.green(pixel) + 0.114 * Color.blue(pixel)
            }
            
            // Compute DCT using optimized partial separable method
            val dctVals = applyPartialSeparableDCT(vals)
            
            // Reduce to 8x8 and compute average (exclude DC at 0,0)
            var total = 0.0
            val subMatrix = DoubleArray(HASH_SIZE * HASH_SIZE)
            var idx = 0
            for (y in 0 until HASH_SIZE) {
                for (x in 0 until HASH_SIZE) {
                    subMatrix[idx] = dctVals[y * HASH_SIZE + x]
                    if (x != 0 || y != 0) {
                        total += subMatrix[idx]
                    }
                    idx++
                }
            }
            val avg = total / 63.0
            
            // Compute Hash
            var hash: Long = 0
            for (i in 0 until 64) {
                 if (subMatrix[i] >= avg) {
                     hash = hash or (1L shl i)
                 }
            }
            
            return hash
        } catch (e: Exception) {
            Log.e("SimilarPhotoDetector", "Error computing pHash: ${e.message}")
            return null
        }
    }
    
    /**
     * [P2] Optimized Partial Separable 2D DCT.
     * 
     * Only computes the top-left 8x8 frequencies needed for pHash.
     * Pass 1: For all 32 rows, compute 1D DCT for v = 0..7 only
     * Pass 2: For v = 0..7, compute 1D DCT for u = 0..7 only
     * 
     * Complexity: O(N² × H) where H=8, vs O(N³) for full DCT — a further ~4x speedup.
     * Returns flat array of size HASH_SIZE × HASH_SIZE (64 values).
     */
    private fun applyPartialSeparableDCT(f: DoubleArray): DoubleArray {
        // Pass 1: DCT along rows, but only for output frequencies v = 0..7
        // intermediate[i * HASH_SIZE + v] = c[v] * sum_j { f[i*N+j] * cosTable[j][v] }
        val intermediate = DoubleArray(N * HASH_SIZE)
        for (i in 0 until N) {
            val rowOffset = i * N
            val intOffset = i * HASH_SIZE
            for (v in 0 until HASH_SIZE) {
                var sum = 0.0
                for (j in 0 until N) {
                    sum += f[rowOffset + j] * cosTable[j][v]
                }
                intermediate[intOffset + v] = dctCoeff[v] * sum
            }
        }
        
        // Pass 2: DCT along columns, for u = 0..7 and v = 0..7
        // result[u * HASH_SIZE + v] = 0.25 * c[u] * sum_i { intermediate[i*HASH_SIZE+v] * cosTable[i][u] }
        val result = DoubleArray(HASH_SIZE * HASH_SIZE)
        for (v in 0 until HASH_SIZE) {
            for (u in 0 until HASH_SIZE) {
                var sum = 0.0
                for (i in 0 until N) {
                    sum += intermediate[i * HASH_SIZE + v] * cosTable[i][u]
                }
                result[u * HASH_SIZE + v] = 0.25 * dctCoeff[u] * sum
            }
        }
        
        return result
    }

    private fun calculateHammingDistance(hash1: Long, hash2: Long): Int {
        return java.lang.Long.bitCount(hash1 xor hash2)
    }
    
    private data class SimilarGroup(
        val representativeHash: Long,
        val items: MutableList<DuplicateItem>
    )
    
    private data class HashResult(
        val photoInfo: PhotoInfo,
        val hash: Long
    ) {
        fun toDuplicateItem(): DuplicateItem = DuplicateItem(
            id = photoInfo.id,
            name = photoInfo.path.substringAfterLast("/"),
            size = photoInfo.fileSize,
            path = photoInfo.path,
            uri = photoInfo.contentUri,
            dateModified = photoInfo.dateModified
        )
    }
}
