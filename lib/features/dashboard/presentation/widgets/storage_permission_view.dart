import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/extensions/build_context_x.dart';

import '../../../../core/widgets/app_button.dart';
import '../controllers/dashboard_controller.dart';

/// [A6] Shows permission request view with handling for permanently denied state.
class StoragePermissionView extends ConsumerStatefulWidget {
  const StoragePermissionView({super.key});

  @override
  ConsumerState<StoragePermissionView> createState() =>
      _StoragePermissionViewState();
}

class _StoragePermissionViewState extends ConsumerState<StoragePermissionView>
    with WidgetsBindingObserver {
  bool _isPermanentlyDenied = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissionStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Re-check permission when user returns from Settings
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissionStatus();
    }
  }

  Future<void> _checkPermissionStatus() async {
    final status = await Permission.manageExternalStorage.status;
    if (mounted) {
      setState(() => _isPermanentlyDenied = status.isPermanentlyDenied);
      // Auto-retry if permission was granted from Settings
      if (status.isGranted) {
        ref.read(dashboardControllerProvider.notifier).requestPermission();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer.withValues(
                  alpha: 0.6,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shield_outlined,
                size: 48,
                color: context.colorScheme.primary,
              ),
            ),
            const Gap(24),
            Text(
              'Storage Access Required',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            Text(
              _isPermanentlyDenied
                  ? 'Storage permission was denied. Please enable it in Settings to continue.'
                  : 'Clear Space needs "All files access" to scan your device for duplicates, large files, and junk files. \n\nYou will be directed to Settings to grant this permission.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(32),
            AppButton(
              text: _isPermanentlyDenied ? 'Open Settings' : 'Grant Access',
              onPressed: () {
                if (_isPermanentlyDenied) {
                  openAppSettings();
                } else {
                  ref
                      .read(dashboardControllerProvider.notifier)
                      .requestPermission();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
