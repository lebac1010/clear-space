import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_card.dart';

class StorageCategoryTile extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String title;
  final int? count; // Nullable
  final int sizeBytes;
  final double percentage;
  final VoidCallback? onTap;
  final bool isScanning;

  const StorageCategoryTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    this.count,
    required this.sizeBytes,
    required this.percentage,
    this.onTap,
    this.isScanning = false,
  });

  @override
  State<StorageCategoryTile> createState() => _StorageCategoryTileState();
}

class _StorageCategoryTileState extends State<StorageCategoryTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    if (widget.isScanning && widget.sizeBytes == 0) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(StorageCategoryTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final shouldPulse = widget.isScanning && widget.sizeBytes == 0;
    if (shouldPulse && !_pulseController.isAnimating) {
      _pulseController.repeat(reverse: true);
    } else if (!shouldPulse && _pulseController.isAnimating) {
      _pulseController.stop();
      _pulseController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showAnalyzing = widget.isScanning && widget.sizeBytes == 0;

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: showAnalyzing ? _pulseAnimation.value : 1.0,
          child: child,
        );
      },
      child: AppCard(
        padding: const EdgeInsets.all(16),
        onTap: showAnalyzing ? null : widget.onTap,
        child: Row(
          children: [
            // Icon Box
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: widget.color),
            ),
            const Gap(16),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(8),

                  // Progress Bar or Analyzing indicator
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: showAnalyzing
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: LinearProgressIndicator(
                                    backgroundColor: AppColors.background,
                                    color: widget.color.withValues(alpha: 0.5),
                                    minHeight: 6,
                                  ),
                                )
                              : FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: widget.percentage.clamp(
                                    0.01,
                                    1.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: widget.color,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      if (showAnalyzing) ...[
                        const Gap(8),
                        Text(
                          'Analyzing...',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: widget.color,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ] else if (widget.count != null) ...[
                        const Gap(8),
                        Text(
                          '${widget.count} items',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            const Gap(16),

            // Size & Arrow
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  showAnalyzing ? '—' : FileUtils.formatSize(widget.sizeBytes),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
