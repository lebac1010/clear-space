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
      // Get cached data instantly
      final cached = await repo.getStorageInfo(forceRefresh: false);

      // FIX: The app used to just return cache and STOP.
      // This caused old bugged data to be permanently stuck on screen.
      // We must ALWAYS trigger a background scan on boot to refresh the cache.
      Future.microtask(() => startScan());

      return cached;
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
        state = const AsyncData(null);
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

      debugPrint(
        'FLUTTER DASHBOARD RECEIVED: '
        'junkCount=${info.junkCount} (size=${info.junkSize}), '
        'emptyFolderCount=${info.emptyFolderCount}, '
        'apkCount=${info.apkCount} (size=${info.apkSize})',
      );

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
