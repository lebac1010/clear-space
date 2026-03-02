import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../utils/platform_channel_utils.dart';
import '../../features/dashboard/domain/entities/scan_progress.dart';
import '../../features/dashboard/domain/entities/storage_info.dart';

class NativeStorageScanner {
  // FIX #15: Use correct package name matching Android plugin
  static const String _packageName = 'com.lebac.storage_dashboard.clear_space';

  static const MethodChannel _methodChannel = MethodChannel(
    '$_packageName/storage_scanner',
  );
  static const EventChannel _eventChannel = EventChannel(
    '$_packageName/storage_scanner_progress',
  );

  /// Get progress stream - creates fresh stream each time
  Stream<ScanProgress> get onProgress {
    return _eventChannel.receiveBroadcastStream().map((event) {
      try {
        // Deep convert entire event to handle nested structures
        final data = convertToJsonMap(event);
        final String type = data['type'] as String;

        if (type == 'progress') {
          // Deep convert nested 'data' field
          final progressData = convertToJsonMap(data['data']);
          return ScanProgress.fromJson(progressData);
        } else if (type == 'complete') {
          return const ScanProgress(
            phase: ScanPhase.complete,
            processedItems: 100,
            totalItems: 100,
            currentBytes: 0,
          );
        } else if (type == 'error') {
          // Instead of throwing and breaking the stream, yield an error phase
          return const ScanProgress(
            phase: ScanPhase.error,
            processedItems: 0,
            totalItems: 0,
            currentBytes: 0,
          );
        } else if (type == 'cache_invalidated') {
          return const ScanProgress(
            phase: ScanPhase.cacheInvalidated,
            processedItems: 0,
            totalItems: 0,
            currentBytes: 0,
          );
        }

        // Default fallback
        return const ScanProgress(
          phase: ScanPhase.calculating,
          processedItems: 0,
          totalItems: 1,
          currentBytes: 0,
        );
      } catch (e) {
        debugPrint('Error parsing progress stream event: $e');
        return const ScanProgress(
          phase: ScanPhase.error,
          processedItems: 0,
          totalItems: 0,
          currentBytes: 0,
        );
      }
    });
  }

  /// Start storage scan
  /// Returns the final StorageInfo
  Future<StorageInfo> scan() async {
    final result = await _methodChannel.invokeMethod('startScan');
    // Deep convert to handle nested largeFiles and storageVolumes
    final jsonMap = convertToJsonMap(result);
    return StorageInfo.fromJson(jsonMap);
  }

  /// Pause scan
  Future<void> pauseScan() async {
    await _methodChannel.invokeMethod('pauseScan');
  }

  /// Resume scan
  Future<void> resumeScan() async {
    await _methodChannel.invokeMethod('resumeScan');
  }

  /// Delete files
  /// [uris] List of file path URIs (content://...)
  /// [permanent] If true, deletes permanently. If false (default), moves to Trash (Android 11+)
  Future<bool> deleteFiles(List<String> uris, {bool permanent = false}) async {
    try {
      final success =
          await _methodChannel.invokeMethod<bool>('deleteFiles', {
            'uris': uris,
            'permanent': permanent,
          }) ??
          false;
      return success;
    } on PlatformException catch (_) {
      // Handle cancellation or error
      // 'SEND_INTENT_ERROR' might happen if activity is gone
      return false;
    }
  }

  /// Get detailed duplicate files list
  /// Returns Map<String (hash), List<Map<String, dynamic>>>
  /// Where value is list of file items
  Future<Map<String, List<Map<String, dynamic>>>> getDuplicateFiles() async {
    final result = await _methodChannel.invokeMethod('getDuplicateFiles');
    // Deep convert
    final jsonMap = convertToJsonMap(result);
    // Cast to expected type
    return jsonMap.map((key, value) {
      // [A2] Eager conversion instead of lazy .cast<>() to prevent deferred CastErrors
      final list = (value as List)
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      return MapEntry(key, list);
    });
  }

  /// Get detailed similar photos list
  Future<Map<String, List<Map<String, dynamic>>>> getSimilarPhotos() async {
    final result = await _methodChannel.invokeMethod('getSimilarPhotos');
    final jsonMap = convertToJsonMap(result);
    return jsonMap.map((key, value) {
      // [A2] Eager conversion instead of lazy .cast<>() to prevent deferred CastErrors
      final list = (value as List)
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      return MapEntry(key, list);
    });
  }

  /// Smart Clean Junk
  /// Returns Map of statistics {'count': int, 'bytes': int}
  Future<Map<String, dynamic>> cleanJunk(List<String> types) async {
    final result = await _methodChannel.invokeMethod('cleanJunk', {
      'types': types,
    });
    return convertToJsonMap(result);
  }

  /// Start background cleanup (WorkManager)
  Future<bool> cleanJunkBackground(List<String> types) async {
    final result = await _methodChannel.invokeMethod<bool>(
      'cleanJunkBackground',
      {'types': types},
    );
    return result ?? false;
  }

