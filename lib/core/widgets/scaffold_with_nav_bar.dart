import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.cleaning_services_outlined),
            selectedIcon: Icon(Icons.cleaning_services),
            label: 'Cleanup',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined),
            selectedIcon: Icon(Icons.photo_library),
            label: 'Photos',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_open_outlined),
            selectedIcon: Icon(Icons.folder_open),
            label: 'Files',
          ),
        ],
      ),
    );
  }
}
