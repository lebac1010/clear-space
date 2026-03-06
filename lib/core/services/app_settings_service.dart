import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/data/providers/storage_provider.dart';

part 'app_settings_service.g.dart';

class AppSettingsService {
  static const String _keyOnboardingCompleted = 'onboarding_completed';
  static const String _keyPhotoSensitivity = 'photo_sensitivity';
  static const String _keyLargeFileThreshold = 'large_file_threshold';
  static const String _keyLanguageSelected = 'language_selected';
  static const String _keyLocale = 'locale';
  static const String _keyThemeMode = 'theme_mode';

  final SharedPreferences _prefs;

  AppSettingsService(this._prefs);

  bool isOnboardingCompleted() {
    return _prefs.getBool(_keyOnboardingCompleted) ?? false;
  }

  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool(_keyOnboardingCompleted, completed);
  }

  /// Gets the similar photo sensitivity threshold (Hamming distance).
  /// Lower number = stricter (more similar).
  /// 3 = Strict (95%), 5 = Normal (85%), 8 = Loose (75%).
  int getSimilarPhotoSensitivity() {
    return _prefs.getInt(_keyPhotoSensitivity) ?? 5; // Default is Normal (5)
  }

  Future<void> setSimilarPhotoSensitivity(int value) async {
    await _prefs.setInt(_keyPhotoSensitivity, value);
  }

  /// Gets the large file threshold in bytes.
  /// Default is 10MB (10 * 1024 * 1024).
  int getLargeFileThreshold() {
    return _prefs.getInt(_keyLargeFileThreshold) ?? 10 * 1024 * 1024;
  }

  Future<void> setLargeFileThreshold(int bytes) async {
    await _prefs.setInt(_keyLargeFileThreshold, bytes);
  }

  bool hasSelectedLanguage() => _prefs.getBool(_keyLanguageSelected) ?? false;
  Future<void> setLanguageSelected(bool val) =>
      _prefs.setBool(_keyLanguageSelected, val);

  String getLocale() => _prefs.getString(_keyLocale) ?? 'en';
  Future<void> setLocale(String val) => _prefs.setString(_keyLocale, val);

  String getThemeMode() => _prefs.getString(_keyThemeMode) ?? 'system';
  Future<void> setThemeMode(String val) => _prefs.setString(_keyThemeMode, val);
}

@Riverpod(keepAlive: true)
AppSettingsService appSettingsService(AppSettingsServiceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppSettingsService(prefs);
}

@riverpod
int largeFileThreshold(LargeFileThresholdRef ref) {
  return ref.watch(appSettingsServiceProvider).getLargeFileThreshold();
}

@riverpod
class LocaleController extends _$LocaleController {
  @override
  Locale build() {
    final code = ref.watch(appSettingsServiceProvider).getLocale();
    return _parseLocale(code);
  }

  Future<void> setLocale(String code) async {
    await ref.read(appSettingsServiceProvider).setLocale(code);
    state = _parseLocale(code);
  }

  Locale _parseLocale(String code) {
    if (code.contains('_')) {
      final parts = code.split('_');
      return Locale(parts[0], parts[1]);
    } else if (code.contains('-')) {
      final parts = code.split('-');
      return Locale(parts[0], parts[1]);
    }
    return Locale(code);
  }
}

@riverpod
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() {
    final modeStr = ref.watch(appSettingsServiceProvider).getThemeMode();
    return _parseThemeMode(modeStr);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await ref.read(appSettingsServiceProvider).setThemeMode(mode.name);
    state = mode;
  }

  ThemeMode _parseThemeMode(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
