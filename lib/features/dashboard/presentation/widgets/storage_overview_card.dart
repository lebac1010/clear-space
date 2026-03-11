import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/build_context_x.dart';

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
    String statusText = context.l10n.percentUsed(percentage);

    // Override if scanning — show phase name for better UX
    if (currentProgress != null) {
      if (currentProgress.phase == ScanPhase.paused) {
        statusText = context.l10n.scanPausedBattery;
      } else {
        final phaseName = _phaseName(context, currentProgress.phase);

        if (currentProgress.totalItems > 0) {
          final total = currentProgress.totalItems;
          final processed = currentProgress.processedItems;
          final p = (processed / total).clamp(0.0, 1.0);
          statusText = context.l10n.scanningPhasePercent(
            phaseName,
            (p * 100).toInt(),
          );
        } else if (currentProgress.phase == ScanPhase.calculating) {
          statusText = context.l10n.calculating;
        } else {
          // Phase just started, totalItems not yet known
          statusText = context.l10n.scanningPhase(phaseName);
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
                    context.l10n.internalStorage,
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
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Gap(4),
                      Text(
                        context.l10n.free,
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
                    context.l10n.totalSize(totalSize),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.appTextPrimary,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    context.l10n.usedSize(usedSize),
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
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF3B82F6),
                              context.colorScheme.primary,
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
              Text(context.l10n.zeroBytes, style: Theme.of(context).textTheme.labelSmall),
              Text(
                currentProgress != null
                    ? statusText
                    : context.l10n.percentUsed(percentage),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: currentProgress != null
                      ? context.colorScheme.primary
                      : null,
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
                label: context.l10n.photosTitle.toUpperCase(),
                isFirst: true,
              ),
              _QuickStat(
                value: FileUtils.formatSize(info.videosSize),
                label: context.l10n.videos.toUpperCase(),
                hasBorder: true,
              ),
              _QuickStat(
                value: FileUtils.formatSize(info.systemSize),
                label: context.l10n.other.toUpperCase(),
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _phaseName(BuildContext context, ScanPhase phase) {
    switch (phase) {
      case ScanPhase.diskSpace:
        return context.l10n.phaseDisk;
      case ScanPhase.photos:
        return context.l10n.phasePhotos;
      case ScanPhase.videos:
        return context.l10n.phaseVideos;
      case ScanPhase.audio:
        return context.l10n.phaseAudio;
      case ScanPhase.documents:
        return context.l10n.phaseDocuments;
      case ScanPhase.junk:
        return context.l10n.phaseJunk;
      case ScanPhase.emptyFolders:
        return context.l10n.phaseFolders;
      case ScanPhase.apks:
        return context.l10n.phaseApks;
      case ScanPhase.similarPhotos:
        return context.l10n.phaseSimilar;
      default:
        return context.l10n.phaseStorage;
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
