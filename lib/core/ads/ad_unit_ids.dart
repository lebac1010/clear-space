import 'dart:io';

import 'package:flutter/foundation.dart';

enum AppNativeAdPlacement { dashboard, cleanup, photos }

class AppAdUnitIds {
  AppAdUnitIds._();

  // Google sample/test IDs for development only.
  static const String androidDebugAppId =
      'ca-app-pub-3940256099942544~3347511713';
  static const String _androidDebugNativeId =
      'ca-app-pub-3940256099942544/2247696110';
  static const String _androidDebugBannerId =
      'ca-app-pub-3940256099942544/6300978111';

  // Configure release IDs via --dart-define before shipping ads.
  static const String _androidReleaseNativeDashboard =
      'ca-app-pub-1766243060895749/5479650512';
  static const String _androidReleaseNativeCleanup =
      'ca-app-pub-1766243060895749/8551568810';
  static const String _androidReleaseNativePhotos =
      'ca-app-pub-1766243060895749/2797646855';
  static const String _androidReleaseBanner = String.fromEnvironment(
    'ADMOB_BANNER_ANDROID',
  );

  static bool get isSupportedPlatform => !kIsWeb && Platform.isAndroid;

  static String? nativeUnitId(AppNativeAdPlacement placement) {
    if (!isSupportedPlatform) return null;
    if (kDebugMode) return _androidDebugNativeId;

    final unitId = switch (placement) {
      AppNativeAdPlacement.dashboard => _androidReleaseNativeDashboard,
      AppNativeAdPlacement.cleanup => _androidReleaseNativeCleanup,
      AppNativeAdPlacement.photos => _androidReleaseNativePhotos,
    };

    return unitId.trim().isEmpty ? null : unitId;
  }

  static String? bannerUnitId() {
    if (!isSupportedPlatform) return null;
    if (kDebugMode) return _androidDebugBannerId;
    return _androidReleaseBanner.trim().isEmpty ? null : _androidReleaseBanner;
  }

  static bool get shouldInitializeMobileAds {
    if (!isSupportedPlatform) return false;
    if (kDebugMode) return true;

    return AppNativeAdPlacement.values.any((placement) {
          return nativeUnitId(placement) != null;
        }) ||
        bannerUnitId() != null;
  }
}
