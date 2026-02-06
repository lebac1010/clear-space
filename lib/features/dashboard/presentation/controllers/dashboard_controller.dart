import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/storage_provider.dart';
import '../../domain/entities/storage_info.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<StorageInfo?> build() async {
    // Initial load: check permissions first?
    // Or just try to get info and let repo handle it?
    // Repository getStorageInfo checks logic, but permissions explicitly?

    // Better pattern: Load data if permission granted.
    // If not granted, state might be null or specific error.

    // For now, attempt to fetch.
    return _fetchData();
  }

  Future<StorageInfo?> _fetchData() async {
    final repo = await ref.read(storageRepositoryProvider.future);
    final hasPermission = await repo.checkPermissions();

    if (hasPermission) {
      return await repo.getStorageInfo();
    }
    return null; // or throw error to trigger error UI
  }

  Future<void> requestPermission() async {
    state = const AsyncLoading();
    try {
      final repo = await ref.read(storageRepositoryProvider.future);
      final granted = await repo.requestPermissions();
      if (granted) {
        final data = await repo.getStorageInfo();
        state = AsyncData(data);
      } else {
        // Handle denied state
        state = AsyncError('Permission Denied', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    // Only fetch cache or existing data
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData());

    // Auto-trigger scan? Or let UI decide?
    // Usually pull-to-refresh means "Scan Now"
    await startScan();
  }

  Future<void> startScan() async {
    try {
      final repo = await ref.read(storageRepositoryProvider.future);
      final info = await repo.getStorageInfo(forceRefresh: true);
      state = AsyncData(info);
    } catch (e, st) {
      // FIX #10: Log error and decide on state handling
      debugPrint('Scan failed: $e');
      debugPrint('Stack trace: $st');

      // Keep old data if available, otherwise show error
      final currentData = state.valueOrNull;
      if (currentData != null) {
        // Keep showing old data but could show a snackbar via callback
        state = AsyncData(currentData);
      } else {
        // No cached data, show error state
        state = AsyncError(e, st);
      }
    }
  }
}
