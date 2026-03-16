package com.movixalabs.cleanmaster;

import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.gms.ads.nativead.NativeAd;
import com.google.android.gms.ads.nativead.NativeAdView;
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin.NativeAdFactory;
import java.util.Locale;
import java.util.Map;

public final class ClearSpaceNativeAdFactory implements NativeAdFactory {
  private final LayoutInflater layoutInflater;

  public ClearSpaceNativeAdFactory(LayoutInflater layoutInflater) {
    this.layoutInflater = layoutInflater;
  }

  @Override
  public NativeAdView createNativeAd(NativeAd nativeAd, Map<String, Object> customOptions) {
    final NativeAdView adView =
        (NativeAdView) layoutInflater.inflate(R.layout.native_ad_compact, null);

    final String placement = readPlacement(customOptions);
    final FrameLayout iconContainer = adView.findViewById(R.id.ad_icon_container);
    final ImageView iconView = adView.findViewById(R.id.ad_app_icon);
    final ViewGroup contentView = adView.findViewById(R.id.ad_content);
    final TextView badgeView = adView.findViewById(R.id.ad_badge);
    final TextView advertiserView = adView.findViewById(R.id.ad_advertiser);
    final TextView storeView = adView.findViewById(R.id.ad_store);
    final TextView ratingView = adView.findViewById(R.id.ad_rating);
    final TextView headlineView = adView.findViewById(R.id.ad_headline);
    final TextView bodyView = adView.findViewById(R.id.ad_body);
    final TextView callToActionView = adView.findViewById(R.id.ad_call_to_action);

    applyPlacementStyle(iconContainer, badgeView, placement);
    applyDensity(contentView, iconContainer, callToActionView);

    adView.setHeadlineView(headlineView);
    adView.setBodyView(bodyView);
    adView.setAdvertiserView(advertiserView);
    adView.setStoreView(storeView);
    adView.setStarRatingView(ratingView);
    adView.setCallToActionView(callToActionView);
    adView.setIconView(iconView);

    headlineView.setText(nativeAd.getHeadline());

    if (nativeAd.getAdvertiser() == null || nativeAd.getAdvertiser().isEmpty()) {
      advertiserView.setVisibility(View.GONE);
    } else {
      advertiserView.setVisibility(View.VISIBLE);
      advertiserView.setText(nativeAd.getAdvertiser());
    }

    if (advertiserView.getVisibility() == View.VISIBLE
        || nativeAd.getStore() == null
        || nativeAd.getStore().isEmpty()) {
      storeView.setVisibility(View.GONE);
    } else {
      storeView.setVisibility(View.VISIBLE);
      storeView.setText(nativeAd.getStore());
    }

    if (nativeAd.getStarRating() == null) {
      ratingView.setVisibility(View.GONE);
    } else {
      ratingView.setVisibility(View.VISIBLE);
      ratingView.setText(String.format(Locale.US, "%.1f *", nativeAd.getStarRating()));
    }

    if (nativeAd.getBody() == null || nativeAd.getBody().isEmpty()) {
      bodyView.setVisibility(View.GONE);
    } else {
      bodyView.setVisibility(View.VISIBLE);
      bodyView.setText(nativeAd.getBody());
    }

    if (nativeAd.getCallToAction() == null || nativeAd.getCallToAction().isEmpty()) {
      callToActionView.setVisibility(View.GONE);
    } else {
      callToActionView.setVisibility(View.VISIBLE);
      callToActionView.setText(nativeAd.getCallToAction());
    }

    if (nativeAd.getIcon() == null) {
      iconContainer.setVisibility(View.GONE);
      final ViewGroup.MarginLayoutParams contentParams =
          (ViewGroup.MarginLayoutParams) contentView.getLayoutParams();
      contentParams.setMarginStart(0);
      contentView.setLayoutParams(contentParams);
    } else {
      iconContainer.setVisibility(View.VISIBLE);
      iconView.setImageDrawable(nativeAd.getIcon().getDrawable());
    }

    adView.setNativeAd(nativeAd);
    return adView;
  }

  private void applyPlacementStyle(FrameLayout iconContainer, TextView badgeView, String placement) {
    final int accentColor = accentColorForPlacement(placement);
    final GradientDrawable badgeBackground = (GradientDrawable) badgeView.getBackground().mutate();
    badgeBackground.setColor(withAlpha(accentColor, 0.16f));
    badgeView.setTextColor(accentColor);

    final GradientDrawable iconBackground =
        (GradientDrawable) iconContainer.getBackground().mutate();
    iconBackground.setColor(withAlpha(accentColor, 0.12f));
  }

  private void applyDensity(
      ViewGroup contentView,
      FrameLayout iconContainer,
      TextView callToActionView) {
    final ViewGroup.LayoutParams iconParams = iconContainer.getLayoutParams();
    iconParams.width = dpToPx(48);
    iconParams.height = dpToPx(48);
    iconContainer.setLayoutParams(iconParams);
    iconContainer.setPadding(dpToPx(12), dpToPx(12), dpToPx(12), dpToPx(12));

    final ViewGroup.MarginLayoutParams contentParams =
        (ViewGroup.MarginLayoutParams) contentView.getLayoutParams();
    contentParams.setMarginStart(dpToPx(16));
    contentView.setLayoutParams(contentParams);

    final ViewGroup.LayoutParams ctaParams = callToActionView.getLayoutParams();
    ctaParams.height = dpToPx(32);
    callToActionView.setLayoutParams(ctaParams);
    callToActionView.setMinWidth(dpToPx(70));
    callToActionView.setPadding(dpToPx(10), 0, dpToPx(10), 0);
    final ViewGroup.MarginLayoutParams ctaMarginParams =
        (ViewGroup.MarginLayoutParams) callToActionView.getLayoutParams();
    ctaMarginParams.setMarginStart(dpToPx(16));
    callToActionView.setLayoutParams(ctaMarginParams);
    callToActionView.setTextSize(11);
  }

  private String readPlacement(Map<String, Object> customOptions) {
    if (customOptions == null) {
      return null;
    }

    final Object placement = customOptions.get("placement");
    return placement instanceof String ? (String) placement : null;
  }

  private int accentColorForPlacement(String placement) {
    if ("cleanup".equals(placement)) {
      return Color.parseColor("#FF9800");
    }
    if ("photos".equals(placement)) {
      return Color.parseColor("#9C27B0");
    }
    return Color.parseColor("#137FEC");
  }

  private int withAlpha(int color, float alpha) {
    final int alphaInt = Math.round(255 * alpha);
    return Color.argb(alphaInt, Color.red(color), Color.green(color), Color.blue(color));
  }

  private int dpToPx(int dp) {
    return Math.round(layoutInflater.getContext().getResources().getDisplayMetrics().density * dp);
  }
}
