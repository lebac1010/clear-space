import 'package:flutter/material.dart';

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

  /// Screen width.
  double get screenWidth => mediaQuery.size.width;

  /// Screen height.
  double get screenHeight => mediaQuery.size.height;

  /// Check if keyboard is visible.
  bool get isKeyboardVisible => mediaQuery.viewInsets.bottom > 0;
}
