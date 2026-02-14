import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    @Default(true) bool duplicatesSelected, // NEW
    @Default(true) bool similarPhotosSelected, // NEW
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
      duplicatesSelected: duplicatesSelected,
      similarPhotosSelected: similarPhotosSelected,
    );
  }

  void toggleDuplicates(bool selected) async {
    final currentState = state.value;
    if (currentState == null) return;

    // We need the original full lists to recalculate.
    // Since we don't store them in state, we might need to fetch/store them.
    // Optimization: Store full lists in state or re-fetch (fast since cached in Repo/Provider).
    // Better: Store raw items in state too? Or just re-run the logic?
    // Re-running build logic is hard without refetching.
    // Let's modify state to hold the 'raw' items or just re-fetch since repo is likely caching.

    // Actually, to avoid refetching, let's just keep the processed lists in the class?
    // No, Controller is recreated.
    // Let's rely on Repository caching which is already implemented for these methods.

    state = const AsyncLoading();

    // Re-run build-like logic but with new selection
    // Ideally we should refactor build to separate data fetching from state calculation.

    final repository = await ref.read(cleanupRepositoryProvider.future);
    final results = await Future.wait([
      repository.getDuplicateFiles(),
      repository.getSimilarPhotos(),
    ]);

    final duplicateItems = _smartSelect(results[0], CleanupType.duplicate);
    final similarItems = _smartSelect(results[1], CleanupType.similar);

    state = AsyncData(
      _calculateState(
        duplicateItems: duplicateItems,
        similarItems: similarItems,
        duplicatesSelected: selected,
        similarPhotosSelected: currentState.similarPhotosSelected,
      ),
    );
  }

  void toggleSimilarPhotos(bool selected) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = const AsyncLoading();

    final repository = await ref.read(cleanupRepositoryProvider.future);
    final results = await Future.wait([
      repository.getDuplicateFiles(),
      repository.getSimilarPhotos(),
    ]);

    final duplicateItems = _smartSelect(results[0], CleanupType.duplicate);
    final similarItems = _smartSelect(results[1], CleanupType.similar);

    state = AsyncData(
      _calculateState(
        duplicateItems: duplicateItems,
        similarItems: similarItems,
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
        // Invalidate self to refresh data
        state = AsyncData(
          currentState.copyWith(isCleaning: false, isCompleted: true),
        );
        // Need to refresh repository/dashboard too?
        // Ref.invalidate(dashboardControllerProvider); // Ideally
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
