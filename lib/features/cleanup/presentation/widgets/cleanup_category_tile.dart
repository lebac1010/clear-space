import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/widgets/app_card.dart';

class CleanupCategoryTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String size;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CleanupCategoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.size,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.appTextPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: context.appTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                size,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.chevron_right,
                color: context.appTextSecondary,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
