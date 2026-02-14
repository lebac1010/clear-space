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

  /// Delete list of files
  /// [permanent] If true, deletes permanently. If false (default), moves to Trash (Android 11+)
  Future<bool> deleteFiles(List<String> uris, {bool permanent = false});

  /// Smart Clean Junk
  /// [types] List of junk types ("junk", "empty_folders", "apks")
  Future<Map<String, dynamic>> cleanJunk(List<String> types);

  /// Start background cleanup
  Future<bool> cleanJunkBackground(List<String> types);

  /// Get background cleanup info
  Future<Map<String, dynamic>?> getCleanupInfo();
}
