import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/data/providers/storage_provider.dart';

part 'app_settings_service.g.dart';

class AppSettingsService {
  static const String _keyOnboardingCompleted = 'onboarding_completed';
  static const String _keyPhotoSensitivity = 'photo_sensitivity';
  static const String _keyLargeFileThreshold = 'large_file_threshold';

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
