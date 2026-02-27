import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter/foundation.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/media_file.dart';

part 'media_explorer_controller.g.dart';

@riverpod
class MediaExplorerController extends _$MediaExplorerController {
  static const int _pageSize = 50;

  @override
  FutureOr<List<MediaFile>> build(String type) async {
    return _fetchMediaFiles(0);
  }

  Future<List<MediaFile>> _fetchMediaFiles(int offset) async {
    try {
      final repository = await ref.read(storageRepositoryProvider.future);
      final rawData = await repository.getMediaFiles(
        type: type,
        limit: _pageSize,
        offset: offset,
      );

      return rawData.map((data) => MediaFile.fromJson(data)).toList();
    } catch (e, st) {
      debugPrint('Failed to fetch media files of type $type: $e\n$st');
      throw Exception('Failed to load media files');
    }
  }

  bool _isLoadingMore = false;
  bool _hasMore = true;

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  Future<void> loadMore() async {
    if (state.isLoading || state.hasError || _isLoadingMore || !_hasMore) {
      return;
    }

    final currentFiles = state.value ?? [];
    _isLoadingMore = true;
    // Keep current state visible — do NOT set AsyncValue.loading()

    try {
      final newFiles = await _fetchMediaFiles(currentFiles.length);
      _isLoadingMore = false;
      if (newFiles.isEmpty) {
        _hasMore = false;
      }
      state = AsyncValue.data([...currentFiles, ...newFiles]);
    } catch (e, st) {
      _isLoadingMore = false;
      // Don't replace the whole state with error — keep existing data
      debugPrint('loadMore failed: $e\n$st');
    }
  }

  void toggleSelection(int id) {
    if (state.value == null) return;
    final files = state.value!;

    state = AsyncValue.data(
      files.map((file) {
        if (file.id == id) {
          return file.copyWith(isSelected: !file.isSelected);
        }
        return file;
      }).toList(),
    );
  }

  void selectAll() {
    if (state.value == null) return;
    state = AsyncValue.data(
      state.value!.map((f) => f.copyWith(isSelected: true)).toList(),
    );
  }

  void deselectAll() {
    if (state.value == null) return;
    state = AsyncValue.data(
      state.value!.map((f) => f.copyWith(isSelected: false)).toList(),
    );
  }

  Future<bool> deleteSelected() async {
    if (state.value == null) return false;
    final selectedFiles = state.value!.where((f) => f.isSelected).toList();
    if (selectedFiles.isEmpty) return false;

    try {
      final repository = await ref.read(storageRepositoryProvider.future);
      final uris = selectedFiles.map((f) => f.uri).toList();

      final success = await repository.deleteFiles(uris, permanent: false);

      if (success) {
        // Remove deleted files from state
        state = AsyncValue.data(
          state.value!.where((f) => !f.isSelected).toList(),
        );
        ref.read(dashboardControllerProvider.notifier).refresh();
        return true;
      }
      return false;
    } catch (e, st) {
      debugPrint('Failed to delete selected media files: $e\n$st');
      return false;
    }
  }

  bool get hasSelection {
    return state.value?.any((f) => f.isSelected) ?? false;
  }
}
