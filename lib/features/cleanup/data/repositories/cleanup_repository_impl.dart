import '../../../../core/services/native_storage_scanner.dart';
import '../../../../features/dashboard/domain/repositories/storage_repository.dart';
import '../../domain/entities/cleanup_group.dart';
import '../../domain/entities/cleanup_item.dart';
import '../../domain/repositories/cleanup_repository.dart';

class CleanupRepositoryImpl implements CleanupRepository {
  final StorageRepository _storageRepository;
  final NativeStorageScanner _nativeScanner;

  CleanupRepositoryImpl(this._storageRepository, this._nativeScanner);

  @override
  Future<List<CleanupGroup>> getDuplicateFiles() async {
    final rawDuplicates = await _nativeScanner.getDuplicateFiles();
    final groups = <CleanupGroup>[];

    rawDuplicates.forEach((signature, fileList) {
      final items = fileList.map((data) {
        return CleanupItem(
          id: data['id'].toString(),
          path: data['path']?.toString() ?? '',
          uri: data['uri'].toString(),
          name: data['name'].toString(),
          size: (data['size'] as num).toInt(),
          dateModified: DateTime.fromMillisecondsSinceEpoch(
            (data['dateModified'] as num).toInt() * 1000,
          ),
          thumbUrl: data['uri'].toString(),
        );
      }).toList();

      if (items.isNotEmpty) {
        groups.add(
          CleanupGroup(
            id: signature,
            title: items.first.name,
            totalSize: items.fold(0, (sum, item) => sum + item.size),
            items: items,
          ),
        );
      }
    });

    return groups;
  }

  @override
  Future<List<CleanupGroup>> getSimilarPhotos() async {
    final rawSimilar = await _nativeScanner.getSimilarPhotos();
    final groups = <CleanupGroup>[];

    rawSimilar.forEach((signature, fileList) {
      final items = fileList.map((data) {
        return CleanupItem(
          id: data['id'].toString(),
          path: data['path']?.toString() ?? '',
          uri: data['uri'].toString(),
          name: data['name'].toString(),
          size: (data['size'] as num).toInt(),
          dateModified: DateTime.fromMillisecondsSinceEpoch(
            (data['dateModified'] as num).toInt() * 1000,
          ),
          thumbUrl: data['uri'].toString(),
        );
      }).toList();

      if (items.isNotEmpty) {
        groups.add(
          CleanupGroup(
            id: signature,
            title: items.first.name,
            totalSize: items.fold(0, (sum, item) => sum + item.size),
            items: items,
          ),
        );
      }
    });

    return groups;
  }

  @override
  Future<List<CleanupGroup>> getLargeFiles() async {
    final info = await _storageRepository.getStorageInfo();
    final largeFiles = info.largeFiles;
    final groups = <CleanupGroup>[];

    void addGroup(String id, String title, String mediaType) {
      final files = largeFiles.where((f) => f.mediaType == mediaType).toList();
      if (files.isNotEmpty) {
        groups.add(
          CleanupGroup(
            id: id,
            title: title,
            totalSize: files.fold(0, (sum, f) => sum + f.size),
            items: files
                .map(
                  (f) => CleanupItem(
                    id: f.id.toString(),
                    path: '', // LargeFileInfo doesn't have path directly
                    uri: f.uri,
                    name: f.name,
                    size: f.size,
                    dateModified: DateTime.fromMillisecondsSinceEpoch(
                      f.dateModified * 1000,
                    ),
                    thumbUrl: f.uri,
                  ),
                )
                .toList(),
          ),
        );
      }
    }

    addGroup('large_videos', 'Large Videos', 'VIDEO');
    addGroup('large_photos', 'Large Photos', 'IMAGE');
    addGroup('large_audio', 'Large Audio', 'AUDIO');
    addGroup('large_docs', 'Large Documents', 'DOCUMENT');

    return groups;
  }

  @override
  Future<bool> deleteItems(List<String> uris, {bool permanent = false}) async {
    return _storageRepository.deleteFiles(uris, permanent: permanent);
  }
}
