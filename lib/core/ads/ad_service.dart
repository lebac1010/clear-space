import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_unit_ids.dart';

class AppAdService {
  AppAdService._();

  static final AppAdService instance = AppAdService._();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized || !AppAdUnitIds.shouldInitializeMobileAds) {
      return;
    }

    try {
      await MobileAds.instance.initialize();
      _initialized = true;
    } catch (error, stackTrace) {
      debugPrint('[Ads] Failed to initialize Mobile Ads: $error');
      debugPrint('$stackTrace');
    }
  }
}