  /// Get usage info about the background cleanup job
  Future<Map<String, dynamic>?> getCleanupInfo() async {
    final result = await _methodChannel.invokeMethod('getCleanupInfo');
    if (result == null) return null;
    return convertToJsonMap(result);
  }

  /// Get photos with pagination
  /// Returns List<Map<String, dynamic>>
  Future<List<Map<String, dynamic>>> getPhotos({
    int limit = 50,
    int offset = 0,
  }) async {
    debugPrint(
      '[NativeStorageScanner] getPhotos called: limit=$limit, offset=$offset',
    );
    final result = await _methodChannel.invokeMethod('getPhotos', {
      'limit': limit,
      'offset': offset,
    });
    debugPrint(
      '[NativeStorageScanner] getPhotos raw result type: ${result?.runtimeType}, isNull: ${result == null}',
    );
    if (result == null) {
      debugPrint(
        '[NativeStorageScanner] getPhotos result is NULL, returning []',
      );
      return [];
    }
    if (result is List) {
      debugPrint(
        '[NativeStorageScanner] getPhotos raw list length: ${result.length}',
      );
      if (result.isNotEmpty) {
        debugPrint(
          '[NativeStorageScanner] first item type: ${result.first.runtimeType}',
        );
        debugPrint('[NativeStorageScanner] first item: ${result.first}');
      }
    }
    // Result is List<Object?>, not Map — use deepConvert directly
    final converted = deepConvertPlatformData(result);
    debugPrint(
      '[NativeStorageScanner] converted type: ${converted.runtimeType}',
    );
    if (converted is List) {
      final typed = converted.whereType<Map<String, dynamic>>().toList();
      debugPrint(
        '[NativeStorageScanner] getPhotos returning ${typed.length} typed maps',
      );
      return typed;
    }
    debugPrint('[NativeStorageScanner] converted is NOT a List, returning []');
    return [];
  }

  /// Get media files (audio, video, documents) with pagination
  /// Returns List<Map<String, dynamic>>
  Future<List<Map<String, dynamic>>> getMediaFiles({
    required String type,
    int limit = 50,
    int offset = 0,
  }) async {
    debugPrint(
      '[NativeStorageScanner] getMediaFiles called: type=$type, limit=$limit, offset=$offset',
    );
    final result = await _methodChannel.invokeMethod('getMediaFiles', {
      'type': type,
      'limit': limit,
      'offset': offset,
    });

    if (result == null) return [];

    final converted = deepConvertPlatformData(result);
    if (converted is List) {
      return converted.whereType<Map<String, dynamic>>().toList();
    }
    return [];
  }

  /// Load image bytes from a content URI (scoped storage safe)
  Future<Uint8List?> getPhotoBytes(String uri) async {
    try {
      final result = await _methodChannel.invokeMethod('getPhotoBytes', {
        'uri': uri,
      });
      if (result is Uint8List) return result;
      return null;
    } catch (e) {
      debugPrint('[NativeStorageScanner] getPhotoBytes error: $e');
      return null;
    }
  }

  /// Load efficient thumbnail from a content URI
  /// Uses Android's ContentResolver.loadThumbnail() — returns small JPEG bytes (~10-30KB)
  /// Falls back to getPhotoBytes() if thumbnail generation fails
  Future<Uint8List?> getPhotoThumbnail(
    String uri, {
    int width = 200,
    int height = 200,
  }) async {
    try {
      final result = await _methodChannel.invokeMethod('getPhotoThumbnail', {
        'uri': uri,
        'width': width,
        'height': height,
      });
      if (result is Uint8List) return result;
      return null;
    } catch (e) {
      debugPrint(
        '[NativeStorageScanner] getPhotoThumbnail error: $e, falling back to getPhotoBytes',
      );
      // Fallback to full image if thumbnail fails
      return getPhotoBytes(uri);
    }
  }

  /// Get list of installed applications
  Future<List<Map<String, dynamic>>> getInstalledApps() async {
    final result = await _methodChannel.invokeMethod<List>('getInstalledApps');
    return result?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [];
  }

  /// Trigger uninstall prompt for a specific package
  Future<bool> uninstallApp(String packageName) async {
    try {
      final result = await _methodChannel.invokeMethod<bool>('uninstallApp', {
        'packageName': packageName,
      });
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Get detailed junk data for a specific type (junk, empty_folders, apks)
  Future<List<Map<String, dynamic>>> getJunkData(String type) async {
    final result = await _methodChannel.invokeMethod<List>('getJunkData', {
      'type': type,
    });
    return result?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [];
  }

  /// Delete specific junk files/folders by their paths
  Future<Map<String, dynamic>> deleteSpecificJunk(List<String> paths) async {
    final result = await _methodChannel.invokeMethod<Map>(
      'deleteSpecificJunk',
      {'paths': paths},
    );
    return result != null ? Map<String, dynamic>.from(result) : {};
  }
}
