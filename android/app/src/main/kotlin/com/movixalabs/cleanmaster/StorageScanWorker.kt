package com.movixalabs.cleanmaster

import android.content.Context
import androidx.work.*
import com.movixalabs.cleanmaster.utils.MediaStoreScanner
import com.movixalabs.cleanmaster.utils.ScanUpdate
import kotlinx.coroutines.flow.collect
import com.movixalabs.cleanmaster.models.StorageInfo
import com.google.gson.Gson

/**
 * WorkManager worker for background storage scanning.
 * Survives app closure and system kills.
 */
class StorageScanWorker(
    context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {
    
    companion object {
        const val WORK_NAME = "storage_scan_work"
        
        fun schedule(context: Context) {
            val constraints = Constraints.Builder()
                .setRequiresBatteryNotLow(true)
                .build()
            
            val request = OneTimeWorkRequestBuilder<StorageScanWorker>()
                .setConstraints(constraints)
                .build()
            
            WorkManager.getInstance(context)
                .enqueueUniqueWork(
                    WORK_NAME,
                    ExistingWorkPolicy.REPLACE,
                    request
                )
        }
        
        fun cancel(context: Context) {
            WorkManager.getInstance(context).cancelUniqueWork(WORK_NAME)
        }
    }

    override suspend fun doWork(): Result {
        return try {
            val scanner = MediaStoreScanner(applicationContext)
            var finalResult: StorageInfo? = null
            
            scanner.scanStorage().collect { update ->
                when (update) {
                    is ScanUpdate.Complete -> {
                        finalResult = update.storageInfo
                    }
                    else -> {
                        // Progress updates - could use setProgress() for foreground progress
                    }
                }
            }
            
            if (finalResult != null) {
                // Store result in shared preferences for Flutter to read
                StorageCacheManager.save(applicationContext, finalResult!!)
                Result.success()
            } else {
                Result.failure()
            }
        } catch (e: SecurityException) {
            // [F5] Permission errors are permanent — don't retry
            android.util.Log.e("StorageScanWorker", "Permission denied, failing permanently", e)
            Result.failure()
        } catch (e: IllegalStateException) {
            // [F5] State errors (e.g., service unavailable) are permanent
            android.util.Log.e("StorageScanWorker", "Illegal state, failing permanently", e)
            Result.failure()
        } catch (e: OutOfMemoryError) {
            // [F5] OOM is not retryable
            android.util.Log.e("StorageScanWorker", "OOM, failing permanently", e)
            Result.failure()
        } catch (e: java.io.IOException) {
            // [F5] I/O errors MAY be transient (SD card unmounted temporarily) — retry
            android.util.Log.w("StorageScanWorker", "I/O error, will retry", e)
            Result.retry()
        } catch (e: Exception) {
            // [F5] Unknown errors — fail to prevent infinite retry loop draining battery
            android.util.Log.e("StorageScanWorker", "Unknown error, failing", e)
            Result.failure()
        }
    }
}

/**
 * Simple cache manager for WorkManager results
 */
object StorageCacheManager {
    private const val PREFS_NAME = "storage_scan_cache"
    private const val KEY_RESULT = "scan_result_json"
    private val gson = Gson()
    
    fun save(context: Context, info: StorageInfo) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val json = gson.toJson(info.toMap())
        prefs.edit().putString(KEY_RESULT, json).apply()
    }
    
    fun load(context: Context): Map<String, Any>? {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val json = prefs.getString(KEY_RESULT, null) ?: return null
        return try {
            gson.fromJson(json, Map::class.java) as? Map<String, Any>
        } catch (e: Exception) {
            null
        }
    }
    
    fun clear(context: Context) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit().remove(KEY_RESULT).apply()
    }
}
