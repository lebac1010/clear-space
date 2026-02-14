import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/cleanup_item.dart';
import '../providers/cleanup_provider.dart';

part 'large_file_controller.g.dart';

enum LargeFileFilter { all, image, video, audio, document, other }

@riverpod
class LargeFileFilterNotifier extends _$LargeFileFilterNotifier {
  @override
  LargeFileFilter build() => LargeFileFilter.all;

  void setFilter(LargeFileFilter filter) => state = filter;
}

@riverpod
class LargeFileController extends _$LargeFileController {
  @override
  FutureOr<List<CleanupItem>> build() async {
    // Get large files from Dashboard Controller (Source of Truth)
    final storageInfo = await ref.watch(
      dashboardControllerProvider.selectAsync((data) => data),
    );

    if (storageInfo == null) return [];

    // Map LargeFileInfo to CleanupItem for UI consistency
    return storageInfo.largeFiles.map((file) {
      return CleanupItem(
        id: file.id.toString(), // LargeFileInfo uses int id
        path: file.path,
        uri: file.uri,
        name: file.name,
        size: file.size,
        dateModified: DateTime.fromMillisecondsSinceEpoch(
          file.dateModified * 1000,
        ), // Android usually seconds
        mediaType: file.mediaType,
        thumbUrl: null, // TODO: Add thumb support if possible
        isSelected: false,
      );
    }).toList();
  }

  void toggleSelection(String id) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      currentState.map((item) {
        if (item.id == id) {
          return item.copyWith(isSelected: !item.isSelected);
        }
        return item;
      }).toList(),
    );
  }

  void selectAll() {
    final currentState = state.value;
    if (currentState == null) return;

    // Check if all are selected
    final allSelected = currentState.every((item) => item.isSelected);

    state = AsyncData(
      currentState
          .map((item) => item.copyWith(isSelected: !allSelected))
          .toList(),
    );
  }

  Future<bool> deleteSelected() async {
    final currentState = state.value;
    if (currentState == null) return false;

    final selectedUris = currentState
        .where((item) => item.isSelected)
        .map((item) => item.uri)
        .toList();

    if (selectedUris.isEmpty) return true;

    state = const AsyncLoading();

    try {
      final repository = await ref.read(cleanupRepositoryProvider.future);
      final success = await repository.deleteItems(
        selectedUris,
        permanent: false,
      );

      if (success) {
        // Refresh Dashboard to update source of truth
        ref.invalidate(dashboardControllerProvider);
        // We don't need to manual refresh self because we watch dashboardControllerProvider
      } else {
        ref.invalidateSelf();
      }
      return success;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
