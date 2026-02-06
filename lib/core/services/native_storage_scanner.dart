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

      if (type == 'progress') {
        // Deep convert nested 'data' field
        final progressData = convertToJsonMap(data['data']);
        return ScanProgress.fromJson(progressData);
      } else if (type == 'complete') {
        return const ScanProgress(
          phase: ScanPhase.COMPLETE,
          processedItems: 100,
          totalItems: 100,
          currentBytes: 0,
        );
      } else if (type == 'error') {
        throw Exception(data['message']);
      } else if (type == 'cache_invalidated') {
        return const ScanProgress(
          phase: ScanPhase.CACHE_INVALIDATED,
          processedItems: 0,
          totalItems: 0,
          currentBytes: 0,
        );
      }

      // Default fallback
      return const ScanProgress(
        phase: ScanPhase.CALCULATING,
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

  /// Cancel scan
  Future<void> cancelScan() async {
    await _methodChannel.invokeMethod('cancelScan');
  }
}
