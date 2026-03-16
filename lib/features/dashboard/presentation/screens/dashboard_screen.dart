import 'package:clear_space/core/widgets/app_button.dart';
import 'package:clear_space/core/ads/ad_unit_ids.dart';
import 'package:clear_space/core/ads/widgets/native_template_ad_card.dart';
import 'package:clear_space/core/extensions/build_context_x.dart';
import 'package:clear_space/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:clear_space/features/dashboard/presentation/providers/scan_progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/scan_progress.dart';
import '../../domain/entities/storage_info.dart';
import '../widgets/storage_category_tile.dart';
import '../widgets/storage_overview_card.dart';
import '../widgets/storage_permission_view.dart';
import '../../../../core/router/route_constants.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    // Watch scan progress for per-category "Analyzing..." state
    final scanAsync = ref.watch(scanProgressProvider);
    final isScanning =
        scanAsync.hasValue &&
        scanAsync.value != null &&
        scanAsync.value!.phase != ScanPhase.complete &&
        scanAsync.value!.phase != ScanPhase.error &&
        scanAsync.value!.phase != ScanPhase.cancelled &&
        scanAsync.value!.phase != ScanPhase.cacheInvalidated;

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appSurface,
        elevation: 0,
        centerTitle: false,
        title: Text(
          context.l10n.storageDashboard,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 16, // Better alignment after removing menu
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              context.push(RouteConstants.settings);
            },
          ),
          const Gap(8),
        ],
      ),
      body: state.when(
        loading: () => _buildDashboard(
          context,
          ref,
          StorageInfo.empty(),
          isScanning: true,
        ),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (info) {
          if (info == null) {
            return const StoragePermissionView();
          }
          return _buildDashboard(context, ref, info, isScanning: isScanning);
        },
      ),
    );
  }

  Widget _buildDashboard(
    BuildContext context,
    WidgetRef ref,
    StorageInfo info, {
    required bool isScanning,
  }) {
    return Stack(
      children: [
        // Scrollable Content
        RefreshIndicator(
          onRefresh: () =>
              ref.read(dashboardControllerProvider.notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 100, // Space for fixed button
            ),
            children: [
              StorageOverviewCard(info: info),
              const NativeTemplateAdCard(
                placement: AppNativeAdPlacement.dashboard,
                margin: EdgeInsets.only(top: 12, bottom: 10),
              ),

              if (!isScanning &&
                  (info.junkSize > 0 ||
                      info.emptyFolderCount > 0 ||
                      info.apkCount > 0))
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: ListTile(
                    leading: Icon(
                      Icons.delete_sweep,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                    title: Text(
                      context.l10n.junkFilesFound,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      context.l10n.itemsCanBeCleaned(
                        info.emptyFolderCount + info.apkCount + info.junkCount,
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                    trailing: FilledButton.icon(
                      onPressed: () => context.push(RouteConstants.junkFiles),
                      icon: const Icon(Icons.arrow_forward, size: 16),
                      label: Text(context.l10n.review),
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ),
                ),

              const Gap(10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.storageBreakdown,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go(RouteConstants.files),
                    child: Text(context.l10n.viewDetails),
                  ),
                ],
              ),

              const Gap(8),

              StorageCategoryTile(
                icon: Icons.image_outlined,
                color: context.customColors.purple,
                title: context.l10n.photosAndImages,
                count: info.photosCount,
                sizeBytes: info.photosSize,
                percentage: info.totalSpace > 0
                    ? info.photosSize / info.totalSpace
                    : 0,
                isScanning: isScanning,
                onTap: () => context.go(RouteConstants.photos),
              ),
              const Gap(12),
              StorageCategoryTile(
                icon: Icons.movie_outlined,
                color: const Color(0xFFE573B4),
                title: context.l10n.videos,
                count: info.videosCount,
                sizeBytes: info.videosSize,
                percentage: info.totalSpace > 0
                    ? info.videosSize / info.totalSpace
                    : 0,
                isScanning: isScanning,
                onTap: () =>
                    context.go('${RouteConstants.files}?category=video'),
              ),
              const Gap(12),
              StorageCategoryTile(
                icon: Icons.audiotrack_outlined,
                color: const Color(0xFFFF8A65),
                title: context.l10n.audio,
                count: info.audioCount,
                sizeBytes: info.audioSize,
                percentage: info.totalSpace > 0
                    ? info.audioSize / info.totalSpace
                    : 0,
                isScanning: isScanning,
                onTap: () =>
                    context.go('${RouteConstants.files}?category=audio'),
              ),
              const Gap(12),
              StorageCategoryTile(
                icon: Icons.folder_open_outlined,
                color: context.customColors.orange,
                title: context.l10n.documentsAndFiles,
                count: info.documentsCount,
                sizeBytes: info.documentsSize,
                percentage: info.totalSpace > 0
                    ? info.documentsSize / info.totalSpace
                    : 0,
                isScanning: isScanning,
                onTap: () =>
                    context.go('${RouteConstants.files}?category=document'),
              ),
              const Gap(12),
              StorageCategoryTile(
                icon: Icons.dns_outlined,
                color: context.customColors.secondary,
                title: context.l10n.systemAndApps,
                count: info.appsCount,
                sizeBytes: info.systemSize,
                percentage: info.totalSpace > 0
                    ? info.systemSize / info.totalSpace
                    : 0,
                isScanning: isScanning,
                onTap: () => context.push(RouteConstants.apps),
              ),
            ],
          ),
        ),

        // Bottom Fixed CTA
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.appBackground.withValues(alpha: 0.95),
              border: Border(top: BorderSide(color: context.appBorder)),
            ),
            child: AppButton(
              text: context.l10n.smartCleanupPlan,
              icon: const Icon(Icons.cleaning_services_outlined),
              onPressed: () {
                context.push(RouteConstants.smartCleanup);
              },
            ),
          ),
        ),
      ],
    );
  }
}
