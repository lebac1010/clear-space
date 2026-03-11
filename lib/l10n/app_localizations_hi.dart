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

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings =>
      'You can change this later in Settings. (hi)';

  @override
  String get photosAndImages => 'Photos & Images';

  @override
  String get videos => 'Videos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Documents & Files';

  @override
  String get systemAndApps => 'System & Apps';

  @override
  String get other => 'OTHER';

  @override
  String get review => 'Review';

  @override
  String get viewDetails => 'View Details';

  @override
  String get smartCleanupPlan => 'Smart Cleanup Plan';

  @override
  String get analyzingSafeToDelete => 'Analyzing safe-to-delete files...';

  @override
  String get returnToDashboard => 'Return to Dashboard';

  @override
  String get returnDirectlyToDashboard => 'Return directly to Dashboard';

  @override
  String get appearanceAndLanguage => 'Appearance & Language';

  @override
  String get supportAndEngagement => 'Support & Engagement';

  @override
  String get scanPreferences => 'Scan Preferences';

  @override
  String get legalAndAppInfo => 'Legal & App Info';

  @override
  String get cleanupHistory => 'Cleanup History';

  @override
  String get viewPastCleaning => 'View your past cleaning activities';

  @override
  String get sendFeedback => 'Send Feedback';

  @override
  String get reportBugs => 'Report bugs or suggest improvements';

  @override
  String get rateUs => 'Rate Us 5 Stars';

  @override
  String get helpOthers => 'Help others find Clear Space';

  @override
  String get shareWithFriends => 'Share with Friends';

  @override
  String get recommendApp => 'Recommend the app via messages';

  @override
  String get similarPhotoSensitivity => 'Similar Photo Sensitivity';

  @override
  String get largeFileThreshold => 'Large File Threshold';

  @override
  String get strict => 'Strict';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Loose';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get howWeProtectData => 'How we protect your data';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get rulesAndGuidelines => 'Rules and guidelines';

  @override
  String get appVersion => 'App Version';

  @override
  String get emailRestricted => 'Email functionality restricted by device.';

  @override
  String get browserLaunchFailed => 'Could not launch browser.';

  @override
  String get storeUnavailable => 'Store service temporarily unavailable. (hi)';

  @override
  String get browserRestricted =>
      'Browser access restricted on this device. (hi)';

  @override
  String get shareUnavailable => 'Share functionality unavailable.';

  @override
  String get keepPhoneClean => 'Keep your phone clean with Clear Space';

  @override
  String get duplicateFiles => 'Duplicate Files';

  @override
  String get findIdenticalFiles => 'Find and remove identical files';

  @override
  String get similarPhotos => 'Similar Photos';

  @override
  String get findKeyMoments => 'Find key photo moments';

  @override
  String get largeFiles => 'Large Files';

  @override
  String filesLargerThan(String size) {
    return 'Files larger than $size';
  }

  @override
  String get screenshots => 'Screenshots';

  @override
  String get findAndDeleteScreenshots => 'Find and delete screenshots';

  @override
  String get downloads => 'Downloads';

  @override
  String get manageDownloadedFiles => 'Manage your downloaded files';

  @override
  String get tempAndLogFiles => 'Temporary & Log Files';

  @override
  String sizeFound(String size) {
    return '$size found';
  }

  @override
  String get emptyFolders => 'Empty Folders';

  @override
  String emptyFoldersFound(int count) {
    return '$count empty folders found';
  }

  @override
  String get safeApkInstallers => 'Safe APK Installers';

  @override
  String get cleanOldApks => 'Clean installed/old APKs';

  @override
  String get pleaseScanStorageFirst => 'Please scan storage first';

  @override
  String get noJunkFilesFound => 'No junk files found!';

  @override
  String get cleanupComplete => 'Cleanup complete!';

  @override
  String cleanupFailed(String error) {
    return 'Cleanup failed: $error';
  }

  @override
  String get selectAll => 'Select All';

  @override
  String get noLargeFilesFound => 'No large files found!';

  @override
  String get noDuplicatesFound => 'No duplicates found!';

  @override
  String get delete => 'Delete';

  @override
  String get confirmation => 'Confirmation';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get clearHistoryConfirm =>
      'Are you sure you want to delete all cleanup logs?';

  @override
  String get clearAll => 'Clear All';

  @override
  String get cleanAllSafeItems => 'Clean All Safe Items';

  @override
  String get deleteFilesQuestion => 'Delete files?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Delete $count screenshots permanently?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Screenshots deleted successfully';

  @override
  String get junkFilesFound => 'Junk Files Found (hi)';

  @override
  String get noPhotosFound => 'No photos found';

  @override
  String errorLoadingPhotos(String error) {
    return 'Error loading photos: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Delete failed: $error';
  }

  @override
  String get contacts => 'Contacts';

  @override
  String get contactsNotImplemented => 'Contacts List Not Implemented';

  @override
  String get smartSelect => 'Smart Select';

  @override
  String get junkFiles => 'Junk Files';

  @override
  String potentialSize(String size) {
    return '$size potential';
  }

  @override
  String get noFilesMatchFilter => 'No files match this filter';

  @override
  String get refreshingAppList => 'Refreshing app list... (hi)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (hi)';

  @override
  String get uninstallApp => 'Uninstall App (hi)';

  @override
  String get uninstall => 'Uninstall (hi)';

  @override
  String get sortLargest => 'Largest (hi)';

  @override
  String get sortSmallest => 'Smallest (hi)';

  @override
  String get sortNewest => 'Newest (hi)';

  @override
  String get sortAZ => 'A-Z (hi)';

  @override
  String get pageNotFound => 'Page Not Found (hi)';

  @override
  String get goToDashboard => 'Go to Dashboard (hi)';

  @override
  String get deleteFilesTitle => 'Delete Files (hi)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (hi)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (hi)';

  @override
  String get tryAgain => 'Try Again (hi)';

  @override
  String get appManagerTitle => 'App Manager (hi)';

  @override
  String get searchApps => 'Search apps... (hi)';

  @override
  String get noAppsFound => 'No apps found (hi)';

  @override
  String get noMatchingApps => 'No matching apps (hi)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (hi)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (hi)';

  @override
  String appsCount(int count) {
    return '$count apps (hi)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (hi)';
  }

  @override
  String get duplicates => 'Duplicates';

  @override
  String get similar => 'Similar';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get pageNotFoundDesc => 'The page you are looking for does not exist.';

  @override
  String get allClean => 'All clean! (hi)';

  @override
  String get deleting => 'Deleting... (hi)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (hi)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (hi)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (hi)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (hi)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (hi)';

  @override
  String get cleaning => 'Cleaning... (hi)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (hi)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (hi)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (hi)';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found. (hi)';

  @override
  String get save => 'Save (hi)';

  @override
  String get keep => 'KEEP (hi)';

  @override
  String get deselectAll => 'Deselect All (hi)';

  @override
  String get images => 'Images (hi)';

  @override
  String get docs => 'Docs (hi)';

  @override
  String get others => 'Others (hi)';

  @override
  String get all => 'All (hi)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (hi)';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count screenshots',
      one: '1 screenshot',
      zero: 'No screenshots',
    );
    return '$_temp0 (hi)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (hi)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (hi)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (hi)';

  @override
  String get systemDefault => 'System Default (hi)';

  @override
  String get light => 'Light (hi)';

  @override
  String get dark => 'Dark (hi)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (hi)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (hi)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (hi)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (hi)';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only (hi)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (hi)';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations (hi)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (hi)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (hi)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (hi)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (hi)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (hi)';

  @override
  String get versionUnavailable => 'Version unavailable (hi)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (hi)';

  @override
  String get clearSpace => 'Clear Space (hi)';

  @override
  String get storageDashboard => 'Storage Dashboard (hi)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (hi)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (hi)';

  @override
  String get cleanup => 'Cleanup (hi)';

  @override
  String get suggestions => 'Suggestions (hi)';

  @override
  String get analyzing => 'Analyzing... (hi)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (hi)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (hi)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (hi)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (hi)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (hi)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (hi)';
  }

  @override
  String get calculating => 'Calculating... (hi)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (hi)';

  @override
  String get free => 'Free (hi)';

  @override
  String get used => 'Used (hi)';

  @override
  String get total => 'Total (hi)';

  @override
  String get phaseDisk => 'Disk (hi)';

  @override
  String get phasePhotos => 'Photos (hi)';

  @override
  String get phaseVideos => 'Videos (hi)';

  @override
  String get phaseAudio => 'Audio (hi)';

  @override
  String get phaseDocuments => 'Documents (hi)';

  @override
  String get phaseJunk => 'Junk Files (hi)';

  @override
  String get phaseFolders => 'Folders (hi)';

  @override
  String get phaseApks => 'APKs (hi)';

  @override
  String get phaseSimilar => 'Similar Photos (hi)';

  @override
  String get phaseStorage => 'Storage (hi)';

  @override
  String totalSize(String size) {
    return '$size Total (hi)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (hi)';
  }

  @override
  String get largeFilesTitle => 'Large Files (hi)';

  @override
  String get selectYourLanguage => 'Select Your Language (hi)';

  @override
  String get analyzingLabel => 'विश्लेषण हो रहा है...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count आइटम';
  }
}

