import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/native_storage_scanner.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../domain/entities/photo_model.dart';
import '../../domain/repositories/photo_repository.dart';

part 'photo_repository_impl.g.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final NativeStorageScanner _nativeScanner;

  PhotoRepositoryImpl(this._nativeScanner);

  @override
  Future<List<PhotoModel>> getPhotos({int limit = 50, int offset = 0}) async {
    debugPrint(
      '[PhotoRepositoryImpl] getPhotos called: limit=$limit, offset=$offset',
    );
    final rawPhotos = await _nativeScanner.getPhotos(
      limit: limit,
      offset: offset,
    );
    debugPrint(
      '[PhotoRepositoryImpl] rawPhotos received: ${rawPhotos.length} items',
    );
    if (rawPhotos.isNotEmpty) {
      debugPrint('[PhotoRepositoryImpl] first raw photo: ${rawPhotos.first}');
    }
    return rawPhotos.map((data) {
      return PhotoModel(
        id: data['id'].toString(),
        name: data['name'].toString(),
        path: data['path'].toString(),
        uri: data['uri'].toString(),
        size: (data['size'] as num).toInt(),
        dateModified: DateTime.fromMillisecondsSinceEpoch(
          (data['dateModified'] as num).toInt() * 1000,
        ),
      );
    }).toList();
  }
}

@riverpod
PhotoRepository photoRepository(PhotoRepositoryRef ref) {
  final nativeScanner = ref.watch(nativeStorageScannerProvider);
  return PhotoRepositoryImpl(nativeScanner);
}
