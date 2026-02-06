import '../entities/scan_progress.dart';
import '../entities/storage_info.dart';

abstract class StorageRepository {
  /// Request necessary storage permissions.
  /// Returns [true] if granted.
  Future<bool> requestPermissions();

  /// Get comprehensive storage information.
  Future<StorageInfo> getStorageInfo({bool forceRefresh = false});

  /// Check current permission status without requesting.
  Future<bool> checkPermissions();

  /// Stream of scan progress updates
  Stream<ScanProgress> get scanProgress;
}
