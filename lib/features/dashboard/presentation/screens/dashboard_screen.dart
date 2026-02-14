import 'package:clear_space/core/theme/app_colors.dart';
import 'package:clear_space/core/widgets/app_button.dart';
import 'package:clear_space/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/storage_category_tile.dart';
import '../widgets/storage_overview_card.dart';
import '../widgets/storage_permission_view.dart';
import '../../../../core/router/route_constants.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {}, // TODO: Drawer
            ),
            const Gap(8),
            Text(
              'Storage Dashboard',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Context is valid here for GoRouter if needed
            },
          ),
          const Gap(8),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (info) {
          if (info == null) {
            return const StoragePermissionView();
          }

          return Stack(
            children: [
              // Scrollable Content
              ListView(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 100, // Space for fixed button
                ),
                children: [
                  StorageOverviewCard(info: info),

                  const Gap(24),

                  if (info.junkSize > 0 ||
                      info.emptyFolderCount > 0 ||
                      info.apkCount > 0)
                    Card(
                      color: Theme.of(context).colorScheme.errorContainer,
                      child: ListTile(
                        leading: Icon(
                          Icons.delete_sweep,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        title: Text(
                          'Junk Files Found',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${info.emptyFolderCount + info.apkCount + info.junkCount} items can be cleaned',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                          ),
                        ),
                        trailing: FilledButton.icon(
                          onPressed: () =>
                              context.push(RouteConstants.junkFiles),
                          icon: const Icon(Icons.arrow_forward, size: 16),
                          label: const Text('Review'),
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.error,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onError,
                          ),
                        ),
                      ),
                    ),

                  const Gap(24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Storage Breakdown',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go(RouteConstants.files),
                        child: const Text('View Details'),
                      ),
                    ],
                  ),

                  const Gap(8),

                  StorageCategoryTile(
                    icon: Icons.image_outlined,
                    color: Colors.purple,
                    title: 'Photos & Images',
                    count: info.photosCount,
                    sizeBytes: info.photosSize,
                    percentage: info.totalSpace > 0
                        ? info.photosSize / info.totalSpace
                        : 0,
                    onTap: () => context.go(RouteConstants.photos),
                  ),
                  const Gap(12),
                  StorageCategoryTile(
                    icon: Icons.movie_outlined,
                    color: Colors.pink,
                    title: 'Videos',
                    count: info.videosCount,
                    sizeBytes: info.videosSize,
                    percentage: info.totalSpace > 0
                        ? info.videosSize / info.totalSpace
                        : 0,
                    onTap: () =>
                        context.go('${RouteConstants.files}?category=video'),
                  ),
                  const Gap(12),
                  StorageCategoryTile(
                    icon: Icons.audiotrack_outlined,
                    color: Colors.deepOrange,
                    title: 'Audio',
                    count: info.audioCount,
                    sizeBytes: info.audioSize,
                    percentage: info.totalSpace > 0
                        ? info.audioSize / info.totalSpace
                        : 0,
                    onTap: () =>
                        context.go('${RouteConstants.files}?category=audio'),
                  ),
                  const Gap(12),
                  StorageCategoryTile(
                    icon: Icons.folder_open_outlined,
                    color: Colors.orange,
                    title: 'Documents & Files',
                    count: info.filesCount,
                    sizeBytes: info.filesSize,
                    percentage: info.totalSpace > 0
                        ? info.filesSize / info.totalSpace
                        : 0,
                    onTap: () =>
                        context.go('${RouteConstants.files}?category=document'),
                  ),
                  const Gap(12),
                  StorageCategoryTile(
                    icon: Icons.dns_outlined,
                    color: Colors.blueGrey,
                    title: 'System & Apps',
                    count: info.appsCount,
                    sizeBytes: info.systemSize,
                    percentage: info.totalSpace > 0
                        ? info.systemSize / info.totalSpace
                        : 0,
                    onTap: () =>
                        context.go('${RouteConstants.files}?category=apps'),
                  ),
                ],
              ),

              // Bottom Fixed CTA
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.95),
                    border: const Border(
                      top: BorderSide(color: AppColors.border),
                    ),
                  ),
                  child: AppButton(
                    text: 'Smart Cleanup Plan',
                    icon: const Icon(Icons.cleaning_services_outlined),
                    onPressed: () {
                      context.push(RouteConstants.smartCleanup);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
