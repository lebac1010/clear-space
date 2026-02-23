import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/photo_model.dart';
import '../../data/repositories/photo_repository_impl.dart';

part 'photos_controller.g.dart';

@riverpod
class PhotosController extends _$PhotosController {
  static const int _pageSize = 50;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  @override
  Future<List<PhotoModel>> build() async {
    _hasMore = true;
    _isLoadingMore = false;
    debugPrint('[PhotosController] build() called, fetching offset=0');
    final result = await _fetchPhotos(offset: 0);
    debugPrint('[PhotosController] build() got ${result.length} photos');
    return result;
  }

  Future<List<PhotoModel>> _fetchPhotos({required int offset}) async {
    final repository = ref.read(photoRepositoryProvider);
    final photos = await repository.getPhotos(limit: _pageSize, offset: offset);

    if (photos.length < _pageSize) {
      _hasMore = false;
    }

    return photos;
  }

  Future<void> loadMore() async {
    if (!_hasMore || _isLoadingMore) return;

    final currentData = state.valueOrNull;
    if (currentData == null) return;

    _isLoadingMore = true;

    try {
      final newPhotos = await _fetchPhotos(offset: currentData.length);
      if (newPhotos.isEmpty) {
        _hasMore = false;
        return;
      }

      state = AsyncData([...currentData, ...newPhotos]);
    } catch (e) {
      // Don't replace the entire state with error — user still sees existing photos.
      // Just log the error and let them retry on next scroll.
      _hasMore = false;
    } finally {
      _isLoadingMore = false;
    }
  }
}
