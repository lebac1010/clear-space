package com.movixalabs.cleanmaster

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class MainActivity : FlutterActivity() {
    private var nativeAdFactory: ClearSpaceNativeAdFactory? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(StorageScannerPlugin())
        nativeAdFactory = ClearSpaceNativeAdFactory(layoutInflater)
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            NATIVE_AD_FACTORY_ID,
            nativeAdFactory,
        )
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(
            flutterEngine,
            NATIVE_AD_FACTORY_ID,
        )
        nativeAdFactory = null
        super.cleanUpFlutterEngine(flutterEngine)
    }

    companion object {
        private const val NATIVE_AD_FACTORY_ID = "clearSpaceCompactNative"
    }
}
