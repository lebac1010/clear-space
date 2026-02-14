import 'dart:async';
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
      // Deep convert entire event to handle nested structures
      final data = convertToJsonMap(event);
      final String type = data['type'] as String;
      // DEBUG LOG
      // print('NativeStorageScanner: Scanning...');
      // print('NativeStorageScanner: Received event type: $type');

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
        throw Exception(data['message']);
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
      final list = (value as List).cast<Map<String, dynamic>>();
      return MapEntry(key, list);
    });
  }

  /// Get detailed similar photos list
  Future<Map<String, List<Map<String, dynamic>>>> getSimilarPhotos() async {
    final result = await _methodChannel.invokeMethod('getSimilarPhotos');
    final jsonMap = convertToJsonMap(result);
    return jsonMap.map((key, value) {
      final list = (value as List).cast<Map<String, dynamic>>();
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

  /// Get info about the background cleanup job
  Future<Map<String, dynamic>?> getCleanupInfo() async {
    final result = await _methodChannel.invokeMethod('getCleanupInfo');
    if (result == null) return null;
    return convertToJsonMap(result);
  }
}
