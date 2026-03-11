import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_constants.dart';

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
          context.l10n.cleanup,
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
                  context.l10n.suggestions,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.appTextPrimary,
                  ),
                ),
                const Gap(16),
                CleanupCategoryTile(
                  title: context.l10n.duplicateFiles,
                  subtitle: context.l10n.findIdenticalFiles,
                  size: storageAsync.when(
                    data: (info) => info != null
                        ? FileUtils.formatSize(info.potentialSavings)
                        : '0 B',
                    loading: () => context.l10n.analyzing,
                    error: (_, __) => 'Error',
                  ),
                  color: context.customColors.secondary,
                  icon: Icons.copy_all_rounded,
                  onTap: () => context.goNamed(
                    'duplicates',
                    queryParameters: {'type': 'duplicate'},
                  ),
                ),
                const Gap(12),
                CleanupCategoryTile(
                  title: context.l10n.similarPhotos,
                  subtitle: context.l10n.findKeyMoments,
                  size: storageAsync.when(
                    data: (info) => info != null
                        ? FileUtils.formatSize(info.similarPhotoSize)
                        : '0 B',
                    loading: () => context.l10n.analyzing,
                    error: (_, __) => 'Error',
                  ),
                  color: context.colorScheme.primary,
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
                      title: context.l10n.largeFiles,
                      subtitle: context.l10n.filesLargerThan(label),
                      size: storageAsync.when(
                        data: (info) => info != null
                            ? FileUtils.formatSize(info.largeFilesTotalSize)
                            : '0 B',
                        loading: () => context.l10n.analyzing,
                        error: (_, __) => 'Error',
                      ),
                      color: context.colorScheme.error,
                      icon: Icons.video_file_rounded,
                      onTap: () => context.go(RouteConstants.largeFiles),
                    );
                  },
                ),
                const Gap(12),
                CleanupCategoryTile(
                  title: context.l10n.screenshots,
                  subtitle: context.l10n.findAndDeleteScreenshots,
                  size: screenshotsState.isLoading
                      ? 'Analyzing...'
                      : screenshotsState.errorMessage != null
                      ? 'Error'
                      : FileUtils.formatSize(screenshotsState.totalSize),
                  color: context.customColors.orange,
                  icon: Icons.screenshot_rounded,
                  onTap: () => context.push(RouteConstants.screenshots),
                ),
                const Gap(12),
                CleanupCategoryTile(
                  title: context.l10n.downloads,
                  subtitle: context.l10n.manageDownloadedFiles,
                  size: downloadsState.isLoading
                      ? 'Analyzing...'
                      : downloadsState.errorMessage != null
                      ? 'Error'
                      : FileUtils.formatSize(downloadsState.totalSize),
                  color: context.colorScheme.primary,
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
            child: Icon(
              Icons.cleaning_services_rounded,
              size: 48,
              color: context.colorScheme.primary,
            ),
          ),
          const Gap(16),
          Text(
            context.l10n.keepStorageHealthy,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.appTextPrimary,
            ),
          ),
          const Gap(8),
          Text(
            context.l10n.cleanupHeaderDesc,
            textAlign: TextAlign.center,
            style: TextStyle(color: context.appTextSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }
}
