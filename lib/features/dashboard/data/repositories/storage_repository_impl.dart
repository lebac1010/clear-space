import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../../../../core/services/native_storage_scanner.dart';
import '../../../../core/services/storage_cache_service.dart';
import '../../domain/entities/scan_progress.dart';
import '../../domain/entities/storage_info.dart';
import '../../domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final NativeStorageScanner _nativeScanner;
  final StorageCacheService _cacheService;

  StorageRepositoryImpl(this._nativeScanner, this._cacheService);

  @override
  Stream<ScanProgress> get scanProgress => _nativeScanner.onProgress;

  @override
  Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      // Android 13+ (SDK 33)
      final permissions = [
        Permission.photos,
        Permission.videos,
        Permission.audio,
      ];

      final statuses = await permissions.request();

      // Check if primary permissions are granted
      bool granted = statuses.values.every((s) => s.isGranted || s.isLimited);

      // FIX: Request All Files Access for Android 11+ (API 30+)
      // This is required for non-media file access (e.g. Empty Folders in Downloads)
      if (await Permission.manageExternalStorage.status.isDenied) {
        final manageStatus = await Permission.manageExternalStorage.request();
        if (manageStatus.isGranted) {
          granted = true;
        }
      } else if (await Permission.manageExternalStorage.status.isGranted) {
        granted = true;
      }

      if (!granted) {
        // Fallback for older Android (SDK < 33) using READ_EXTERNAL_STORAGE
        final storage = await Permission.storage.request();
        if (storage.isGranted) {
          granted = true;
        }
      }

      return granted;
    }

    // iOS
    final status = await Permission.photos.request();
    return status.isGranted || status.isLimited;
  }

  @override
  Future<bool> checkPermissions() async {
    if (Platform.isAndroid) {
      // Check All Files Access first
      if (await Permission.manageExternalStorage.isGranted) {
        return true;
      }

      final photos = await Permission.photos.status;
      final videos = await Permission.videos.status;
      final audio = await Permission.audio.status;
      final storage = await Permission.storage.status;

      return (photos.isGranted || photos.isLimited) ||
          (videos.isGranted || videos.isLimited) ||
          (audio.isGranted || audio.isLimited) ||
          storage.isGranted;
    }
    final status = await Permission.photos.status;
    return status.isGranted || status.isLimited;
  }

  @override
  Future<StorageInfo> getStorageInfo({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = _cacheService.getCachedStorageInfo();
      if (cached != null) {
        // Return cached, but maybe trigger background refresh?
        // For now, strict cache return
        return cached;
      }
    }

    try {
      final info = await _nativeScanner.scan();
      await _cacheService.cacheStorageInfo(info);
      return info;
    } catch (e) {
      // Fallback or rethrow
      // If scan fails, try to return cache even if old
      final cached = _cacheService.getCachedStorageInfo();
      if (cached != null) return cached;
      rethrow;
    }
  }

  @override
  Future<bool> deleteFiles(List<String> uris, {bool permanent = false}) async {
    final success = await _nativeScanner.deleteFiles(
      uris,
      permanent: permanent,
    );
    if (success) {
      // Invalidate cache since storage changed
      _cacheService.clearCache();
    }
    return success;
  }

  @override
  Future<Map<String, dynamic>> cleanJunk(List<String> types) async {
    // Check threshold for background deletion
    StorageInfo? info = _cacheService.getCachedStorageInfo();

    int totalItems = 0;
    if (info != null) {
      if (types.contains('junk')) totalItems += info.junkCount;
      if (types.contains('empty_folders')) totalItems += info.emptyFolderCount;
      if (types.contains('apks')) totalItems += info.apkCount;
    }

    if (totalItems > 50) {
      // Threshold: 50 items
      final started = await _nativeScanner.cleanJunkBackground(types);
      if (started) {
        // Fix #6: Pre-clear cache so dashboard refresh after completion gets fresh data
        _cacheService.clearCache();
      }
      return {'background': true, 'started': started};
    }

    final result = await _nativeScanner.cleanJunk(types);
    if ((result['count'] as int? ?? 0) > 0) {
      _cacheService.clearCache();
    }
    return result;
  }

  @override
  Future<bool> cleanJunkBackground(List<String> types) async {
    return _nativeScanner.cleanJunkBackground(types);
  }

  @override
  Future<Map<String, dynamic>?> getCleanupInfo() async {
    return await _nativeScanner.getCleanupInfo();
  }

  @override
  Future<List<Map<String, dynamic>>> getMediaFiles({
    required String type,
    int limit = 50,
    int offset = 0,
  }) async {
    return await _nativeScanner.getMediaFiles(
      type: type,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getInstalledApps() async {
    return await _nativeScanner.getInstalledApps();
  }

  @override
  Future<bool> uninstallApp(String packageName) async {
    return await _nativeScanner.uninstallApp(packageName);
  }

  @override
  Future<List<Map<String, dynamic>>> getJunkData(String type) async {
    return await _nativeScanner.getJunkData(type);
  }

  @override
  Future<Map<String, dynamic>> deleteSpecificJunk(List<String> paths) async {
    return await _nativeScanner.deleteSpecificJunk(paths);
  }
}
