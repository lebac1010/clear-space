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
