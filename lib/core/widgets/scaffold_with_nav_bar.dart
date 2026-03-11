import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clear_space/core/extensions/build_context_x.dart';

/// A scaffold wrapper for the bottom navigation bar.
class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => _onTap(context, index),
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
