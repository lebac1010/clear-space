import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/cleanup_group.dart';
import '../../domain/entities/cleanup_item.dart';
import '../providers/cleanup_provider.dart';
import 'duplicate_controller.dart';

part 'smart_cleanup_controller.freezed.dart';
part 'smart_cleanup_controller.g.dart';

@freezed
class SmartCleanupState with _$SmartCleanupState {
  const factory SmartCleanupState({
    required int totalPotentialSavings,
    required int duplicateSize,
    required int similarPhotoSize,
    required int duplicateCount,
    required int similarPhotoCount,
    required List<CleanupItem> selectedItems,
    // [A10] Store raw items for instant toggle without refetching
    required List<CleanupItem> allDuplicateItems,
    required List<CleanupItem> allSimilarItems,
    @Default(true) bool duplicatesSelected,
    @Default(true) bool similarPhotosSelected,
    @Default(false) bool isCleaning,
    @Default(false) bool isCompleted,
  }) = _SmartCleanupState;
}

@riverpod
class SmartCleanupController extends _$SmartCleanupController {
  @override
  FutureOr<SmartCleanupState> build() async {
    final repository = await ref.watch(cleanupRepositoryProvider.future);

    // Fetch data in parallel
    final results = await Future.wait([
      repository.getDuplicateFiles(),
      repository.getSimilarPhotos(),
    ]);

    final duplicates = results[0];
    final similarPhotos = results[1];

    // Apply Smart Selection Logic (Calculate savings)
    final duplicateItems = _smartSelect(duplicates, CleanupType.duplicate);
    final similarItems = _smartSelect(similarPhotos, CleanupType.similar);

    // Initial state: Both selected
    return _calculateState(
      duplicateItems: duplicateItems,
      similarItems: similarItems,
      duplicatesSelected: true,
      similarPhotosSelected: true,
    );
  }

  SmartCleanupState _calculateState({
    required List<CleanupItem> duplicateItems,
    required List<CleanupItem> similarItems,
    required bool duplicatesSelected,
    required bool similarPhotosSelected,
  }) {
    final selectedItems = <CleanupItem>[];
    var savings = 0;

    if (duplicatesSelected) {
      selectedItems.addAll(duplicateItems);
      savings += duplicateItems.fold(0, (sum, item) => sum + item.size);
    }

    if (similarPhotosSelected) {
      selectedItems.addAll(similarItems);
      savings += similarItems.fold(0, (sum, item) => sum + item.size);
    }

    // Calculate raw totals for display regardless of selection
    final totalDuplicateSize = duplicateItems.fold(
      0,
      (sum, item) => sum + item.size,
    );
    final totalSimilarSize = similarItems.fold(
      0,
      (sum, item) => sum + item.size,
    );

    return SmartCleanupState(
      totalPotentialSavings: savings,
      duplicateSize: totalDuplicateSize,
      similarPhotoSize: totalSimilarSize,
      duplicateCount: duplicateItems.length,
      similarPhotoCount: similarItems.length,
      selectedItems: selectedItems,
      allDuplicateItems: duplicateItems,
      allSimilarItems: similarItems,
      duplicatesSelected: duplicatesSelected,
      similarPhotosSelected: similarPhotosSelected,
    );
  }

  // [A10] Instant toggle — no AsyncLoading, no refetch, just recalculate from cached items
  void toggleDuplicates(bool selected) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      _calculateState(
        duplicateItems: currentState.allDuplicateItems,
        similarItems: currentState.allSimilarItems,
        duplicatesSelected: selected,
        similarPhotosSelected: currentState.similarPhotosSelected,
      ),
    );
  }

  // [A10] Instant toggle
  void toggleSimilarPhotos(bool selected) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      _calculateState(
        duplicateItems: currentState.allDuplicateItems,
        similarItems: currentState.allSimilarItems,
        duplicatesSelected: currentState.duplicatesSelected,
        similarPhotosSelected: selected,
      ),
    );
  }

  /// Returns list of items SELECTED for deletion
  List<CleanupItem> _smartSelect(List<CleanupGroup> groups, CleanupType type) {
    final selected = <CleanupItem>[];

    for (final group in groups) {
      final sortedItems = List.of(group.items);

      if (type == CleanupType.similar) {
        // Similar: Prioritize Size (Quality) then Date
        sortedItems.sort((a, b) {
          final sizeCompare = b.size.compareTo(a.size); // Descending size
          if (sizeCompare != 0) return sizeCompare;
          return b.dateModified.compareTo(a.dateModified); // Descending date
        });
      } else {
        // Duplicates: Sort by date (newest first)
        sortedItems.sort((a, b) => b.dateModified.compareTo(a.dateModified));
      }

      // Keep the first one (Best/Newest), select others
      if (sortedItems.isNotEmpty) {
        // Skip the first one (Keep)
        selected.addAll(sortedItems.sublist(1));
      }
    }
    return selected;
  }

  Future<bool> executeCleanup() async {
    final currentState = state.value;
    if (currentState == null || currentState.selectedItems.isEmpty) return true;

    state = AsyncData(currentState.copyWith(isCleaning: true));

    try {
      final repository = await ref.read(cleanupRepositoryProvider.future);
      final uris = currentState.selectedItems.map((e) => e.uri).toList();

      final success = await repository.deleteItems(uris);

      if (success) {
        state = AsyncData(
          currentState.copyWith(isCleaning: false, isCompleted: true),
        );
        // [A3] Refresh dashboard after cleanup to reflect deleted files
        ref.read(dashboardControllerProvider.notifier).startScan();
      } else {
        state = AsyncData(currentState.copyWith(isCleaning: false));
      }
      return success;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
