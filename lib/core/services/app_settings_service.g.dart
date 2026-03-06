// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appSettingsServiceHash() =>
    r'68349fb9b0edc7b164c7fab979bc134697527888';

/// See also [appSettingsService].
@ProviderFor(appSettingsService)
final appSettingsServiceProvider = Provider<AppSettingsService>.internal(
  appSettingsService,
  name: r'appSettingsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppSettingsServiceRef = ProviderRef<AppSettingsService>;
String _$largeFileThresholdHash() =>
    r'ea8c8ce151aa63fd7e74b8ba5270224795e67c27';

/// See also [largeFileThreshold].
@ProviderFor(largeFileThreshold)
final largeFileThresholdProvider = AutoDisposeProvider<int>.internal(
  largeFileThreshold,
  name: r'largeFileThresholdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$largeFileThresholdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LargeFileThresholdRef = AutoDisposeProviderRef<int>;
String _$localeControllerHash() => r'1cc0ac0d02185bb0db286696bb1bb75110f06743';

/// See also [LocaleController].
@ProviderFor(LocaleController)
final localeControllerProvider =
    AutoDisposeNotifierProvider<LocaleController, Locale>.internal(
  LocaleController.new,
  name: r'localeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocaleController = AutoDisposeNotifier<Locale>;
String _$themeModeControllerHash() =>
    r'34ea86e7d9c129d23e9065b3ba0cc471d4f0af69';

/// See also [ThemeModeController].
@ProviderFor(ThemeModeController)
final themeModeControllerProvider =
    AutoDisposeNotifierProvider<ThemeModeController, ThemeMode>.internal(
  ThemeModeController.new,
  name: r'themeModeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeModeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeController = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
