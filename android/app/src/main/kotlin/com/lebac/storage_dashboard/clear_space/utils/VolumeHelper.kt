package com.lebac.storage_dashboard.clear_space.utils

import android.content.Context
import android.os.Build
import android.os.Environment
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import com.lebac.storage_dashboard.clear_space.models.StorageVolumeInfo
import java.io.File
import java.lang.reflect.Method

class VolumeHelper(private val context: Context) {
    
    /**
     * Get all storage volumes (internal + SD cards + USB)
     */
    fun getAllVolumes(): List<StorageVolumeInfo> {
        val volumes = mutableListOf<StorageVolumeInfo>()
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // Android 11+: Use StorageManager
            val storageManager = context.getSystemService(StorageManager::class.java)
            storageManager.storageVolumes.forEach { volume ->
                volume.directory?.let { dir ->
                    volumes.add(createVolumeInfo(volume, dir))
                }
            }
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            // Android 7-10: Use StorageManager with reflection or fallback
            val storageManager = context.getSystemService(StorageManager::class.java)
            try {
                storageManager.storageVolumes.forEach { volume ->
                    // Use reflection to get path on older APIs
                    val getPath: Method = StorageVolume::class.java.getMethod("getPath")
                    val path = getPath.invoke(volume) as? String
                    if (path != null) {
                        val dir = File(path)
                        if (dir.exists()) {
                            volumes.add(createVolumeInfoLegacy(volume, dir))
                        }
                    }
                }
            } catch (e: Exception) {
                // Fallback to manual detection
                volumes.addAll(getVolumesViaMount())
            }
        } else {
            // Older Android: Parse mount points
            volumes.addAll(getVolumesViaMount())
        }
        
        // Always ensure primary is included
        if (volumes.none { it.isPrimary }) {
            val primary = Environment.getExternalStorageDirectory()
            if (primary.exists()) {
                volumes.add(0, StorageVolumeInfo(
                    name = "Internal Storage",
                    path = primary.absolutePath,
                    totalSpace = primary.totalSpace,
                    freeSpace = primary.freeSpace,
                    isRemovable = false,
                    isPrimary = true
                ))
            }
        }
        
        return volumes.distinctBy { it.path }
    }
    
    private fun createVolumeInfo(volume: StorageVolume, dir: File): StorageVolumeInfo {
        return StorageVolumeInfo(
            name = volume.getDescription(context) ?: "Storage",
            path = dir.absolutePath,
            totalSpace = dir.totalSpace,
            freeSpace = dir.freeSpace,
            isRemovable = volume.isRemovable,
            isPrimary = volume.isPrimary
        )
    }
    
    private fun createVolumeInfoLegacy(volume: StorageVolume, dir: File): StorageVolumeInfo {
        return StorageVolumeInfo(
            name = volume.getDescription(context) ?: "Storage",
            path = dir.absolutePath,
            totalSpace = dir.totalSpace,
            freeSpace = dir.freeSpace,
            isRemovable = volume.isRemovable,
            isPrimary = volume.isPrimary
        )
    }
    
    private fun getVolumesViaMount(): List<StorageVolumeInfo> {
        val volumes = mutableListOf<StorageVolumeInfo>()
        
        // Check common mount points
        val mountPoints = mutableListOf(
            "/storage/emulated/0",
            "/storage/sdcard0",
            "/storage/sdcard1",
            "/mnt/sdcard"
        )
        
        // Also check /storage directory
        File("/storage").listFiles()?.filter { 
            it.isDirectory && it.canRead() 
        }?.forEach { dir ->
            if (!mountPoints.contains(dir.absolutePath)) {
                mountPoints.add(dir.absolutePath)
            }
        }
        
        mountPoints.forEach { path ->
            val dir = File(path)
            if (dir.exists() && dir.canRead() && dir.totalSpace > 0) {
                volumes.add(StorageVolumeInfo(
                    name = if (path.contains("emulated")) "Internal Storage" else "SD Card",
                    path = path,
                    totalSpace = dir.totalSpace,
                    freeSpace = dir.freeSpace,
                    isRemovable = !path.contains("emulated"),
                    isPrimary = path.contains("emulated/0")
                ))
            }
        }
        
        return volumes
    }
    
    /**
     * Get MediaStore volume names for queries
     */
    fun getMediaStoreVolumeNames(): List<String> {
        val names = mutableListOf<String>()
        
        // Always include external primary
        names.add("external_primary")
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            // Android 10+: Get all volume names
            val volumes = context.getSystemService(StorageManager::class.java).storageVolumes
            volumes.filter { !it.isPrimary && it.mediaStoreVolumeName != null }
                .forEach { names.add(it.mediaStoreVolumeName!!) }
        }
        
        return names
    }
}
