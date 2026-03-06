// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'डैशबोर्ड';

  @override
  String get cleanupTitle => 'सफाई';

  @override
  String get photosTitle => 'तस्वीरें';

  @override
  String get filesTitle => 'फ़ाइलें';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get languageTitle => 'भाषा';

  @override
  String get themeTitle => 'थीम';

  @override
  String get systemTheme => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get lightTheme => 'हल्का';

  @override
  String get darkTheme => 'गहरा';

  @override
  String get storageAccessRequired => 'स्टोरेज एक्सेस आवश्यक';

  @override
  String get storageAccessDesc =>
      'क्लियर स्पेस को आपके डिवाइस में डुप्लिकेट, बड़ी फ़ाइलों और जंक फ़ाइलों को स्कैन करने के लिए \"सभी फ़ाइलों तक पहुंच\" की आवश्यकता है।\n\nअनुमति देने के लिए सिस्टम सेटिंग्स खुलेगी।';

  @override
  String get grantPermission => 'अनुमति दें';

  @override
  String get getStarted => 'शुरू करें';

  @override
  String get next => 'अगला';

  @override
  String get continueText => 'जारी रखें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get analyze => 'विश्लेषण करें';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get error => 'त्रुटि';

  @override
  String get success => 'सफलता';

  @override
  String get noItemsFound => 'कोई आइटम नहीं मिला';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आइटम',
      one: '1 आइटम',
      zero: 'कोई आइटम नहीं',
    );
    return '$_temp0 चुने गए';
  }

  @override
  String get onboardingWelcome =>
      'अपने डिवाइस को साफ़, तेज़ और सुरक्षित रखने के सबसे स्मार्ट तरीके में आपका स्वागत है।';

  @override
  String get onboardingFeaturesTitle => 'शक्तिशाली विशेषताएँ';

  @override
  String get onboardingFeaturesDesc =>
      'अपने स्टोरेज को कुशलतापूर्वक प्रबंधित करने के लिए आपको जो कुछ भी चाहिए।';

  @override
  String get feature1Title => 'अपना स्टोरेज समझें';

  @override
  String get feature1Desc =>
      'स्पष्ट दृश्य विश्लेषण प्राप्त करें कि क्या जगह घेर रहा है।';

  @override
  String get feature2Title => 'सुरक्षित रूप से साफ़ करें';

  @override
  String get feature2Desc =>
      'सुरक्षित हटाना प्रोटोकॉल के साथ अनावश्यक फ़ाइलों को निकालें।';

  @override
  String get feature3Title => 'स्थान खाली करें';

  @override
  String get feature3Desc =>
      'तुरंत जंक, बड़ी फ़ाइलें और डुप्लिकेट ढूंढें और हटा दें।';

  @override
  String get termsDesc =>
      'जारी रखकर, आप हमारी सेवा की शर्तों और गोपनीयता नीति से सहमत होते हैं।';
}
