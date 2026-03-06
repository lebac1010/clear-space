import 'package:flutter/material.dart';

/// Centralized color palette for the application.
/// Based on Stitch "Storage Dashboard" design with edge-case safety colors.
abstract class AppColors {
  // Primary Brand Color from Stitch
  static const Color primary = Color(0xFF137FEC);
  static const Color primaryLight = Color(0xFFE8F3FD);

  // Neutral Colors (Light Mode)
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color surfaceContainer = Color(0xFFF1F3F5);
  static const Color textPrimary = Color(0xFF1A1C1E);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textTertiary = Color(0xFFADB5BD);
  static const Color border = Color(0xFFE9ECEF);

  // Status Colors
  static const Color error = Color(0xFFDC3545);
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color secondary = Color(0xFF6C757D);
  static const Color white = Colors.white;

  // Overlay
  static const Color overlay = Colors.black54;

  // Dark Mode Neutral Colors
  static const Color backgroundDark = Color(0xFF111315); // Deep gray
  static const Color surfaceDark = Color(0xFF1E2022); // Elevated dark surface
  static const Color surfaceContainerDark = Color(
    0xFF282A2C,
  ); // Darker container
  static const Color textPrimaryDark = Color(0xFFE2E2E2);
  static const Color textSecondaryDark = Color(0xFFA1A3A6);
  static const Color textTertiaryDark = Color(0xFF757575);
  static const Color borderDark = Color(0xFF333538);

  // Status Colors (Dark mode adjusted)
  static const Color errorDark = Color(0xFFE57373);
  static const Color successDark = Color(0xFF81C784);
  static const Color warningDark = Color(0xFFFFB74D);

  // Feature Colors
  static const Color orange = Color(0xFFFF9800);
  static const Color purple = Color(0xFF9C27B0);
}

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color background;
  final Color surface;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color border;
  final Color shadow;
  final Color overlay;
  final Color imagePlaceholder;
  final Color imagePlaceholderMuted;

  const AppThemeColors({
    required this.background,
    required this.surface,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.border,
    required this.shadow,
    required this.overlay,
    required this.imagePlaceholder,
    required this.imagePlaceholderMuted,
  });

  @override
  AppThemeColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? border,
    Color? shadow,
    Color? overlay,
    Color? imagePlaceholder,
    Color? imagePlaceholderMuted,
  }) {
    return AppThemeColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      border: border ?? this.border,
      shadow: shadow ?? this.shadow,
      overlay: overlay ?? this.overlay,
      imagePlaceholder: imagePlaceholder ?? this.imagePlaceholder,
      imagePlaceholderMuted:
          imagePlaceholderMuted ?? this.imagePlaceholderMuted,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t) ??
          surfaceContainer,
      surfaceContainerHigh:
          Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t) ??
          surfaceContainerHigh,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      textTertiary:
          Color.lerp(textTertiary, other.textTertiary, t) ?? textTertiary,
      border: Color.lerp(border, other.border, t) ?? border,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
      overlay: Color.lerp(overlay, other.overlay, t) ?? overlay,
      imagePlaceholder:
          Color.lerp(imagePlaceholder, other.imagePlaceholder, t) ??
          imagePlaceholder,
      imagePlaceholderMuted:
          Color.lerp(
            imagePlaceholderMuted,
            other.imagePlaceholderMuted,
            t,
          ) ??
          imagePlaceholderMuted,
    );
  }

  static const light = AppThemeColors(
    background: AppColors.background,
    surface: AppColors.surface,
    surfaceContainer: AppColors.surfaceContainer,
    surfaceContainerHigh: Color(0xFFE8ECEF),
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textTertiary: AppColors.textTertiary,
    border: AppColors.border,
    shadow: Color(0x14000000),
    overlay: Color(0x8A000000),
    imagePlaceholder: Color(0xFFE5E7EB),
    imagePlaceholderMuted: Color(0xFFF3F4F6),
  );

  static const dark = AppThemeColors(
    background: AppColors.backgroundDark,
    surface: AppColors.surfaceDark,
    surfaceContainer: AppColors.surfaceContainerDark,
    surfaceContainerHigh: Color(0xFF323438),
    textPrimary: AppColors.textPrimaryDark,
    textSecondary: AppColors.textSecondaryDark,
    textTertiary: AppColors.textTertiaryDark,
    border: AppColors.borderDark,
    shadow: Color(0x52000000),
    overlay: Color(0xB3000000),
    imagePlaceholder: Color(0xFF30343A),
    imagePlaceholderMuted: Color(0xFF212429),
  );
}

/// Centralized spacing values for consistent UI.
abstract class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

/// Centralized border radius values.
abstract class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
}

/// Custom colors that are not fully supported by standard ColorScheme
class CustomColors extends ThemeExtension<CustomColors> {
  final Color orange;
  final Color purple;
  final Color secondary;
  final Color success;

  const CustomColors({
    required this.orange,
    required this.purple,
    required this.secondary,
    required this.success,
  });

  @override
  CustomColors copyWith({
    Color? orange,
    Color? purple,
    Color? secondary,
    Color? success,
  }) {
    return CustomColors(
      orange: orange ?? this.orange,
      purple: purple ?? this.purple,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      orange: Color.lerp(orange, other.orange, t) ?? orange,
      purple: Color.lerp(purple, other.purple, t) ?? purple,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      success: Color.lerp(success, other.success, t) ?? success,
    );
  }

  static const light = CustomColors(
    orange: AppColors.orange,
    purple: AppColors.purple,
    secondary: AppColors.secondary,
    success: AppColors.success,
  );

  static const dark = CustomColors(
    // Desaturated colors for dark mode to reduce eye strain
    orange: Color(0xFFFFB74D),
    purple: Color(0xFFBA68C8),
    secondary: Color(0xFF9E9E9E),
    success: Color(0xFF81C784),
  );
}
