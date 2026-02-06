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
}
