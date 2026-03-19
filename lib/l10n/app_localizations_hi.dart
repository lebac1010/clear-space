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
  String get storagePermissionDeniedDesc =>
      'स्टोरेज अनुमति अस्वीकार कर दी गई थी। कृपया जारी रखने के लिए सेटिंग्स में इसे सक्षम करें।';

  @override
  String get permissionMediaTitle => 'फ़ोटो, वीडियो और ऑडियो';

  @override
  String get permissionMediaDesc =>
      'आपके डिवाइस पर डुप्लिकेट फ़ाइलें, समान फ़ोटो, स्क्रीनशॉट, डाउनलोड और बड़े मीडिया ढूंढने के लिए उपयोग किया जाता है।';

  @override
  String get permissionAllFilesTitle => 'सभी फ़ाइलों तक पहुंच';

  @override
  String get permissionAllFilesDesc =>
      'जंक फ़ाइलें, एपीके समीक्षा, डाउनलोड समीक्षा और खाली फ़ोल्डर जैसी गैर-मीडिया सफाई सुविधाओं के लिए उपयोग किया जाता है।';

  @override
  String get permissionInstalledAppsTitle => 'इंस्टॉल किए गए ऐप्स';

  @override
  String get permissionInstalledAppsDesc =>
      'ऐप मैनेजर द्वारा लॉन्चर-दृश्यमान इंस्टॉल किए गए ऐप्स दिखाने और जब आप चाहें तो एंड्रॉइड अनइंस्टॉल पुष्टिकरण खोलने के लिए उपयोग किया जाता है।';

  @override
  String get permissionVisibleProgressTitle => 'दृश्यमान प्रगति';

  @override
  String get permissionVisibleProgressDesc =>
      'उपयोगकर्ता द्वारा शुरू किए गए कार्य के दौरान स्कैन या सफाई की प्रगति को दृश्यमान रखने के लिए उपयोग किया जाता।';

  @override
  String get permissionOnDeviceNote =>
      'स्कैनिंग और सफाई विश्लेषण आपके डिवाइस पर रहता है। क्लियर स्पेस इन सुविधाओं के लिए आपकी फ़ाइलों को डेवलपर सर्वर पर अपलोड नहीं करता है।';

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get grantPermission => 'अनुमति दें';

  @override
  String get getStarted => 'शुरू करें';

  @override
  String get skip => 'छोड़ें';

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
      ' जारी रखकर, आप हमारी सेवा की शर्तों और गोपनीयता नीति से सहमत होते हैं।';

  @override
  String get selectLanguage => 'अपनी भाषा चुनें';

  @override
  String get changeLaterInSettings =>
      'आप इसे बाद में सेटिंग्स में बदल सकते हैं।';

  @override
  String get photosAndImages => 'फोटो और चित्र';

  @override
  String get videos => 'वीडियो';

  @override
  String get audio => 'ऑडियो';

  @override
  String get documentsAndFiles => 'दस्तावेज़ और फ़ाइलें';

  @override
  String get systemAndApps => 'सिस्टम और ऐप्स';

  @override
  String get other => 'अन्य';

  @override
  String get review => 'समीक्षा';

  @override
  String get viewDetails => 'विवरण देखें';

  @override
  String get smartCleanupPlan => 'स्मार्ट सफाई योजना';

  @override
  String get analyzingSafeToDelete =>
      'हटाने के लिए सुरक्षित फ़ाइलों का विश्लेषण कर रहे हैं...';

  @override
  String get returnToDashboard => 'डैशबोर्ड पर लौटें';

  @override
  String get returnDirectlyToDashboard => 'सीधे डैशबोर्ड पर लौटें';

  @override
  String get appearanceAndLanguage => 'दिखावट और भाषा';

  @override
  String get supportAndEngagement => 'सहायता और सहभागिता';

  @override
  String get scanPreferences => 'स्कैन प्राथमिकताएं';

  @override
  String get legalAndAppInfo => 'कानूनी और ऐप जानकारी';

  @override
  String get cleanupHistory => 'सफाई इतिहास';

  @override
  String get viewPastCleaning => 'अपनी पिछली सफाई गतिविधियां देखें';

  @override
  String get sendFeedback => 'प्रतिक्रिया भेजें';

  @override
  String get reportBugs => 'बग की रिपोर्ट करें या सुधारों का सुझाव दें';

  @override
  String get rateUs => 'हमें 5 स्टार दें';

  @override
  String get helpOthers => 'दूसरों को क्लियर स्पेस खोजने में मदद करें';

  @override
  String get shareWithFriends => 'दोस्तों के साथ साझा करें';

  @override
  String get recommendApp => 'संदेशों के माध्यम से ऐप की सिफारिश करें';

  @override
  String get similarPhotoSensitivity => 'समान फोटो संवेदनशीलता';

  @override
  String get largeFileThreshold => 'बड़ी फ़ाइल सीमा';

  @override
  String get strict => 'सख्त';

  @override
  String get normal => 'सामान्य';

  @override
  String get loose => 'ढीला';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get howWeProtectData => 'हम आपके डेटा की सुरक्षा कैसे करते हैं';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get rulesAndGuidelines => 'नियम और दिशा-निर्देश';

  @override
  String get appVersion => 'ऐप संस्करण';

  @override
  String get emailRestricted => 'डिवाइस द्वारा ईमेल कार्यक्षमता प्रतिबंधित है।';

  @override
  String get browserLaunchFailed => 'ब्राउज़र लॉन्च नहीं हो सका।';

  @override
  String get storeUnavailable => 'स्टोर सेवा अस्थायी रूप से अनुपलब्ध है।';

  @override
  String get browserRestricted => 'इस डिवाइस पर ब्राउज़र एक्सेस प्रतिबंधित है।';

  @override
  String get shareUnavailable => 'साझाकरण कार्यक्षमता अनुपलब्ध है।';

  @override
  String get keepPhoneClean => 'क्लियर स्पेस के साथ अपने फोन को साफ रखें';

  @override
  String get duplicateFiles => 'डुप्लिकेट फ़ाइलें';

  @override
  String get findIdenticalFiles => 'समान फ़ाइलें ढूंढें और निकालें';

  @override
  String get similarPhotos => 'समान फोटो';

  @override
  String get findKeyMoments => 'मुख्य फोटो क्षणों को खोजें';

  @override
  String get largeFiles => 'बड़ी फ़ाइलें';

  @override
  String filesLargerThan(String size) {
    return '$size से बड़ी फ़ाइलें';
  }

  @override
  String get screenshots => 'स्क्रीनशॉट';

  @override
  String get findAndDeleteScreenshots => 'स्क्रीनशॉट ढूंढें और हटाएं';

  @override
  String get downloads => 'डाउनलोड';

  @override
  String get manageDownloadedFiles =>
      'अपनी डाउनलोड की गई फ़ाइलों को प्रबंधित करें';

  @override
  String get tempAndLogFiles => 'अस्थायी और लॉग फ़ाइलें';

  @override
  String sizeFound(String size) {
    return '$size मिला';
  }

  @override
  String get emptyFolders => 'खाली फोल्डर';

  @override
  String emptyFoldersFound(int count) {
    return '$count खाली फोल्डर मिले';
  }

  @override
  String get safeApkInstallers => 'सुरक्षित एपीके इंस्टालर';

  @override
  String get cleanOldApks => 'इंस्टॉल किए गए/पुराने एपीके साफ़ करें';

  @override
  String get pleaseScanStorageFirst => 'कृपया पहले स्टोरेज स्कैन करें';

  @override
  String get noJunkFilesFound => 'कोई जंक फ़ाइल नहीं मिली!';

  @override
  String get cleanupComplete => 'सफाई पूरी हुई!';

  @override
  String cleanupFailed(String error) {
    return 'सफाई विफल रही: $error';
  }

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String get noLargeFilesFound => 'कोई बड़ी फ़ाइल नहीं मिली!';

  @override
  String get noDuplicatesFound => 'कोई डुप्लिकेट नहीं मिला!';

  @override
  String get delete => 'मिटाएं';

  @override
  String get confirmation => 'पुष्टिकरण';

  @override
  String get clearHistory => 'इतिहास साफ़ करें';

  @override
  String get clearHistoryConfirm =>
      'क्या आप वाकई सभी सफाई लॉग हटाना चाहते हैं?';

  @override
  String get clearAll => 'सभी साफ़ करें';

  @override
  String get cleanAllSafeItems => 'सभी सुरक्षित आइटम साफ़ करें';

  @override
  String get deleteFilesQuestion => 'फ़ाइलें हटाएं?';

  @override
  String deleteCountScreenshots(int count) {
    return '$count स्क्रीनशॉट स्थायी रूप से हटाएं?';
  }

  @override
  String get screenshotsDeletedSuccess => 'स्क्रीनशॉट सफलतापूर्वक हटा दिए गए';

  @override
  String get junkFilesFound => 'कचरा फ़ाइलें मिलीं';

  @override
  String get noPhotosFound => 'कोई फोटो नहीं मिला';

  @override
  String errorLoadingPhotos(String error) {
    return 'फ़ोटो लोड करने में त्रुटि: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'हटाना विफल रहा: $error';
  }

  @override
  String get contacts => 'संपर्क';

  @override
  String get contactsNotImplemented => 'संपर्क सूची लागू नहीं की गई है';

  @override
  String get smartSelect => 'स्मार्ट चयन';

  @override
  String get junkFiles => 'जंक फ़ाइलें';

  @override
  String potentialSize(String size) {
    return '$size संभावित';
  }

  @override
  String get noFilesMatchFilter => 'कोई भी फ़ाइल इस फ़िल्टर से मेल नहीं खाती';

  @override
  String get refreshingAppList => 'ऐप सूची रीफ्रेश कर रहे हैं...';

  @override
  String get openingUninstaller => 'अनइंस्टालर खोल रहे हैं...';

  @override
  String get uninstallApp => 'ऐप अनइंस्टॉल करें';

  @override
  String get uninstall => 'अनइंस्टॉल';

  @override
  String get sortLargest => 'सबसे बड़ा पहलू';

  @override
  String get sortSmallest => 'सबसे छोटा पहलू';

  @override
  String get sortNewest => 'नवीनतम';

  @override
  String get sortAZ => 'A से Z';

  @override
  String get pageNotFound => 'पृष्ठ नहीं मिला';

  @override
  String get goToDashboard => 'डैशबोर्ड पर जाएं';

  @override
  String get deleteFilesTitle => 'फ़ाइलें हटा दें';

  @override
  String get smartCleanupPlanTitle => 'स्मार्ट सफाई योजना';

  @override
  String get screenshotsCleanerTitle => 'स्क्रीनशॉट क्लीनर';

  @override
  String get tryAgain => 'फिर से प्रयास करें';

  @override
  String get appManagerTitle => 'ऐप प्रबंधक';

  @override
  String get searchApps => 'ऐप खोजें...';

  @override
  String get noAppsFound => 'कोई ऐप नहीं मिला';

  @override
  String get noMatchingApps => 'कोई संबंधित ऐप नहीं';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'क्या आप निश्चित रूप से \"$appName\" ($size) अनइंस्टॉल करना चाहते हैं?';
  }

  @override
  String get uninstallActionDesc => 'यह ऐप और उसका सारा डेटा मिटा देगा।';

  @override
  String appsCount(int count) {
    return '$count ऐप्स';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total ऐप्स';
  }

  @override
  String get duplicates => 'डुप्लिकेट';

  @override
  String get similar => 'समान';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया';

  @override
  String get pageNotFoundDesc =>
      'वह पृष्ठ जिसे आप ढूंढ रहे हैं वह मौजूद नहीं है।';

  @override
  String get allClean => 'सब कुछ साफ़ है!';

  @override
  String get deleting => 'हटा रहे हैं...';

  @override
  String deleteItemsCount(int count, String size) {
    return '$count आइटम हटाएं ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count आइटम हटाए गए ($size)';
  }

  @override
  String get actionCannotBeUndone => 'इस क्रिया को पूर्ववत नहीं किया जा सकता।';

  @override
  String get cleanupBreakdown => 'सफाई विवरण';

  @override
  String get smartCleanupDesc =>
      'हम स्वचालित रूप से आपकी फ़ोटो का सबसे अच्छा संस्करण रखते हैं।';

  @override
  String get cleaning => 'सफाई हो रही है...';

  @override
  String cleanUpSize(String size) {
    return '$size खाली करें';
  }

  @override
  String youSavedSize(String size) {
    return 'आपने $size बचाया';
  }

  @override
  String get youreAllSet => 'सब कुछ तैयार है!';

  @override
  String get noSmartCleanupItems => 'कोई डुप्लिकेट नहीं मिला।';

  @override
  String get save => 'बचाएं';

  @override
  String get keep => 'रखें';

  @override
  String get deselectAll => 'सब चुनी हुई हटाएँ';

  @override
  String get images => 'इमेजेज';

  @override
  String get docs => 'दस्तावेज़';

  @override
  String get others => 'अन्य';

  @override
  String get all => 'सभी';

  @override
  String deleteConfirmMsg(int count) {
    return 'क्या आप चुने गए $count दस्तावेज़ मिटाना चाहते हैं?';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count स्क्रीनशॉट',
      one: '1 स्क्रीनशॉट',
      zero: 'कोई स्क्रीनशॉट नहीं',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'चुना हुआ: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'चुने गए आइटम हटाएँ ($size)';
  }

  @override
  String get deleteFailedGeneral =>
      'कुछ आइटम हटाने में विफल रहे। पुनः प्रयास करें।';

  @override
  String get systemDefault => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get light => 'हल्का';

  @override
  String get dark => 'गहरा';

  @override
  String get strictSensitivity => 'सख्त (95% मिलान)';

  @override
  String get normalSensitivity => 'सामान्य (85% मिलान)';

  @override
  String get looseSensitivity => 'लचीला (75% मिलान)';

  @override
  String get sensitivityDesc =>
      'चुनें कि ऐप कितनी सख्ती से समान फ़ोटो पहचानता है।';

  @override
  String get strictSensitivityDesc => 'सख्त — लगभग एकदम समान तस्वीर';

  @override
  String get normalSensitivityDesc => 'सामान्य — प्रमाणित उपयोग';

  @override
  String get looseSensitivityDesc => 'ढीला — अधिक तस्वीरें पकड़ेगा';

  @override
  String get sensitivityUpdated => 'संवेदनशीलता अद्यतित की गई।';

  @override
  String get thresholdDesc =>
      'इस आकार से बड़ी फाइलें हटाने के लिए चिह्नित होंगी।';

  @override
  String get thresholdUpdated => 'सीमा अद्यतित की गई।';

  @override
  String largerThanSize(String size) {
    return '$size से बड़ी';
  }

  @override
  String get madeWithHeart => 'साफ़ फ़ोन के लिए ❤️ से बना';

  @override
  String get versionUnavailable => 'संस्करण अनुपलब्ध';

  @override
  String get emailNotSupported => 'ईमेल ग्राहक नहीं खुला।';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'स्टोरेज डैशबोर्ड';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count आइटम साफ़ हो सकते हैं';
  }

  @override
  String get storageBreakdown => 'स्टोरेज उपयोग';

  @override
  String get cleanup => 'सफाई करें';

  @override
  String get suggestions => 'सुझाव';

  @override
  String get analyzing => 'विश्लेषण...';

  @override
  String get keepStorageHealthy => 'स्थान को स्वस्थ रखें';

  @override
  String get cleanupHeaderDesc => 'स्थान खाली करने वाले दस्तावेज़।';

  @override
  String percentUsed(int percentage) {
    return '$percentage% उपयोग';
  }

  @override
  String get scanPausedBattery => 'रुक गया (कम बैटरी)';

  @override
  String scanningPhase(String phase) {
    return 'स्कैनिंग $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'स्कैनिंग $phase... ($percentage%)';
  }

  @override
  String get calculating => 'मूल्यांकन कर रहे हैं...';

  @override
  String get internalStorage => 'इंटरनल स्टोरेज';

  @override
  String get free => 'खाली';

  @override
  String get used => 'भरा हुआ';

  @override
  String get total => 'कुल';

  @override
  String get phaseDisk => 'डिस्क';

  @override
  String get phasePhotos => 'चित्र';

  @override
  String get phaseVideos => 'वीडियो';

  @override
  String get phaseAudio => 'संगीत';

  @override
  String get phaseDocuments => 'दस्तावेज़';

  @override
  String get phaseJunk => 'जंक';

  @override
  String get phaseFolders => 'फोल्डर';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'समान तस्वीरें';

  @override
  String get phaseStorage => 'स्टोरेज';

  @override
  String totalSize(String size) {
    return '$size कुल';
  }

  @override
  String usedSize(String size) {
    return '$size उपयोग';
  }

  @override
  String get largeFilesTitle => 'बड़ी फ़ाइलें';

  @override
  String get selectYourLanguage => 'अपनी भाषा चुनें';

  @override
  String get analyzingLabel => 'विश्लेषण हो रहा है...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count आइटम';
  }
}
