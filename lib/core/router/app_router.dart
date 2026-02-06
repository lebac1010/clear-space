import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter/material.dart';

import '../../features/cleanup/presentation/screens/cleanup_screen.dart';
import '../../features/contacts/presentation/screens/contacts_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/files/presentation/screens/files_screen.dart';
import '../../features/photos/presentation/screens/photos_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../widgets/scaffold_with_nav_bar.dart';
import 'route_constants.dart';

part 'app_router.g.dart';

/// Application router provider using GoRouter.
/// Includes error handling and uses route constants.
@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteConstants.dashboard,
    debugLogDiagnostics: kDebugMode,
    routes: [
      // Bottom Navigation Shell
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Dashboard Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.dashboard,
                name: 'dashboard',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          // Cleanup Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.cleanup,
                name: 'cleanup',
                builder: (context, state) => const CleanupScreen(),
              ),
            ],
          ),
          // Photos Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.photos,
                name: 'photos',
                builder: (context, state) => const PhotosScreen(),
              ),
            ],
          ),
          // Files Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.files,
                name: 'files',
                builder: (context, state) => const FilesScreen(),
              ),
            ],
          ),
        ],
      ),

      // Other Routes (Hide Bottom Nav)
      GoRoute(
        path: RouteConstants.contacts,
        name: 'contacts',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const ContactsScreen(),
      ),
      GoRoute(
        path: RouteConstants.settings,
        name: 'settings',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
