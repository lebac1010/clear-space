import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Convenient extensions on BuildContext for accessing theme data.
extension BuildContextX on BuildContext {
  /// Access the current ThemeData.
  ThemeData get theme => Theme.of(this);

  /// Access the current TextTheme.
  TextTheme get textTheme => theme.textTheme;

  /// Access the current ColorScheme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Access the current MediaQueryData.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Access app semantic colors.
  AppThemeColors get appColors =>
      theme.extension<AppThemeColors>() ?? AppThemeColors.light;

  /// Access custom accent colors.
  CustomColors get customColors =>
      theme.extension<CustomColors>() ?? CustomColors.light;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  Color get appBackground => appColors.background;

  Color get appSurface => appColors.surface;

  Color get appSurfaceContainer => appColors.surfaceContainer;

  Color get appSurfaceContainerHigh => appColors.surfaceContainerHigh;

  Color get appTextPrimary => appColors.textPrimary;

  Color get appTextSecondary => appColors.textSecondary;

  Color get appTextTertiary => appColors.textTertiary;

  Color get appBorder => appColors.border;

  Color get appShadow => appColors.shadow;

  Color get appOverlay => appColors.overlay;

  Color get imagePlaceholder => appColors.imagePlaceholder;

  Color get imagePlaceholderMuted => appColors.imagePlaceholderMuted;

  /// Screen width.
  double get screenWidth => mediaQuery.size.width;

  /// Screen height.
  double get screenHeight => mediaQuery.size.height;

  /// Check if keyboard is visible.
  bool get isKeyboardVisible => mediaQuery.viewInsets.bottom > 0;
}
