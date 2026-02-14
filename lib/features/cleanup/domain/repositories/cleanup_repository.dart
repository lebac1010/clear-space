import '../entities/cleanup_group.dart';

abstract class CleanupRepository {
  /// Get identical duplicate files grouped by hash
  Future<List<CleanupGroup>> getDuplicateFiles();

  /// Get similar photos (pHash)
  Future<List<CleanupGroup>> getSimilarPhotos();

  /// Get large files (> 10MB)
  Future<List<CleanupGroup>> getLargeFiles();

  /// Delete selected items
  Future<bool> deleteItems(List<String> uris, {bool permanent = false});
}
