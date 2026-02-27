import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/cleanup_group.dart';
import '../providers/cleanup_provider.dart';

part 'duplicate_controller.g.dart';

enum CleanupType { duplicate, similar }

@riverpod
class DuplicateController extends _$DuplicateController {
  @override
  Future<List<CleanupGroup>> build(
    CleanupType type, {
    bool autoSmartSelect = false,
  }) async {
    final repository = await ref.watch(cleanupRepositoryProvider.future);
    List<CleanupGroup> groups;
    if (type == CleanupType.similar) {
      groups = await repository.getSimilarPhotos();
    } else {
      groups = await repository.getDuplicateFiles();
    }

    if (autoSmartSelect) {
      return _applySmartSelectLogic(groups);
    }
    return groups;
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

  void smartSelect() {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(_applySmartSelectLogic(currentState));
  }

  List<CleanupGroup> _applySmartSelectLogic(List<CleanupGroup> currentGroups) {
    return currentGroups.map((group) {
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
    }).toList();
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
        // [D1] Trigger background re-scan instead of invalidating (which causes full re-scan loop)
        // Cache was already cleared by deleteFiles() in the repository
        ref.read(dashboardControllerProvider.notifier).startScan();
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
