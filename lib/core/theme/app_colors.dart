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
