import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/widgets/app_card.dart';
import '../controllers/downloads_controller.dart';
import '../controllers/screenshots_controller.dart';
import '../widgets/cleanup_category_tile.dart';

import '../../../../core/utils/file_utils.dart';

class CleanupScreen extends ConsumerWidget {
  const CleanupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(dashboardControllerProvider);
    final screenshotsState = ref.watch(screenshotsControllerProvider);
    final downloadsState = ref.watch(downloadsControllerProvider);

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Cleanup',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(RouteConstants.settings),
          ),
          const Gap(8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _CleanupHeader(),
                const Gap(24),
                Text(
                  'Suggestions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.appTextPrimary,
                  ),
                ),
                const Gap(16),
                CleanupCategoryTile(
                  title: 'Duplicate Files',
                  subtitle: 'Find and remove identical files',
                  size: storageAsync.when(
                    data: (info) => info != null
                        ? FileUtils.formatSize(info.potentialSavings)
                        : '0 B',
                    loading: () => 'Analyzing...',
                    error: (_, __) => 'Error',
                  ),
                  color: AppColors.secondary,
                  icon: Icons.copy_all_rounded,
                  onTap: () => context.goNamed(
                    'duplicates',
                    queryParameters: {'type': 'duplicate'},
                  ),
                ),
                const Gap(12),
                CleanupCategoryTile(
                  title: 'Similar Photos',
                  subtitle: 'Find key photo moments',
                  size: storageAsync.when(
                    data: (info) => info != null
                        ? FileUtils.formatSize(info.similarPhotoSize)
                        : '0 B',
                    loading: () => 'Analyzing...',
                    error: (_, __) => 'Error',
                  ),
                  color: AppColors.primary,
                  icon: Icons.photo_library_rounded,
                  onTap: () => context.goNamed(
                    'duplicates',
                    queryParameters: {'type': 'similar'},
                  ),
                ),
                const Gap(12),
                Consumer(
                  builder: (context, ref, child) {
                    final threshold = ref.watch(largeFileThresholdProvider);
                    String label = '10MB';
                    if (threshold >= 1024 * 1024 * 1024) {
                      label = '${(threshold / (1024 * 1024 * 1024)).toInt()}GB';
                    } else {
                      label = '${(threshold / (1024 * 1024)).toInt()}MB';
                    }

                    return CleanupCategoryTile(
                      title: 'Large Files',
                      subtitle: 'Files larger than $label',
                      size: storageAsync.when(
                        data: (info) => info != null
                            ? FileUtils.formatSize(info.largeFilesTotalSize)
                            : '0 B',
                        loading: () => 'Analyzing...',
                        error: (_, __) => 'Error',
                      ),
                      color: AppColors.error,
                      icon: Icons.video_file_rounded,
                      onTap: () => context.go(RouteConstants.largeFiles),
                    );
                  },
                ),
                const Gap(12),
                CleanupCategoryTile(
                  title: 'Screenshots',
                  subtitle: 'Find and delete screenshots',
                  size: screenshotsState.isLoading
                      ? 'Analyzing...'
                      : screenshotsState.errorMessage != null
                      ? 'Error'
                      : FileUtils.formatSize(screenshotsState.totalSize),
                  color: AppColors.orange,
                  icon: Icons.screenshot_rounded,
                  onTap: () => context.push(RouteConstants.screenshots),
                ),
                const Gap(12),
                CleanupCategoryTile(
                  title: 'Downloads',
                  subtitle: 'Manage your downloaded files',
                  size: downloadsState.isLoading
                      ? 'Analyzing...'
                      : downloadsState.errorMessage != null
                      ? 'Error'
                      : FileUtils.formatSize(downloadsState.totalSize),
                  color: AppColors.primary,
                  icon: Icons.download_rounded,
                  onTap: () => context.push(RouteConstants.downloads),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CleanupHeader extends StatelessWidget {
  const _CleanupHeader();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.cleaning_services_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const Gap(16),
          Text(
            'Keep your storage healthy',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.appTextPrimary,
            ),
          ),
          const Gap(8),
          Text(
            'We found some files you might want to remove to free up space.',
            textAlign: TextAlign.center,
            style: TextStyle(color: context.appTextSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }
}
