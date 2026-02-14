import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/cleanup_group.dart';
import '../providers/cleanup_provider.dart';

part 'duplicate_controller.g.dart';

enum CleanupType { duplicate, similar }

@riverpod
class DuplicateController extends _$DuplicateController {
  @override
  Future<List<CleanupGroup>> build(CleanupType type) async {
    final repository = await ref.watch(cleanupRepositoryProvider.future);
    if (type == CleanupType.similar) {
      return repository.getSimilarPhotos();
    }
    return repository.getDuplicateFiles();
  }

  /// Toggle selection of a file
  void toggleSelection(String groupId, String fileId) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      currentState.map((group) {
        if (group.id == groupId) {
          final updatedItems = group.items.map((item) {
            if (item.id == fileId) {
              return item.copyWith(isSelected: !item.isSelected);
            }
            return item;
          }).toList();

          return group.copyWith(items: updatedItems);
        }
        return group;
      }).toList(),
    );
  }

  /// Smart Select:
  /// - Duplicates: Keep Newest (Default) - or Oldest? Usually we keep the one we want. keeping newest is safer?
  ///   Actually, typically "Keep Oldest" (original) is preferred for duplicates if they are identical.
  ///   But User didn't specify for Duplicates.
  /// - Similar: Keep Best (Largest Size) or Newest.
  void smartSelect() {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      currentState.map((group) {
        final sortedItems = List.of(group.items);

        if (type == CleanupType.similar) {
          // Similar: Prioritize Size (Quality) then Date
          sortedItems.sort((a, b) {
            final sizeCompare = b.size.compareTo(a.size); // Desecending size
            if (sizeCompare != 0) return sizeCompare;
            return b.dateModified.compareTo(a.dateModified); // Descending date
          });
        } else {
          // Duplicates: Sort by date (newest first)
          sortedItems.sort((a, b) => b.dateModified.compareTo(a.dateModified));
        }

        // Keep the first one (Best/Newest), select others
        if (sortedItems.isNotEmpty) {
          final keepId = sortedItems.first.id;
          final updatedItems = group.items.map((item) {
            return item.copyWith(isSelected: item.id != keepId);
          }).toList();
          return group.copyWith(items: updatedItems);
        }
        return group;
      }).toList(),
    );
  }

  /// Delete selected files
  Future<bool> deleteSelected() async {
    final currentState = state.value;
    if (currentState == null) return false;

    // Collect all selected URIs
    final selectedUris = <String>[];
    for (final group in currentState) {
      for (final item in group.items) {
        if (item.isSelected) {
          selectedUris.add(item.uri);
        }
      }
    }

    if (selectedUris.isEmpty) return true;

    state = const AsyncLoading(); // Show loading while deleting

    try {
      final repository = await ref.read(cleanupRepositoryProvider.future);

      // Use "Smart Delete" (Move to Trash)
      final success = await repository.deleteItems(
        selectedUris,
        permanent: false,
      );

      if (success) {
        // Refresh list
        ref.invalidateSelf();
        // Also refresh storage info
        ref.invalidate(storageRepositoryProvider);
        ref.invalidate(dashboardControllerProvider);
      } else {
        // Restore state if failed (or partially failed?)
        // Ideally we should reload
        ref.invalidateSelf();
      }
      return success;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
