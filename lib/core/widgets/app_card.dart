import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A standard card widget with consistent styling.
/// Supports custom padding, margin, and tap interactions.
class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderSide? border;
  final Clip? clipBehavior;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.border,
    this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    // Default values matching AppTheme.cardTheme
    const defaultPadding = EdgeInsets.all(AppSpacing.md);

    Widget content = Container(
      padding: padding ?? defaultPadding,
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: content,
      );
    }

    return Card(
      color: color, // Defaults to cardTheme.color if null
      margin: margin ?? EdgeInsets.zero,
      clipBehavior: clipBehavior,
      shape: border != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              side: border!,
            )
          : null, // Defaults to cardTheme.shape
      child: content,
    );
  }
}
