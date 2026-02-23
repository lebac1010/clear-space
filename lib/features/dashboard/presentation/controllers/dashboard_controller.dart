import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/storage_provider.dart';
import '../../domain/entities/storage_info.dart';

part 'dashboard_controller.g.dart';

@Riverpod(keepAlive: true)
class DashboardController extends _$DashboardController {
  // [A1] Debounce flag to prevent concurrent scan requests
  bool _scanPending = false;

  @override
  FutureOr<StorageInfo?> build() async {
    // Return cached data immediately if available — prevents "scanning forever" on back-nav
    return _fetchData();
  }

  Future<StorageInfo?> _fetchData() async {
    final repo = await ref.read(storageRepositoryProvider.future);
    final hasPermission = await repo.checkPermissions();

    if (hasPermission) {
      // This will return cache first if available (fast), or scan if no cache
      return await repo.getStorageInfo();
    }
    return null; // No permission — show permission view
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
        state = AsyncError('Permission Denied', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    // Show existing data while scanning (don't go to loading spinner)
    final currentData = state.valueOrNull;
    if (currentData != null) {
      // Keep showing current data — don't reset to AsyncLoading
      // The scan will update state when complete
    } else {
      state = const AsyncLoading();
    }

    await startScan();
  }

  Future<void> startScan() async {
    // [A1] Debounce: if a scan is already in progress, skip
    if (_scanPending) return;
    _scanPending = true;

    try {
      final repo = await ref.read(storageRepositoryProvider.future);
      final info = await repo.getStorageInfo(forceRefresh: true);
      state = AsyncData(info);
    } catch (e, st) {
      debugPrint('Scan failed: $e');
      debugPrint('Stack trace: $st');

      // Keep old data if available, otherwise show error
      final currentData = state.valueOrNull;
      if (currentData != null) {
        state = AsyncData(currentData);
      } else {
        state = AsyncError(e, st);
      }
    } finally {
      _scanPending = false;
    }
  }
}
