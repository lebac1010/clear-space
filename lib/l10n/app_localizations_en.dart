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

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings => 'You can change this later in Settings.';

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
  String get storeUnavailable => 'Store service temporarily unavailable.';

  @override
  String get browserRestricted => 'Browser access restricted on this device.';

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
  String get junkFilesFound => 'Junk Files Found';

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
  String get refreshingAppList => 'Refreshing app list...';

  @override
  String get openingUninstaller => 'Opening uninstaller...';

  @override
  String get uninstallApp => 'Uninstall App';

  @override
  String get uninstall => 'Uninstall';

  @override
  String get sortLargest => 'Largest';

  @override
  String get sortSmallest => 'Smallest';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get goToDashboard => 'Go to Dashboard';

  @override
  String get deleteFilesTitle => 'Delete Files';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get appManagerTitle => 'App Manager';

  @override
  String get searchApps => 'Search apps...';

  @override
  String get noAppsFound => 'No apps found';

  @override
  String get noMatchingApps => 'No matching apps';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data.';

  @override
  String appsCount(int count) {
    return '$count apps';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps';
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
  String get allClean => 'All clean!';

  @override
  String get deleting => 'Deleting...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone.';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files.';

  @override
  String get cleaning => 'Cleaning...';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size';
  }

  @override
  String get youreAllSet => 'You\'re All Set!';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found.';

  @override
  String get save => 'Save';

  @override
  String get keep => 'KEEP';

  @override
  String get deselectAll => 'Deselect All';

  @override
  String get images => 'Images';

  @override
  String get docs => 'Docs';

  @override
  String get others => 'Others';

  @override
  String get all => 'All';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted.';
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
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again.';

  @override
  String get systemDefault => 'System Default';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get strictSensitivity => 'Strict (95% Match)';

  @override
  String get normalSensitivity => 'Normal (85% Match)';

  @override
  String get looseSensitivity => 'Loose (75% Match)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged.';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan.';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup.';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan.';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone';

  @override
  String get versionUnavailable => 'Version unavailable';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Storage Dashboard';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown';

  @override
  String get cleanup => 'Cleanup';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get analyzing => 'Analyzing...';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Calculating...';

  @override
  String get internalStorage => 'INTERNAL STORAGE';

  @override
  String get free => 'Free';

  @override
  String get used => 'Used';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disk';

  @override
  String get phasePhotos => 'Photos';

  @override
  String get phaseVideos => 'Videos';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Documents';

  @override
  String get phaseJunk => 'Junk Files';

  @override
  String get phaseFolders => 'Folders';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Similar Photos';

  @override
  String get phaseStorage => 'Storage';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Used';
  }

  @override
  String get largeFilesTitle => 'Large Files';

  @override
  String get selectYourLanguage => 'Select Your Language';

  @override
  String get analyzingLabel => 'Analyzing...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count items';
  }
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
    return '$count items selected';
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

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings => 'You can change this later in Settings.';

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
  String get analyzingSafeToDelete => 'Analysing safe-to-delete files...';

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
  String get storeUnavailable => 'Store service temporarily unavailable.';

  @override
  String get browserRestricted => 'Browser access restricted on this device.';

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
  String get deleteFilesQuestion => 'Delete files?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Delete $count screenshots permanently?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Screenshots deleted successfully';

  @override
  String get junkFilesFound => 'Junk Files Found';

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
  String get refreshingAppList => 'Refreshing app list...';

  @override
  String get openingUninstaller => 'Opening uninstaller...';

  @override
  String get uninstallApp => 'Uninstall App';

  @override
  String get uninstall => 'Uninstall';

  @override
  String get sortLargest => 'Largest';

  @override
  String get sortSmallest => 'Smallest';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get goToDashboard => 'Go to Dashboard';

  @override
  String get deleteFilesTitle => 'Delete Files';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get appManagerTitle => 'App Manager';

  @override
  String get searchApps => 'Search apps...';

  @override
  String get noAppsFound => 'No apps found';

  @override
  String get noMatchingApps => 'No matching apps';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data.';

  @override
  String appsCount(int count) {
    return '$count apps';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps';
  }

  @override
  String get allClean => 'All clean!';

  @override
  String get deleting => 'Deleting...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone.';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files.';

  @override
  String get cleaning => 'Cleaning...';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size';
  }

  @override
  String get youreAllSet => 'You\'re All Set!';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found.';

  @override
  String get save => 'Save';

  @override
  String get keep => 'KEEP';

  @override
  String get deselectAll => 'Deselect All';

  @override
  String get images => 'Images';

  @override
  String get docs => 'Docs';

  @override
  String get others => 'Others';

  @override
  String get all => 'All';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted.';
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
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again.';

  @override
  String get systemDefault => 'System Default';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get strictSensitivity => 'Strict (95% Match)';

  @override
  String get normalSensitivity => 'Normal (85% Match)';

  @override
  String get looseSensitivity => 'Loose (75% Match)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged.';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan.';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup.';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan.';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone';

  @override
  String get versionUnavailable => 'Version unavailable';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Storage Dashboard';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown';

  @override
  String get cleanup => 'Cleanup';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get analyzing => 'Analyzing...';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Calculating...';

  @override
  String get internalStorage => 'INTERNAL STORAGE';

  @override
  String get free => 'Free';

  @override
  String get used => 'Used';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disk';

  @override
  String get phasePhotos => 'Photos';

  @override
  String get phaseVideos => 'Videos';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Documents';

  @override
  String get phaseJunk => 'Junk Files';

  @override
  String get phaseFolders => 'Folders';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Similar Photos';

  @override
  String get phaseStorage => 'Storage';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Used';
  }

  @override
  String get largeFilesTitle => 'Large Files';

  @override
  String get selectYourLanguage => 'Select Your Language';

  @override
  String get analyzingLabel => 'Analyzing...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count items';
  }
}
