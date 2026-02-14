import 'dart:io' as io;
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../application/smart_cleanup_service.dart';

part 'safe_cleanup_controller.g.dart';

@riverpod
class SafeCleanupController extends _$SafeCleanupController {
  bool _isPolling = false;

  @override
  FutureOr<SafeCleanupInfo?> build() async {
    // Check for background job on first load?
    // We can't easily distinguish first load from rebuilds triggered by dashboard refresh.
    // But we can check if we are already polling.
    if (!_isPolling) {
      Future.microtask(() => checkForBackgroundJob());
    }

    final dashboardState = ref.watch(dashboardControllerProvider);

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

  Future<void> cleanNow() async {
    state = const AsyncLoading();
    try {
      // Check Notification Permission for Background work
      if (io.Platform.isAndroid) {
        // Android 13+ (SDK 33)
        // We can't easily check SDK int here without device_info or relying on permission_handler specific behavior.
        // permission_handler manages validation.
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
        // Foreground done.
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
    } catch (e) {
      // access logic error or native error, fail silently or log
      // state = AsyncError(e, StackTrace.current); // Don't disrupt UI for bg check failure
    }
  }

  Future<void> _pollCleanupStatus() async {
    if (_isPolling) return;
    _isPolling = true;

    final repo = await ref.read(storageRepositoryProvider.future);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      final info = await repo.getCleanupInfo();

      if (info == null) {
        // Job disappeared or failed?
        break;
      }

      final stateStr =
          info['state']; // ENQUEUED, RUNNING, SUCCEEDED, FAILED, BLOCKED, CANCELLED

      if (stateStr == 'SUCCEEDED') {
        ref.read(dashboardControllerProvider.notifier).refresh();
        // State update handled by build() ref.watching dashboard.
        break;
      } else if (stateStr == 'FAILED' || stateStr == 'CANCELLED') {
        state = AsyncError('Cleanup $stateStr', StackTrace.current);
        break;
      }
      // If RUNNING, continue polling
    }
    _isPolling = false;
  }
}
