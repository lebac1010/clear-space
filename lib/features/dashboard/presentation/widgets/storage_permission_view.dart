import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/providers/storage_provider.dart';
import '../../domain/entities/storage_permission_state.dart';
import '../controllers/dashboard_controller.dart';

/// [A6] Shows permission request view with handling for permanently denied state.
class StoragePermissionView extends ConsumerStatefulWidget {
  const StoragePermissionView({
    super.key,
    this.requiredAccess = RequiredStorageAccess.full,
    this.onPermissionGranted,
  });

  final RequiredStorageAccess requiredAccess;
  final VoidCallback? onPermissionGranted;

  @override
  ConsumerState<StoragePermissionView> createState() =>
      _StoragePermissionViewState();
}

class _StoragePermissionViewState extends ConsumerState<StoragePermissionView>
    with WidgetsBindingObserver {
  StoragePermissionState _permissionState = const StoragePermissionState.none();

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
    final repository = await ref.read(storageRepositoryProvider.future);
    final permissionState = await repository.getPermissionState();
    if (mounted) {
      setState(() => _permissionState = permissionState);
      if (permissionState.hasFullAccess) {
        ref.read(dashboardControllerProvider.notifier).refresh();
      }
      if (_hasRequiredAccess(permissionState)) {
        widget.onPermissionGranted?.call();
      }
    }
  }

  bool _hasRequiredAccess(StoragePermissionState permissionState) {
    return switch (widget.requiredAccess) {
      RequiredStorageAccess.media => permissionState.canAccessPhotos,
      RequiredStorageAccess.full => permissionState.hasFullAccess,
    };
  }

  Future<void> _handlePermissionAction() async {
    if (_permissionState.isPermanentlyDenied) {
      await openAppSettings();
      return;
    }

    final repository = await ref.read(storageRepositoryProvider.future);
    await repository.requestPermissions();
    await _checkPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
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
              context.l10n.storageAccessRequired,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            Text(
              _permissionState.isPermanentlyDenied
                  ? context.l10n.storagePermissionDeniedDesc
                  : context.l10n.storageAccessDesc,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (!_permissionState.isPermanentlyDenied) ...[
              const Gap(24),
              _PermissionDisclosureCard(
                icon: Icons.photo_library_outlined,
                iconColor: context.colorScheme.primary,
                title: context.l10n.permissionMediaTitle,
                description: context.l10n.permissionMediaDesc,
              ),
              const Gap(12),
              _PermissionDisclosureCard(
                icon: Icons.folder_open_outlined,
                iconColor: context.customColors.orange,
                title: context.l10n.permissionAllFilesTitle,
                description: context.l10n.permissionAllFilesDesc,
              ),
              const Gap(12),
              _PermissionDisclosureCard(
                icon: Icons.apps_outlined,
                iconColor: context.customColors.purple,
                title: context.l10n.permissionInstalledAppsTitle,
                description: context.l10n.permissionInstalledAppsDesc,
              ),
              const Gap(12),
              _PermissionDisclosureCard(
                icon: Icons.notifications_active_outlined,
                iconColor: context.customColors.success,
                title: context.l10n.permissionVisibleProgressTitle,
                description: context.l10n.permissionVisibleProgressDesc,
              ),
              const Gap(16),
              Text(
                context.l10n.permissionOnDeviceNote,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.appTextSecondary,
                  height: 1.45,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            const Gap(32),
            AppButton(
              text: _permissionState.isPermanentlyDenied
                  ? context.l10n.openSettings
                  : context.l10n.grantPermission,
              onPressed: _handlePermissionAction,
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionDisclosureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const _PermissionDisclosureCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.appSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appBorder.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 22, color: iconColor),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.appTextSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
