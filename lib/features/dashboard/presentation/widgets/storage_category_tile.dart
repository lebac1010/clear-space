import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

class StorageCategoryTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final int? count; // Nullable
  final int sizeBytes;
  final double percentage;
  final VoidCallback? onTap;

  const StorageCategoryTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    this.count,
    required this.sizeBytes,
    required this.percentage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String formatGb(int bytes) =>
        (bytes / (1024 * 1024 * 1024)).toStringAsFixed(1);

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          // Icon Box
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const Gap(16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const Gap(8),

                // Progress Bar
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: percentage.clamp(0.01, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (count != null) ...[
                      const Gap(8),
                      Text(
                        '$count items',
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
                '${formatGb(sizeBytes)} GB',
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
    );
  }
}
