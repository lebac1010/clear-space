import 'dart:async';

import 'package:clear_space/features/cleanup/domain/entities/cleanup_group.dart';
import 'package:clear_space/features/cleanup/domain/entities/cleanup_item.dart';
import 'package:clear_space/features/cleanup/domain/repositories/cleanup_repository.dart';
import 'package:clear_space/features/cleanup/presentation/controllers/duplicate_controller.dart';
import 'package:clear_space/features/cleanup/presentation/providers/cleanup_provider.dart';
import 'package:clear_space/features/cleanup/presentation/screens/cleanup_screen.dart';
import 'package:clear_space/features/cleanup/presentation/screens/duplicate_list_screen.dart';
import 'package:clear_space/features/dashboard/data/providers/storage_provider.dart';
import 'package:clear_space/features/dashboard/domain/entities/large_file_info.dart';
import 'package:clear_space/features/dashboard/domain/entities/scan_progress.dart';
import 'package:clear_space/features/dashboard/domain/entities/storage_info.dart';
import 'package:clear_space/features/dashboard/domain/entities/storage_volume_info.dart';
import 'package:clear_space/features/dashboard/domain/repositories/storage_repository.dart';
import 'package:clear_space/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

// Fake Storage Repository
class FakeStorageRepository implements StorageRepository {
  @override
  Future<bool> checkPermissions() async => true;

  @override
  Future<bool> deleteFiles(List<String> uris, {bool permanent = false}) async =>
      true;

  @override
  Future<StorageInfo> getStorageInfo({bool forceRefresh = false}) async {
    return StorageInfo(
      totalSpace: 1000000000,
      freeSpace: 500000000,
      usedSpace: 500000000,
      photosCount: 100,
      photosSize: 1000000,
      videosCount: 10,
      videosSize: 500000,
      audioCount: 5,
      audioSize: 100000,
      documentsCount: 20,
      documentsSize: 200000,
      filesCount: 25,
      filesSize: 300000,
      systemSize: 400000000,
      appsCount: 100,
      duplicateCount: 5,
      duplicateSize: 50000,
      potentialSavings: 50000,
      similarPhotoCount: 10,
      similarPhotoSize: 52428800, // 50 MB
      largeFiles: <LargeFileInfo>[],
      storageVolumes: <StorageVolumeInfo>[],
      cloudOnlyCount: 0,
      scanDurationMs: 1000,
      lastUpdated: 0,
      isEstimated: false,
      junkCount: 0,
      junkSize: 0,
      emptyFolderCount: 0,
      apkCount: 0,
      apkSize: 0,
    );
  }

  @override
  Future<bool> requestPermissions() async => true;

  @override
  Future<List<Map<String, dynamic>>> getInstalledApps() async => [];

  @override
  Future<bool> uninstallApp(String packageName) async => false;

  @override
  Stream<ScanProgress> get scanProgress => const Stream.empty();

  @override
  Future<Map<String, dynamic>> cleanJunk(List<String> types) async {
    return {'count': 0, 'bytes': 0};
  }

  @override
  Future<bool> cleanJunkBackground(List<String> types) async {
    return true;
  }

  @override
  Future<Map<String, dynamic>?> getCleanupInfo() async {
    return {'background': true, 'started': true};
  }

  @override
  Future<List<Map<String, dynamic>>> getMediaFiles({
    required String type,
    int limit = 50,
    int offset = 0,
  }) async {
    return [];
  }
}

// Fake Cleanup Repository
class FakeCleanupRepository implements CleanupRepository {
  @override
  Future<bool> deleteItems(List<String> uris, {bool permanent = false}) async =>
      true;

  @override
  Future<List<CleanupGroup>> getDuplicateFiles() async => [];

  @override
  Future<List<CleanupGroup>> getLargeFiles() async => [];

  @override
  Future<List<CleanupGroup>> getSimilarPhotos() async {
    return [
      CleanupGroup(
        id: 'hash_A',
        title: 'IMG_1.jpg',
        totalSize: 15728640,
        items: [
          CleanupItem(
            id: '1',
            name: 'IMG_1.jpg',
            size: 10485760, // 10MB (Largest)
            path: '/path/IMG_1.jpg',
            uri: 'uri_img_1',
            thumbUrl: 'uri_img_1',
            dateModified: DateTime.now(), // Today
          ),
          CleanupItem(
            id: '2',
            name: 'IMG_2.jpg',
            size: 5242880, // 5MB
            path: '/path/IMG_2.jpg',
            uri: 'uri_img_2',
            thumbUrl: 'uri_img_2',
            dateModified: DateTime.now().subtract(
              const Duration(days: 1),
            ), // Yesterday
          ),
        ],
      ),
    ];
  }
}

void main() {
  testWidgets(
    'Full Integration: Dashboard -> Cleanup -> Similar Photos -> Smart Select -> Delete',
    (WidgetTester tester) async {
      // 1. Setup App with Routes and Overrides
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            storageRepositoryProvider.overrideWith(
              (ref) => Future.value(FakeStorageRepository()),
            ),
            cleanupRepositoryProvider.overrideWith(
              (ref) => Future.value(FakeCleanupRepository()),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: GoRouter(
              initialLocation: '/dashboard',
              routes: [
                GoRoute(
                  path: '/dashboard',
                  builder: (context, state) => const DashboardScreen(),
                ),
                GoRoute(
                  path: '/cleanup',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      // 2. Dashboard Loading & Navigation
      await tester.pumpAndSettle();

      // 3. Navigate to cleanup
      final dashboardFinder = find.byType(DashboardScreen);
      if (dashboardFinder.evaluate().isNotEmpty) {
        final context = tester.element(dashboardFinder);
        GoRouter.of(context).go('/cleanup');
        await tester.pumpAndSettle();
      } else {
        // Allow failure if Dashboard not found, but we proceed to check Cleanup
      }

      // 4. Verify Cleanup Screen
      expect(find.text('Similar Photos'), findsOneWidget);
      expect(find.text('50.0 MB'), findsOneWidget);

      // 5. Navigate to "Similar Photos" List
      await tester.tap(find.text('Similar Photos'));
      await tester.pumpAndSettle();

      // Verify DuplicateListScreen title
      expect(find.text('Similar Photos'), findsOneWidget);
      expect(find.text('IMG_1.jpg'), findsOneWidget);
      expect(find.text('IMG_2.jpg'), findsOneWidget);

      // 6. Test Smart Select Logic
      await tester.tap(find.text('Smart Select'));
      await tester.pump();

      // Logic:
      // IMG_1 (10MB, Largest) -> Should NOT be selected (Clean/Keep)
      // IMG_2 (5MB)  -> Should be selected (Delete)

      expect(find.text('1 items selected'), findsOneWidget);

      // 7. Delete Flow
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle(); // Dialog

      expect(find.text('Delete files?'), findsOneWidget);

      // Confirm delete
      await tester.tap(find.widgetWithText(FilledButton, 'Delete'));
      await tester.pumpAndSettle();
    },
  );
}