/// The translations for Hindi, as used in India (`hi_IN`).
class AppLocalizationsHiIn extends AppLocalizationsHi {
  AppLocalizationsHiIn() : super('hi_IN');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'डैशबोर्ड';

  @override
  String get cleanupTitle => 'क्लीनअप';

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
  String get systemTheme => 'सिस्टम डिफॉल्ट';

  @override
  String get lightTheme => 'लाइट';

  @override
  String get darkTheme => 'डार्क';

  @override
  String get storageAccessRequired => 'स्टोरेज एक्सेस आवश्यक है';

  @override
  String get storageAccessDesc =>
      'क्लियर स्पेस को डुप्लिकेट, बड़ी फ़ाइलों और जंक फ़ाइलों के लिए आपके डिवाइस को स्कैन करने हेतु \"सभी फ़ाइल एक्सेस\" की आवश्यकता है।\n\nअनुमति दें पर टैप करने के बाद यह अनुमति देने के लिए आपको सिस्टम सेटिंग्स पर भेज दिया जाएगा।';

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
    return '$count आइटम चयनित';
  }

  @override
  String get onboardingWelcome =>
      'अपने डिवाइस को साफ़, तेज़ और सुरक्षित रखने के सबसे स्मार्ट तरीके में आपका स्वागत है।';

  @override
  String get onboardingFeaturesTitle => 'शक्तिशाली सुविधाएँ';

  @override
  String get onboardingFeaturesDesc =>
      'आपके स्टोरेज को प्रभावी ढंग से प्रबंधित करने के लिए आपकी ज़रूरत की हर चीज़।';

  @override
  String get feature1Title => 'अपने स्टोरेज को समझें';

  @override
  String get feature1Desc =>
      'क्या जगह ले रहा है इसका स्पष्ट दृश्य विवरण प्राप्त करें।';

  @override
  String get feature2Title => 'सुरक्षित रूप से साफ़ करें';

  @override
  String get feature2Desc =>
      'सुरक्षित डिलीशन प्रोटोकॉल के साथ अनावश्यक फ़ाइलों को हटाएँ।';

  @override
  String get feature3Title => 'जगह खाली करें';

  @override
  String get feature3Desc =>
      'जंक, बड़ी फ़ाइलों और डुप्लिकेट का तुरंत पता लगाएँ और उन्हें हटाएँ।';

  @override
  String get termsDesc =>
      'जारी रखकर, आप हमारी सेवा की शर्तों और गोपनीयता नीति से सहमत होते हैं।';

  @override
  String get selectLanguage => 'अपनी भाषा चुनें';

  @override
  String get changeLaterInSettings =>
      'आप इसे बाद में सेटिंग्स में बदल सकते हैं।';

  @override
  String get photosAndImages => 'तस्वीरें और छवियाँ';

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
  String get review => 'समीक्षा करें';

  @override
  String get viewDetails => 'विवरण देखें';

  @override
  String get smartCleanupPlan => 'स्मार्ट क्लीनअप योजना';

  @override
  String get analyzingSafeToDelete =>
      'सुरक्षित-से-हटाने वाली फ़ाइलों का विश्लेषण कर रहा है...';

  @override
  String get returnToDashboard => 'डैशबोर्ड पर वापस जाएँ';

  @override
  String get returnDirectlyToDashboard => 'सीधे डैशबोर्ड पर लौटें';

  @override
  String get appearanceAndLanguage => 'दिखावट और भाषा';

  @override
  String get supportAndEngagement => 'समर्थन और सहभागिता';

  @override
  String get scanPreferences => 'स्कैन प्राथमिकताएँ';

  @override
  String get legalAndAppInfo => 'कानूनी और ऐप जानकारी';

  @override
  String get cleanupHistory => 'क्लीनअप इतिहास';

  @override
  String get viewPastCleaning => 'अपनी पिछली सफ़ाई गतिविधियां देखें';

  @override
  String get sendFeedback => 'फ़ीडबैक भेजें';

  @override
  String get reportBugs => 'बग की रिपोर्ट करें या सुधारों का सुझाव दें';

  @override
  String get rateUs => 'हमें 5 स्टार रेटिंग दें';

  @override
  String get helpOthers => 'दूसरों को क्लियर स्पेस ढूंढने में मदद करें';

  @override
  String get shareWithFriends => 'दोस्तों के साथ साझा करें';

  @override
  String get recommendApp => 'संदेशों के माध्यम से ऐप की अनुशंसा करें';

  @override
  String get similarPhotoSensitivity => 'समान फ़ोटो संवेदनशीलता';

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
  String get howWeProtectData => 'हम आपका डेटा कैसे सुरक्षित रखते हैं';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get rulesAndGuidelines => 'नियम और दिशानिर्देश';

  @override
  String get appVersion => 'ऐप वर्ज़न';

  @override
  String get emailRestricted =>
      'ईमेल कार्यक्षमता डिवाइस द्वारा प्रतिबंधित की गई।';

  @override
  String get browserLaunchFailed => 'ब्राउज़र लॉन्च नहीं किया जा सका।';

  @override
  String get storeUnavailable => 'स्टोर सेवा अस्थायी रूप से अनुपलब्ध है।';

  @override
  String get browserRestricted =>
      'इस डिवाइस पर ब्राउज़र का एक्सेस प्रतिबंधित है।';

  @override
  String get shareUnavailable => 'साझाकरण कार्यक्षमता अनुपलब्ध है।';

  @override
  String get keepPhoneClean => 'Clear Space के साथ अपने फोन को साफ रखें';

  @override
  String get duplicateFiles => 'डुप्लिकेट फ़ाइलें';

  @override
  String get findIdenticalFiles => 'समान फ़ाइलों को खोजें और हटाएँ';

  @override
  String get similarPhotos => 'समान फ़ोटो';

  @override
  String get findKeyMoments => 'मुख्य फ़ोटो पल ढूँढें';

  @override
  String get largeFiles => 'बड़ी फ़ाइलें';

  @override
  String filesLargerThan(String size) {
    return '$size से बड़ी फ़ाइलें';
  }

  @override
  String get screenshots => 'स्क्रीनशॉट';

  @override
  String get findAndDeleteScreenshots => 'स्क्रीनशॉट खोजें और हटाएँ';

  @override
  String get downloads => 'डाउनलोड';

  @override
  String get manageDownloadedFiles =>
      'अपनी डाउनलोड की गई फ़ाइलों को प्रबंधित करें';

  @override
  String get tempAndLogFiles => 'अस्थायी और लॉग फ़ाइलें';

  @override
  String sizeFound(String size) {
    return '$size मिले';
  }

  @override
  String get emptyFolders => 'खाली फोल्डर';

  @override
  String emptyFoldersFound(int count) {
    return '$count खाली फ़ोल्डर मिले';
  }

  @override
  String get safeApkInstallers => 'सुरक्षित APK इंस्टॉलर';

  @override
  String get cleanOldApks => 'इंस्टॉल किए गए/पुराने APK साफ़ करें';

  @override
  String get pleaseScanStorageFirst => 'कृपया पहले स्टोरेज स्कैन करें';

  @override
  String get noJunkFilesFound => 'कोई जंक फ़ाइल नहीं मिली!';

  @override
  String get cleanupComplete => 'सफ़ाई पूरी हो गई!';

  @override
  String cleanupFailed(String error) {
    return 'क्लीनअप विफल: $error';
  }

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String get noLargeFilesFound => 'कोई बड़ी फ़ाइल नहीं मिली!';

  @override
  String get noDuplicatesFound => 'कोई डुप्लिकेट नहीं मिला!';

  @override
  String get delete => 'हटाएँ';

  @override
  String get confirmation => 'पुष्टिकरण';

  @override
  String get deleteFilesQuestion => 'फ़ाइलें हटाएँ?';

  @override
  String deleteCountScreenshots(int count) {
    return 'क्या $count स्क्रीनशॉट स्थायी रूप से हटा दिए जाएँ?';
  }

  @override
  String get screenshotsDeletedSuccess => 'स्क्रीनशॉट सफलतापूर्वक हटा दिए गए';

  @override
  String get junkFilesFound => 'Junk Files Found (hi_IN)';

  @override
  String get noPhotosFound => 'कोई फ़ोटो नहीं मिली';

  @override
  String errorLoadingPhotos(String error) {
    return 'फ़ोटो लोड करने में त्रुटि: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'हटाने में विफल: $error';
  }

  @override
  String get contacts => 'संपर्क';

  @override
  String get contactsNotImplemented => 'संपर्क सूची लागू नहीं की गई';

  @override
  String get smartSelect => 'स्मार्ट चयन';

  @override
  String get junkFiles => 'जंक फ़ाइलें';

  @override
  String potentialSize(String size) {
    return '$size क्षमता';
  }

  @override
  String get noFilesMatchFilter => 'कोई भी फ़ाइल इस फ़िल्टर से मेल नहीं खाती';

  @override
  String get refreshingAppList => 'Refreshing app list... (hi_IN)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (hi_IN)';

  @override
  String get uninstallApp => 'Uninstall App (hi_IN)';

  @override
  String get uninstall => 'Uninstall (hi_IN)';

  @override
  String get sortLargest => 'Largest (hi_IN)';

  @override
  String get sortSmallest => 'Smallest (hi_IN)';

  @override
  String get sortNewest => 'Newest (hi_IN)';

  @override
  String get sortAZ => 'A-Z (hi_IN)';

  @override
  String get pageNotFound => 'Page Not Found (hi_IN)';

  @override
  String get goToDashboard => 'Go to Dashboard (hi_IN)';

  @override
  String get deleteFilesTitle => 'Delete Files (hi_IN)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (hi_IN)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (hi_IN)';

  @override
  String get tryAgain => 'Try Again (hi_IN)';

  @override
  String get appManagerTitle => 'App Manager (hi_IN)';

  @override
  String get searchApps => 'Search apps... (hi_IN)';

  @override
  String get noAppsFound => 'No apps found (hi_IN)';

  @override
  String get noMatchingApps => 'No matching apps (hi_IN)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (hi_IN)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (hi_IN)';

  @override
  String appsCount(int count) {
    return '$count apps (hi_IN)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (hi_IN)';
  }

  @override
  String get allClean => 'All clean! (hi_IN)';

  @override
  String get deleting => 'Deleting... (hi_IN)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (hi_IN)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (hi_IN)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (hi_IN)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (hi_IN)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (hi_IN)';

  @override
  String get cleaning => 'Cleaning... (hi_IN)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (hi_IN)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (hi_IN)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (hi_IN)';

  @override
  String get noSmartCleanupItems =>
      'No duplicate or similar files found. (hi_IN)';

  @override
  String get save => 'Save (hi_IN)';

  @override
  String get keep => 'KEEP (hi_IN)';

  @override
  String get deselectAll => 'Deselect All (hi_IN)';

  @override
  String get images => 'Images (hi_IN)';

  @override
  String get docs => 'Docs (hi_IN)';

  @override
  String get others => 'Others (hi_IN)';

  @override
  String get all => 'All (hi_IN)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (hi_IN)';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count screenshots',
      one: '1 screenshot',
      zero: 'No screenshots',
    );
    return '$_temp0 (hi_IN)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (hi_IN)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (hi_IN)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (hi_IN)';

  @override
  String get systemDefault => 'System Default (hi_IN)';

  @override
  String get light => 'Light (hi_IN)';

  @override
  String get dark => 'Dark (hi_IN)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (hi_IN)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (hi_IN)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (hi_IN)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (hi_IN)';

  @override
  String get strictSensitivityDesc =>
      '95% Match — Nearly identical only (hi_IN)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (hi_IN)';

  @override
  String get looseSensitivityDesc =>
      '75% Match — Catches more variations (hi_IN)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (hi_IN)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (hi_IN)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (hi_IN)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (hi_IN)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (hi_IN)';

  @override
  String get versionUnavailable => 'Version unavailable (hi_IN)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (hi_IN)';

  @override
  String get clearSpace => 'Clear Space (hi_IN)';

  @override
  String get storageDashboard => 'Storage Dashboard (hi_IN)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (hi_IN)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (hi_IN)';

  @override
  String get cleanup => 'Cleanup (hi_IN)';

  @override
  String get suggestions => 'Suggestions (hi_IN)';

  @override
  String get analyzing => 'Analyzing... (hi_IN)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (hi_IN)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (hi_IN)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (hi_IN)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (hi_IN)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (hi_IN)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (hi_IN)';
  }

  @override
  String get calculating => 'Calculating... (hi_IN)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (hi_IN)';

  @override
  String get free => 'Free (hi_IN)';

  @override
  String get used => 'Used (hi_IN)';

  @override
  String get total => 'Total (hi_IN)';

  @override
  String get phaseDisk => 'Disk (hi_IN)';

  @override
  String get phasePhotos => 'Photos (hi_IN)';

  @override
  String get phaseVideos => 'Videos (hi_IN)';

  @override
  String get phaseAudio => 'Audio (hi_IN)';

  @override
  String get phaseDocuments => 'Documents (hi_IN)';

  @override
  String get phaseJunk => 'Junk Files (hi_IN)';

  @override
  String get phaseFolders => 'Folders (hi_IN)';

  @override
  String get phaseApks => 'APKs (hi_IN)';

  @override
  String get phaseSimilar => 'Similar Photos (hi_IN)';

  @override
  String get phaseStorage => 'Storage (hi_IN)';

  @override
  String totalSize(String size) {
    return '$size Total (hi_IN)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (hi_IN)';
  }

  @override
  String get largeFilesTitle => 'Large Files (hi_IN)';

  @override
  String get selectYourLanguage => 'Select Your Language (hi_IN)';
}
