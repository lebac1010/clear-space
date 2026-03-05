import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/cleanup_group.dart';
import '../../domain/entities/cleanup_item.dart';
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
          final sizeCompare = b.size.compareTo(a.size);
          if (sizeCompare != 0) return sizeCompare;
          return b.dateModified.compareTo(a.dateModified);
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

    // Collect all selected items
    final selectedItems = <CleanupItem>[];
    for (final group in currentState) {
      for (final item in group.items) {
        if (item.isSelected) {
          selectedItems.add(item);
        }
      }
    }

    final selectedUris = selectedItems.map((item) => item.uri).toList();
    final totalSize = selectedItems.fold(0, (sum, item) => sum + item.size);

    if (selectedUris.isEmpty) return false; // [Bug #4 fix] Consistent: false

    // Save for rollback
    final previousData = currentState;

    // [Bug #11 fix] Keep groups with 1 remaining item; only remove completely empty groups
    final optimisticGroups = currentState
        .map((group) {
          final remainingItems = group.items
              .where((item) => !item.isSelected)
              .toList();
          return group.copyWith(items: remainingItems);
        })
        .where(
          (group) => group.items.isNotEmpty,
        ) // Only remove truly empty groups
        .toList();

    state = AsyncData(optimisticGroups);

    try {
      final repository = await ref.read(cleanupRepositoryProvider.future);
      final success = await repository.deleteItems(
        selectedUris,
        permanent: false,
      );

      if (success) {
        // [Bug #9 fix] Isolate logHistory so failure doesn't trigger rollback
        try {
          // [Bug #5 fix] Use mediaType field instead of hardcoding image/
          final breakdown = <String, int>{};
          for (var item in selectedItems) {
            final mime = _getMimeFromType(item.mediaType);
            breakdown[mime] = (breakdown[mime] ?? 0) + 1;
          }

          final storageRepo = await ref.read(storageRepositoryProvider.future);
          await storageRepo.logHistory(
            type: type == CleanupType.similar ? 'similar_photos' : 'duplicates',
            count: selectedItems.length,
            size: totalSize,
            details: selectedItems.take(3).map((e) => e.name).toList(),
            mimeBreakdown: breakdown,
          );
        } catch (e) {
          debugPrint('Failed to log duplicate cleanup history: $e');
        }

        ref.read(dashboardControllerProvider.notifier).startScan();
        return true;
      } else {
        state = AsyncData(previousData);
        return false;
      }
    } catch (e) {
      state = AsyncData(previousData);
      return false;
    }
  }

  /// [Bug #5 fix] Proper MIME from mediaType field
  String _getMimeFromType(String? type) {
    if (type == null) return 'application/octet-stream';
    switch (type.toLowerCase()) {
      case 'video':
        return 'video/*';
      case 'image':
        return 'image/*';
      case 'audio':
        return 'audio/*';
      case 'document':
        return 'application/document';
      case 'archive':
        return 'application/archive';
      default:
        return 'application/octet-stream';
    }
  }
}
