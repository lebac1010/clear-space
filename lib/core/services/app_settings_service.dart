import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/data/providers/storage_provider.dart';

part 'app_settings_service.g.dart';

class AppSettingsService {
  static const String _keyOnboardingCompleted = 'onboarding_completed';

  final SharedPreferences _prefs;

  AppSettingsService(this._prefs);

  bool isOnboardingCompleted() {
    return _prefs.getBool(_keyOnboardingCompleted) ?? false;
  }

  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool(_keyOnboardingCompleted, completed);
  }
}

@Riverpod(keepAlive: true)
AppSettingsService appSettingsService(AppSettingsServiceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppSettingsService(prefs);
}
