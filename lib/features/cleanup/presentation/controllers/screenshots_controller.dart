import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/screenshot_item.dart';
import 'screenshots_state.dart';

part 'screenshots_controller.g.dart';

@riverpod
class ScreenshotsController extends _$ScreenshotsController {
  @override
  ScreenshotsState build() {
    Future.microtask(() => loadScreenshots());
    return const ScreenshotsState(isLoading: true);
  }

  Future<void> loadScreenshots({int olderThanDays = 0}) async {
    final scanner = ref.read(nativeStorageScannerProvider);

    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final results = await scanner.getScreenshots(
        limit: 500,
        olderThanDays: olderThanDays,
      );

      final items = results.map((e) {
        return ScreenshotItem(
          id: (e['id'] ?? '').toString(),
          name: e['name'] ?? 'Unknown',
          size: e['size'] ?? 0,
          path: e['path'] ?? '',
          uri: e['uri'] ?? '',
          dateModified: e['dateModified'] ?? 0,
        );
      }).toList();

      state = state.copyWith(
        items: items,
        isLoading: false,
        totalSize: items.fold(0, (sum, item) => sum + item.size),
      );
      _updateSelectionStats();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void toggleSelection(String id) {
    state = state.copyWith(
      items: state.items.map((item) {
        if (item.id == id) {
          return item.copyWith(isSelected: !item.isSelected);
        }
        return item;
      }).toList(),
    );
    _updateSelectionStats();
  }

  void toggleAll(bool selected) {
    state = state.copyWith(
      items: state.items
          .map((item) => item.copyWith(isSelected: selected))
          .toList(),
    );
    _updateSelectionStats();
  }

  void _updateSelectionStats() {
    final selectedItems = state.items.where((item) => item.isSelected).toList();
    state = state.copyWith(
      selectedCount: selectedItems.length,
      selectedSize: selectedItems.fold(0, (sum, item) => sum + item.size),
    );
  }

  Future<bool> deleteSelected() async {
    // [Bug #2 fix] Compute everything once before any state mutation
    final selectedItems = state.items.where((item) => item.isSelected).toList();
    final selectedUris = selectedItems.map((item) => item.uri).toList();
    final totalSize = selectedItems.fold(0, (sum, item) => sum + item.size);

    if (selectedUris.isEmpty) return false; // [Bug #4 fix] Consistent: false

    final previousItems = state.items;
    state = state.copyWith(isDeleting: true);

    try {
      // Optimistic UI update
      state = state.copyWith(
        items: state.items.where((item) => !item.isSelected).toList(),
      );
      _updateSelectionStats();

      final repo = await ref.read(storageRepositoryProvider.future);
      final result = await repo.deleteFiles(selectedUris);

      if (result == true) {
        // [Bug #9 fix] Isolate logHistory so failure doesn't trigger rollback
        try {
          final breakdown = {
            'image/screenshot': selectedItems.length,
          }; // [Bug #7 fix]
          await repo.logHistory(
            type: 'screenshots',
            count: selectedItems.length,
            size: totalSize,
            details: selectedItems.take(3).map((e) => e.name).toList(),
            mimeBreakdown: breakdown,
          );
        } catch (e) {
          debugPrint('Failed to log screenshot cleanup history: $e');
        }

        // Refresh dashboard
        ref.read(dashboardControllerProvider.notifier).startScan();

        // [Bug #12 fix] Silent background refresh — don't set isLoading
        Future.delayed(const Duration(seconds: 1), () => _silentRefresh());
        return true;
      } else {
        // Rollback on failure
        state = state.copyWith(items: previousItems);
        _updateSelectionStats();
        return false;
      }
    } catch (e) {
      // Rollback on error
      state = state.copyWith(items: previousItems, errorMessage: e.toString());
      _updateSelectionStats();
      return false;
    } finally {
      state = state.copyWith(isDeleting: false);
    }
  }

  /// [Bug #12 fix] Refresh without showing loading spinner or wiping selections
  Future<void> _silentRefresh() async {
    try {
      final scanner = ref.read(nativeStorageScannerProvider);
      final results = await scanner.getScreenshots(limit: 500);
      final items = results.map((e) {
        return ScreenshotItem(
          id: (e['id'] ?? '').toString(),
          name: e['name'] ?? 'Unknown',
          size: e['size'] ?? 0,
          path: e['path'] ?? '',
          uri: e['uri'] ?? '',
          dateModified: e['dateModified'] ?? 0,
        );
      }).toList();

      state = state.copyWith(
        items: items,
        totalSize: items.fold(0, (sum, item) => sum + item.size),
      );
      _updateSelectionStats();
    } catch (e) {
      debugPrint('Silent refresh failed: $e');
    }
  }
}
