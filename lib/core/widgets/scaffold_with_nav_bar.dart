import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:clear_space/core/extensions/build_context_x.dart';
import 'package:clear_space/features/dashboard/data/providers/storage_provider.dart';

/// A scaffold wrapper for the bottom navigation bar.
class ScaffoldWithNavBar extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  Future<void> _onTap(BuildContext context, WidgetRef ref, int index) async {
    final repository = await ref.read(storageRepositoryProvider.future);
    final permissionState = await repository.getPermissionState();
    final canOpenBranch = switch (index) {
      0 => true,
      1 => permissionState.canAccessCleanup,
      2 => permissionState.canAccessPhotos,
      3 => permissionState.canAccessFiles,
      _ => false,
    };

    if (!canOpenBranch) {
      navigationShell.goBranch(0);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              permissionState.isPermanentlyDenied
                  ? context.l10n.storagePermissionDeniedDesc
                  : context.l10n.storageAccessRequired,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => _onTap(context, ref, index),
        // Style handled by AppTheme.navigationBarTheme
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard),
            label: context.l10n.dashboardTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.cleaning_services_outlined),
            selectedIcon: const Icon(Icons.cleaning_services),
            label: context.l10n.cleanupTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.photo_library_outlined),
            selectedIcon: const Icon(Icons.photo_library),
            label: context.l10n.photosTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.folder_open_outlined),
            selectedIcon: const Icon(Icons.folder_open),
            label: context.l10n.filesTitle,
          ),
        ],
      ),
    );
  }
}
