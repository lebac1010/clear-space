import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../widgets/cleanup_category_tile.dart';

import '../../../../core/utils/file_utils.dart';

class CleanupScreen extends ConsumerWidget {
  const CleanupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(dashboardControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Cleanup',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _CleanupHeader(),
                const Gap(24),
                const Text(
                  'Suggestions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
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
                CleanupCategoryTile(
                  title: 'Large Files',
                  subtitle: 'Files larger than 10MB',
                  size: storageAsync.when(
                    data: (info) => info != null
                        ? FileUtils.formatSize(info.largeFilesTotalSize)
                        : '0 B',
                    loading: () => 'Analyzing...',
                    error: (_, __) => 'Error',
                  ),
                  color: AppColors.error,
                  icon: Icons.video_file_rounded,
                  onTap: () => context.push(RouteConstants.largeFiles),
                ),
                const Gap(12),
                // Hidden for now as logic is not ready
                // CleanupCategoryTile(
                //   title: 'Old Screenshots',
                //   subtitle: 'Older than 6 months',
                //   size: 'Coming Soon',
                //   color: AppColors.warning,
                //   icon: Icons.screenshot_rounded,
                //   onTap: () {},
                // ),
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
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.cleaning_services_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const Gap(16),
          const Text(
            'Keep your storage healthy',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(8),
          const Text(
            'We found some files you might want to remove to free up space.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }
}
