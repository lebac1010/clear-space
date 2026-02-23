import 'dart:io' as io;
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../application/smart_cleanup_service.dart';

part 'safe_cleanup_controller.g.dart';

@Riverpod(
  keepAlive: true,
) // Fix #3: Prevent rebuild-caused reinstantiation losing _isPolling
class SafeCleanupController extends _$SafeCleanupController {
  bool _isPolling = false;

  @override
  FutureOr<SafeCleanupInfo?> build() async {
    // Check for background job on first load
    if (!_isPolling) {
      Future.microtask(() => checkForBackgroundJob());
    }

    // [A2] Use ref.read instead of ref.watch to break circular dependency
    // SafeCleanupController (keepAlive) watching DashboardController (keepAlive)
    // caused infinite rebuild loops when dashboard state changed.
    final dashboardState = ref.read(dashboardControllerProvider);

    return dashboardState.when(
      data: (info) {
        if (info == null) return null;
        final service = ref.read(smartCleanupServiceProvider.notifier);
        return service.getSafeCleanupInfo(info);
      },
      error: (_, __) => null,
      loading: () => null,
    );
  }

  /// Manually refresh when dashboard data changes (called externally)
  void refreshFromDashboard() {
    ref.invalidateSelf();
  }

  Future<void> cleanNow() async {
    state = const AsyncLoading();
    try {
      // Check Notification Permission for Background work
      if (io.Platform.isAndroid) {
        final status = await Permission.notification.status;
        if (status.isDenied) {
          await Permission.notification.request();
        }
      }

      final service = ref.read(smartCleanupServiceProvider.notifier);
      final result = await service.cleanSafeItems();

      if (result['background'] == true) {
        // Background job started. Start polling.
        await _pollCleanupStatus();
      } else {
        // Foreground done. Force refresh to get updated counts.
        ref.read(dashboardControllerProvider.notifier).refresh();
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> checkForBackgroundJob() async {
    if (_isPolling) return;
    try {
      final repo = await ref.read(storageRepositoryProvider.future);
      final info = await repo.getCleanupInfo();
      if (info != null &&
          (info['state'] == 'RUNNING' || info['state'] == 'ENQUEUED')) {
        state = const AsyncLoading();
        _pollCleanupStatus();
      }
    } catch (_) {
      // Native bridge error on startup — fail silently, don't disrupt UI
    }
  }

  // Fix #5: Added try/catch inside loop body + timeout + finally block
  Future<void> _pollCleanupStatus() async {
    if (_isPolling) return;
    _isPolling = true;

    try {
      final repo = await ref.read(storageRepositoryProvider.future);
      int attempts = 0;
      const maxAttempts = 300; // 5-minute timeout (300 × 1 second)

      while (attempts < maxAttempts) {
        attempts++;
        await Future.delayed(const Duration(seconds: 1));

        try {
          final info = await repo.getCleanupInfo();

          if (info == null) {
            // Job disappeared — break out
            break;
          }

          final stateStr = info['state'];

          if (stateStr == 'SUCCEEDED') {
            // Fix #6: Force dashboard refresh to get fresh data (not stale cache)
            ref.read(dashboardControllerProvider.notifier).refresh();
            break;
          } else if (stateStr == 'FAILED' || stateStr == 'CANCELLED') {
            state = AsyncError('Cleanup $stateStr', StackTrace.current);
            break;
          }
          // If RUNNING or ENQUEUED, continue polling
        } catch (_) {
          // Native bridge error mid-poll — retry on next iteration
          continue;
        }
      }

      // If we hit maxAttempts, treat as timeout
      if (attempts >= maxAttempts) {
        state = AsyncError('Cleanup timed out', StackTrace.current);
      }
    } finally {
      _isPolling = false; // ALWAYS reset, even on exception
    }
  }
}
