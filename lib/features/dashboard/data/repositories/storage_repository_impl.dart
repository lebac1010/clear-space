import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../../../../core/services/app_settings_service.dart';
import '../../../../core/services/native_storage_scanner.dart';
import '../../../../core/services/storage_cache_service.dart';
import '../../../../core/services/cleanup_history_service.dart';
import '../../../cleanup/domain/entities/cleanup_history_record.dart';
import '../../domain/entities/scan_progress.dart';
import '../../domain/entities/storage_info.dart';
import '../../domain/entities/storage_permission_state.dart';
import '../../domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final NativeStorageScanner _nativeScanner;
  final StorageCacheService _cacheService;
  final AppSettingsService _appSettings;
  final CleanupHistoryService _historyService;

  StorageRepositoryImpl(
    this._nativeScanner,
    this._cacheService,
    this._appSettings,
    this._historyService,
  );

  @override
  Stream<ScanProgress> get scanProgress => _nativeScanner.onProgress;

  @override
  Future<bool> requestPermissions({
    RequiredStorageAccess requiredAccess = RequiredStorageAccess.full,
  }) async {
    if (Platform.isAndroid) {
      if (requiredAccess == RequiredStorageAccess.media) {
        await Permission.photos.request();
      } else {
        final permissions = [
          Permission.photos,
          Permission.videos,
          Permission.audio,
        ];
        await permissions.request();
        await Permission.manageExternalStorage.request();
        await Permission.storage.request();
      }

      final permissionState = await getPermissionState();
      return switch (requiredAccess) {
        RequiredStorageAccess.media => permissionState.canAccessPhotos,
        RequiredStorageAccess.full => permissionState.hasFullAccess,
      };
    }

    final status = await Permission.photos.request();
    return requiredAccess == RequiredStorageAccess.media
        ? status.isGranted || status.isLimited
        : status.isGranted;
  }

  @override
  Future<bool> checkPermissions() async {
    final permissionState = await getPermissionState();
    return permissionState.hasFullAccess;
  }

  @override
  Future<StoragePermissionState> getPermissionState() async {
    if (Platform.isAndroid) {
      final manageStatus = await Permission.manageExternalStorage.status;
      final photos = await Permission.photos.status;
      final videos = await Permission.videos.status;
      final audio = await Permission.audio.status;
      final storage = await Permission.storage.status;

      final hasLegacyStorageAccess = storage.isGranted;
      final hasPhotoAccess =
          hasLegacyStorageAccess || photos.isGranted || photos.isLimited;
      final hasMediaAccess =
          hasPhotoAccess ||
          videos.isGranted ||
          videos.isLimited ||
          audio.isGranted ||
          audio.isLimited;
      final hasAllFilesAccess = manageStatus.isGranted || hasLegacyStorageAccess;
      final isPhotoPermanentlyDenied =
          !hasPhotoAccess && photos.isPermanentlyDenied;
      final isFullAccessPermanentlyDenied =
          !hasAllFilesAccess &&
          (manageStatus.isPermanentlyDenied || storage.isPermanentlyDenied);

      return StoragePermissionState(
        hasPhotoAccess: hasPhotoAccess,
        hasMediaAccess: hasMediaAccess,
        hasAllFilesAccess: hasAllFilesAccess,
        isPhotoPermanentlyDenied: isPhotoPermanentlyDenied,
        isFullAccessPermanentlyDenied: isFullAccessPermanentlyDenied,
      );
    }

    final status = await Permission.photos.status;
    return StoragePermissionState(
      hasPhotoAccess: status.isGranted || status.isLimited,
      hasMediaAccess: status.isGranted || status.isLimited,
      hasAllFilesAccess: status.isGranted,
      isPhotoPermanentlyDenied: status.isPermanentlyDenied,
      isFullAccessPermanentlyDenied: status.isPermanentlyDenied,
    );
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
      final sensitivity = _appSettings.getSimilarPhotoSensitivity();
      final threshold = _appSettings.getLargeFileThreshold();
      final info = await _nativeScanner.scan(
        sensitivity: sensitivity,
        largeFileThreshold: threshold,
      );
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
  Future<void> logHistory({
    required String type,
    required int count,
    required int size,
    List<String> details = const [],
    Map<String, int> mimeBreakdown = const {},
  }) async {
    await _historyService.addRecord(
      CleanupHistoryRecord(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp: DateTime.now(),
        cleanupType: type,
        itemsCount: count,
        totalSizeInBytes: size,
        fileNames: details,
        mimeTypeBreakdown: mimeBreakdown,
      ),
    );
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
