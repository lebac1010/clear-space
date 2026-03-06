import 'package:flutter/material.dart';
import '../extensions/build_context_x.dart';
import '../theme/app_colors.dart';
import 'app_card.dart';

/// A standard list tile for actions or navigation items.
/// features a standard icon background and chevron.
class AppActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  const AppActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero, // ListTile handles padding
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color:
                iconBackgroundColor ??
                context.colorScheme.primaryContainer.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Icon(icon, color: iconColor ?? context.colorScheme.primary),
        ),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
        trailing: Icon(Icons.chevron_right, color: context.appTextSecondary),
      ),
    );
  }
}
