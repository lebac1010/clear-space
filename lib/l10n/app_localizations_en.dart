// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get cleanupTitle => 'Cleanup';

  @override
  String get photosTitle => 'Photos';

  @override
  String get filesTitle => 'Files';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get languageTitle => 'Language';

  @override
  String get themeTitle => 'Theme';

  @override
  String get systemTheme => 'System Default';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get storageAccessRequired => 'Storage Access Required';

  @override
  String get storageAccessDesc =>
      'Clear Space needs \"All files access\" to scan your device for duplicates, large files, and junk files.\n\nYou will be directed to System Settings to grant this permission when you tap Grant Permission.';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get continueText => 'Continue';

  @override
  String get cancel => 'Cancel';

  @override
  String get analyze => 'Analyze';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get noItemsFound => 'No items found';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0 selected';
  }

  @override
  String get onboardingWelcome =>
      'Welcome to the smartest way to keep your device clean, fast, and secure.';

  @override
  String get onboardingFeaturesTitle => 'Powerful Features';

  @override
  String get onboardingFeaturesDesc =>
      'Everything you need to manage your storage efficiently.';

  @override
  String get feature1Title => 'Understand your storage';

  @override
  String get feature1Desc =>
      'Get a clear visual breakdown of what\'s taking up space.';

  @override
  String get feature2Title => 'Clean safely';

  @override
  String get feature2Desc =>
      'Remove unnecessary files with safe deletion protocols.';

  @override
  String get feature3Title => 'Free up space';

  @override
  String get feature3Desc =>
      'Instantly find and remove junk, large files, and duplicates.';

  @override
  String get termsDesc =>
      'By continuing, you agree to our Terms of Service & Privacy Policy.';
}

/// The translations for English, as used in the United Kingdom (`en_GB`).
class AppLocalizationsEnGb extends AppLocalizationsEn {
  AppLocalizationsEnGb() : super('en_GB');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get cleanupTitle => 'Cleanup';

  @override
  String get photosTitle => 'Photos';

  @override
  String get filesTitle => 'Files';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get languageTitle => 'Language';

  @override
  String get themeTitle => 'Theme';

  @override
  String get systemTheme => 'System Default';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get storageAccessRequired => 'Storage Access Required';

  @override
  String get storageAccessDesc =>
      'Clear Space needs \"All files access\" to scan your device for duplicates, large files, and junk files.\n\nYou will be directed to System Settings to grant this permission when you tap Grant Permission.';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get continueText => 'Continue';

  @override
  String get cancel => 'Cancel';

  @override
  String get analyze => 'Analyse';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get noItemsFound => 'No items found';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0 selected';
  }

  @override
  String get onboardingWelcome =>
      'Welcome to the smartest way to keep your device clean, fast, and secure.';

  @override
  String get onboardingFeaturesTitle => 'Powerful Features';

  @override
  String get onboardingFeaturesDesc =>
      'Everything you need to manage your storage efficiently.';

  @override
  String get feature1Title => 'Understand your storage';

  @override
  String get feature1Desc =>
      'Get a clear visual breakdown of what\'s taking up space.';

  @override
  String get feature2Title => 'Clean safely';

  @override
  String get feature2Desc =>
      'Remove unnecessary files with safe deletion protocols.';

  @override
  String get feature3Title => 'Free up space';

  @override
  String get feature3Desc =>
      'Instantly find and remove junk, large files, and duplicates.';

  @override
  String get termsDesc =>
      'By continuing, you agree to our Terms of Service & Privacy Policy.';
}
