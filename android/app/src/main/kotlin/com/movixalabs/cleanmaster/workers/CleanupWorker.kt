package com.movixalabs.cleanmaster.workers

import android.content.Context
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import com.movixalabs.cleanmaster.utils.MediaStoreScanner
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.work.ForegroundInfo


class CleanupWorker(context: Context, params: WorkerParameters) : CoroutineWorker(context, params) {

    private val notificationManager =
        context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    override suspend fun doWork(): Result = withContext(Dispatchers.IO) {
        val types = inputData.getStringArray("types")?.toList() ?: emptyList()
        
        if (types.isEmpty()) {
            return@withContext Result.failure()
        }

        setForeground(createForegroundInfo(0, 0))

        try {
             // We need an instance of MediaStoreScanner. 
             // Since it's a utility class with mostly static-like suspend functions or takes context, 
             // we can instantiate or use it. 
             // Looking at MediaStoreScanner, it takes a Context.
             val scanner = MediaStoreScanner(applicationContext)
             
             // We can't easily hook into "onProgress" of cleanJunk unless we modify it to accept a callback
             // AND that callback updates the notification.
             // For now, let's assume cleanup is "indeterminate" or simple start/end 
             // UNLESS we refactor MediaStoreScanner to report progress.
             // The current cleanJunk implementation in MediaStoreScanner returns a Map. 
             // It doesn't seem to support progress callback yet. 
             
             // TODO: Refactor MediaStoreScanner.cleanJunk to support progress if needed.
             // For now, simply run it.
             
             val result = scanner.cleanJunk(types)
             val deletedCount = result["count"] as? Int ?: 0
             val recoveredBytes = result["bytes"] as? Long ?: 0
             
             val outputData = workDataOf(
                 "count" to deletedCount,
                 "bytes" to recoveredBytes
             )
             
            return@withContext Result.success(outputData)
        } catch (e: Exception) {
            return@withContext Result.failure()
        }
    }

    private fun createForegroundInfo(progress: Int, total: Int): ForegroundInfo {
        val channelId = "cleanup_channel"
        val title = "Cleaning Junk Files"

        
        // Create Channel if needed
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId, 
                "Cleanup Tasks", 
                NotificationManager.IMPORTANCE_LOW
            )
            notificationManager.createNotificationChannel(channel)
        }

        val notification = NotificationCompat.Builder(applicationContext, channelId)
            .setContentTitle(title)
            .setTicker(title)
            .setContentText("Cleaning in progress...")
            .setSmallIcon(android.R.drawable.ic_menu_delete) // Use a better icon if avail
            .setOngoing(true)
            .setProgress(100, progress, true) // Indeterminate for now
            .build()

        return ForegroundInfo(1001, notification)
    }
}
