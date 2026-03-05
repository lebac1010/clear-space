import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter/material.dart';

import '../../features/cleanup/presentation/screens/cleanup_screen.dart';
import '../../features/cleanup/presentation/screens/duplicate_list_screen.dart';
import '../../features/cleanup/presentation/screens/large_file_list_screen.dart';
import '../../features/cleanup/presentation/screens/smart_cleanup_plan_screen.dart';
import '../../features/cleanup/presentation/controllers/duplicate_controller.dart'; // Import CleanupType
import '../../features/contacts/presentation/screens/contacts_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/cleanup/presentation/screens/junk_files_screen.dart';
import '../../features/cleanup/presentation/screens/junk_detail_screen.dart';
import '../../features/files/presentation/screens/media_explorer_screen.dart';
import '../../features/apps/presentation/screens/app_manager_screen.dart';
import '../../features/photos/presentation/screens/photos_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/cleanup/presentation/screens/screenshots_cleaner_screen.dart';
import '../../features/cleanup/presentation/screens/downloads_cleaner_screen.dart';
import '../../features/cleanup/presentation/screens/cleanup_history_screen.dart';
import '../services/app_settings_service.dart';
import '../widgets/scaffold_with_nav_bar.dart';
import 'route_constants.dart';

part 'app_router.g.dart';

/// Application router provider using GoRouter.
/// Includes error handling and uses route constants.
// [A7] keepAlive: true — prevents router disposal (losing back stack and nav state)
@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteConstants.dashboard,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      // Check if onboarding is completed
      // Now reads synchronously since it's initialized before runApp()
      final settings = ref.read(appSettingsServiceProvider);

      final onboardingCompleted = settings.isOnboardingCompleted();
      final isGoingToOnboarding =
          state.matchedLocation == RouteConstants.onboarding;

      if (!onboardingCompleted) {
        return isGoingToOnboarding ? null : RouteConstants.onboarding;
      }

      if (onboardingCompleted && isGoingToOnboarding) {
        return RouteConstants.dashboard;
      }

      return null;
    },
    routes: [
      // Onboarding Route (Full screen)
      GoRoute(
        path: RouteConstants.onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

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
                routes: [
                  GoRoute(
                    path: 'duplicates',
                    name: 'duplicates',
                    builder: (context, state) {
                      final typeStr = state.uri.queryParameters['type'];
                      final type = typeStr == 'similar'
                          ? CleanupType.similar
                          : CleanupType.duplicate;
                      return DuplicateListScreen(type: type);
                    },
                  ),
                  GoRoute(
                    path: 'large-files',
                    name: 'large-files',
                    builder: (context, state) => const LargeFileListScreen(),
                  ),
                  GoRoute(
                    path: 'smart',
                    name: 'smart-cleanup',
                    parentNavigatorKey: rootNavigatorKey, // Full screen
                    builder: (context, state) => const SmartCleanupPlanScreen(),
                  ),
                  GoRoute(
                    path: 'junk',
                    name: 'junk-files',
                    parentNavigatorKey: rootNavigatorKey, // Full screen
                    builder: (context, state) => const JunkFilesScreen(),
                  ),
                  GoRoute(
                    path: 'screenshots',
                    name: 'screenshots',
                    parentNavigatorKey: rootNavigatorKey, // Full screen
                    builder: (context, state) =>
                        const ScreenshotsCleanerScreen(),
                  ),
                  GoRoute(
                    path: 'downloads',
                    name: 'downloads',
                    parentNavigatorKey: rootNavigatorKey, // Full screen
                    builder: (context, state) => const DownloadsCleanerScreen(),
                  ),
                  GoRoute(
                    path: 'history',
                    name: 'history',
                    parentNavigatorKey: rootNavigatorKey, // Full screen
                    builder: (context, state) => const CleanupHistoryScreen(),
                  ),
                ],
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
                routes: [
                  GoRoute(
                    path: 'duplicates',
                    name: 'photos-duplicates',
                    builder: (context, state) {
                      final typeStr = state.uri.queryParameters['type'];
                      final type = typeStr == 'similar'
                          ? CleanupType.similar
                          : CleanupType.duplicate;
                      return DuplicateListScreen(type: type);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Files Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.files,
                name: 'media-explorer',
                builder: (context, state) {
                  final String? category =
                      state.uri.queryParameters['category'];

                  // Map dashboard categories to tab types
                  String initialType = 'audio';
                  if (category == 'video') initialType = 'video';
                  if (category == 'document') initialType = 'documents';
                  // 'apps' category is not supported in these tabs yet, fallback to audio

                  return MediaExplorerScreen(initialType: initialType);
                },
              ),
            ],
          ),
        ],
      ),

      // Other Routes (Hide Bottom Nav)
      GoRoute(
        path: RouteConstants.apps,
        name: 'apps',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const AppManagerScreen(),
      ),
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
      // Full-screen detail view for Smart Cleanup items
      GoRoute(
        path: RouteConstants.smartDetail,
        name: 'smart-detail',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final typeStr = state.uri.queryParameters['type'];
          final autoSelectStr = state.uri.queryParameters['autoSelect'];

          final type = typeStr == 'similar'
              ? CleanupType.similar
              : CleanupType.duplicate;
          final autoSelect = autoSelectStr == 'true';

          return DuplicateListScreen(type: type, autoSmartSelect: autoSelect);
        },
      ),
      // Full-screen detail view for Junk categories
      GoRoute(
        path: RouteConstants.junkDetail,
        name: 'junk-detail',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final type = state.uri.queryParameters['type'] ?? 'junk';
          return JunkDetailScreen(type: type);
        },
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
