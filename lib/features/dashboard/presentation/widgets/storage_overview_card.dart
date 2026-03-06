import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_card.dart';
import '../../domain/entities/storage_info.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/scan_progress.dart';
import '../providers/scan_progress_provider.dart';

class StorageOverviewCard extends ConsumerWidget {
  final StorageInfo info;

  const StorageOverviewCard({super.key, required this.info});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to scan progress
    final scanAsync = ref.watch(scanProgressProvider);

    ScanProgress? currentProgress;
    if (scanAsync.hasValue) {
      currentProgress = scanAsync.value;
      // If complete/error/invalidated, ignore progress and rely on info (which should update shortly)
      if (currentProgress?.phase == ScanPhase.complete ||
          currentProgress?.phase == ScanPhase.error ||
          currentProgress?.phase == ScanPhase.cancelled ||
          currentProgress?.phase == ScanPhase.cacheInvalidated) {
        currentProgress = null;
      }
    }

    // Use FileUtils for smart formatting (B, KB, MB, GB)
    final usedSize = FileUtils.formatSize(info.usedSpace);
    final totalSize = FileUtils.formatSize(info.totalSpace);
    final freeSize = FileUtils.formatSize(info.freeSpace);

    final percentage = (info.usedPercentage * 100).toInt();

    // Determine progress bar value
    String statusText = '$percentage% Used';

    // Override if scanning — show phase name for better UX
    if (currentProgress != null) {
      if (currentProgress.phase == ScanPhase.paused) {
        statusText = 'Scan Paused (Battery Low)';
      } else {
        final phaseName = _phaseName(currentProgress.phase);

        if (currentProgress.totalItems > 0) {
          final total = currentProgress.totalItems;
          final processed = currentProgress.processedItems;
          final p = (processed / total).clamp(0.0, 1.0);
          statusText = 'Scanning $phaseName... (${(p * 100).toInt()}%)';
        } else if (currentProgress.phase == ScanPhase.calculating) {
          statusText = 'Calculating...';
        } else {
          // Phase just started, totalItems not yet known
          statusText = 'Scanning $phaseName...';
        }
      }
    }

    return AppCard(
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INTERNAL STORAGE',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const Gap(4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        freeSize,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Gap(4),
                      Text(
                        'Free',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$totalSize Total',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.appTextPrimary,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    '$usedSize Used',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),

          const Gap(24),

          // Progress Bar
          Container(
            height: 12,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.appSurfaceContainerHigh,
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: currentProgress != null
                  ? LinearProgressIndicator(
                      backgroundColor: context.appSurfaceContainerHigh,
                      color: context.colorScheme.primary,
                    )
                  : FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: info.usedPercentage.clamp(0.01, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3B82F6),
                              AppColors.primary,
                            ], // Blue-500 to Primary
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
            ),
          ),

          const Gap(8),

          // Progress Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0 B', style: Theme.of(context).textTheme.labelSmall),
              Text(
                currentProgress != null ? statusText : '$percentage% Used',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: currentProgress != null ? AppColors.primary : null,
                  fontWeight: currentProgress != null ? FontWeight.bold : null,
                ),
              ),
              Text(totalSize, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),

          const Gap(16),
          Divider(height: 1, color: context.appBorder),
          const Gap(16),

          // Quick Stats
          Row(
            children: [
              _QuickStat(
                value: FileUtils.formatSize(info.photosSize),
                label: 'PHOTOS',
                isFirst: true,
              ),
              _QuickStat(
                value: FileUtils.formatSize(info.videosSize),
                label: 'VIDEOS',
                hasBorder: true,
              ),
              _QuickStat(
                value: FileUtils.formatSize(info.systemSize),
                label: 'OTHER',
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _phaseName(ScanPhase phase) {
    switch (phase) {
      case ScanPhase.diskSpace:
        return 'Disk';
      case ScanPhase.photos:
        return 'Photos';
      case ScanPhase.videos:
        return 'Videos';
      case ScanPhase.audio:
        return 'Audio';
      case ScanPhase.documents:
        return 'Documents';
      case ScanPhase.junk:
        return 'Junk Files';
      case ScanPhase.emptyFolders:
        return 'Folders';
      case ScanPhase.apks:
        return 'APKs';
      case ScanPhase.similarPhotos:
        return 'Similar Photos';
      default:
        return 'Storage';
    }
  }
}

class _QuickStat extends StatelessWidget {
  final String value;
  final String label;
  final bool hasBorder;
  final bool isFirst;
  final bool isLast;

  const _QuickStat({
    required this.value,
    required this.label,
    this.hasBorder = false,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: hasBorder
            ? BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(color: context.appBorder),
                ),
              )
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(2),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 10,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
