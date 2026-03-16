import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../extensions/build_context_x.dart';
import '../../widgets/app_card.dart';
import '../ad_unit_ids.dart';

class NativeTemplateAdCard extends StatefulWidget {
  const NativeTemplateAdCard({
    super.key,
    required this.placement,
    this.margin,
  });

  final AppNativeAdPlacement placement;
  final EdgeInsetsGeometry? margin;

  @override
  State<NativeTemplateAdCard> createState() => _NativeTemplateAdCardState();
}

class _NativeTemplateAdCardState extends State<NativeTemplateAdCard> {
  static const String _androidFactoryId = 'clearSpaceCompactNative';
  static const double _dashboardHeight = 72;
  static const double _cleanupHeight = 76;
  static const double _photosHeight = 80;

  NativeAd? _nativeAd;
  bool _isLoaded = false;
  bool _loadFailed = false;
  String? _debugMessage;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  void _loadAd() {
    final adUnitId = AppAdUnitIds.nativeUnitId(widget.placement);
    final useAndroidFactory = defaultTargetPlatform == TargetPlatform.android;
    if (adUnitId == null) {
      if (kDebugMode) {
        setState(() {
          _loadFailed = true;
          _debugMessage = 'No ad unit configured for ${widget.placement.name}.';
        });
      }
      return;
    }

    final ad = NativeAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      factoryId: useAndroidFactory ? _androidFactoryId : null,
      customOptions: useAndroidFactory
          ? {'placement': widget.placement.name}
          : null,
      nativeTemplateStyle: useAndroidFactory
          ? null
          : NativeTemplateStyle(templateType: TemplateType.small),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _isLoaded = true;
            _loadFailed = false;
            _debugMessage = null;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (!mounted) return;
          setState(() {
            _loadFailed = true;
            _debugMessage = error.message;
          });
        },
      ),
    );

    _nativeAd = ad;
    ad.load();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _nativeAd;
    final adHeight = switch (widget.placement) {
      AppNativeAdPlacement.dashboard => _dashboardHeight,
      AppNativeAdPlacement.cleanup => _cleanupHeight,
      AppNativeAdPlacement.photos => _photosHeight,
    };
    if (!_isLoaded || ad == null) {
      if (kDebugMode && _loadFailed) {
        return AppCard(
          margin: widget.margin,
          padding: const EdgeInsets.all(16),
          border: BorderSide(color: context.appBorder),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Native Ad Debug',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                _debugMessage ?? 'Unknown ad load failure.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.appTextSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      }

      return const SizedBox.shrink();
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      return Padding(
        padding: widget.margin ?? EdgeInsets.zero,
        child: SizedBox(
          height: adHeight,
          width: double.infinity,
          child: AdWidget(ad: ad),
        ),
      );
    }

    return AppCard(
      margin: widget.margin,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: adHeight,
        width: double.infinity,
        child: ColoredBox(
          color: context.appSurface,
          child: AdWidget(ad: ad),
        ),
      ),
    );
  }
}
