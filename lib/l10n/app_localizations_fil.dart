// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get cleanupTitle => 'Linisin';

  @override
  String get photosTitle => 'Mga Larawan';

  @override
  String get filesTitle => 'Mga File';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get languageTitle => 'Wika';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Auto';

  @override
  String get lightTheme => 'Puti';

  @override
  String get darkTheme => 'Itim';

  @override
  String get storageAccessRequired => 'Kailangan ng Access';

  @override
  String get storageAccessDesc =>
      'Kailangan ng Clear Space ang \"Access sa lahat ng file\" upang masuri ang iyong device para sa mga duplicate, malalaking file, at mga basura.\n\nDadalhin ka sa Mga Setting upang ibigay ang pahintulot na ito.';

  @override
  String get grantPermission => 'Ibigay ang Pahintulot';

  @override
  String get getStarted => 'Magsimula';

  @override
  String get next => 'Susunod';

  @override
  String get continueText => 'Magpatuloy';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get analyze => 'Suriin';

  @override
  String get loading => 'Naglo-load...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Tagumpay';

  @override
  String get noItemsFound => 'Walang nakita';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aytem',
      one: '1 aytem',
      zero: '0 aytem',
    );
    return '$_temp0 ang napili';
  }

  @override
  String get onboardingWelcome =>
      'Maligayang pagdating sa pinakamatalinong paraan upang panatilihing malinis ang iyong cell phone.';

  @override
  String get onboardingFeaturesTitle => 'Makapangyarihang Tampok';

  @override
  String get onboardingFeaturesDesc =>
      'Lahat ng kailangan mo upang malinis ang storage.';

  @override
  String get feature1Title => 'Unawain ang storage';

  @override
  String get feature1Desc =>
      'Kumuha ng pagsusuri kung ano ang kumukuha ng espasyo.';

  @override
  String get feature2Title => 'Linisin nang ligtas';

  @override
  String get feature2Desc =>
      'Alisin ang mga file gamit ang ligtas na pag-delete.';

  @override
  String get feature3Title => 'Magbakante ng espasyo';

  @override
  String get feature3Desc =>
      'Agad na hanapin at alisin ang basura at malalaking file.';

  @override
  String get termsDesc =>
      'Sa pagpapatuloy, sumasang-ayon ka sa aming Mga Tuntunin.';
}
