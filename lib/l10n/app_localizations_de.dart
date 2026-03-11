// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get cleanupTitle => 'Bereinigen';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Dateien';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get themeTitle => 'Design';

  @override
  String get systemTheme => 'Auto';

  @override
  String get lightTheme => 'Hell';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String get storageAccessRequired => 'Zugriff erforderlich';

  @override
  String get storageAccessDesc =>
      'Clear Space benötigt den \"Zugriff auf alle Dateien\", um Ihr Gerät auf Duplikate, große Dateien und Junk-Dateien zu scannen.\n\nSie werden zu den Einstellungen weitergeleitet, um dies zu erlauben.';

  @override
  String get grantPermission => 'Erlauben';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get next => 'Weiter';

  @override
  String get continueText => 'Fortfahren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get analyze => 'Analysieren';

  @override
  String get loading => 'Laden...';

  @override
  String get error => 'Fehler';

  @override
  String get success => 'Erfolgreich';

  @override
  String get noItemsFound => 'Nichts gefunden';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '1 Element',
      zero: '0 Elemente',
    );
    return '$_temp0 ausgewählt';
  }

  @override
  String get onboardingWelcome =>
      'Der intelligenteste Weg, Ihr Gerät sauber, schnell und sicher zu halten.';

  @override
  String get onboardingFeaturesTitle => 'Starke Funktionen';

  @override
  String get onboardingFeaturesDesc =>
      'Alles, was Sie zur Verwaltung Ihres Speichers benötigen.';

  @override
  String get feature1Title => 'Speicher analysieren';

  @override
  String get feature1Desc => 'Visuelle Aufschlüsselung Ihres Speichers.';

  @override
  String get feature2Title => 'Sicher bereinigen';

  @override
  String get feature2Desc => 'Unnötige Dateien sicher löschen.';

  @override
  String get feature3Title => 'Platz schaffen';

  @override
  String get feature3Desc =>
      'Finden Sie sofort Junk, große Dateien und Duplikate.';

  @override
  String get termsDesc => 'Durch Fortfahren stimmen Sie den Bedingungen zu.';

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings =>
      'You can change this later in Settings. (de)';

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
  String get storeUnavailable => 'Store service temporarily unavailable. (de)';

  @override
  String get browserRestricted =>
      'Browser access restricted on this device. (de)';

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
  String get junkFilesFound => 'Junk Files Found (de)';

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
  String get refreshingAppList => 'Refreshing app list... (de)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (de)';

  @override
  String get uninstallApp => 'Uninstall App (de)';

  @override
  String get uninstall => 'Uninstall (de)';

  @override
  String get sortLargest => 'Largest (de)';

  @override
  String get sortSmallest => 'Smallest (de)';

  @override
  String get sortNewest => 'Newest (de)';

  @override
  String get sortAZ => 'A-Z (de)';

  @override
  String get pageNotFound => 'Page Not Found (de)';

  @override
  String get goToDashboard => 'Go to Dashboard (de)';

  @override
  String get deleteFilesTitle => 'Delete Files (de)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (de)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (de)';

  @override
  String get tryAgain => 'Try Again (de)';

  @override
  String get appManagerTitle => 'App Manager (de)';

  @override
  String get searchApps => 'Search apps... (de)';

  @override
  String get noAppsFound => 'No apps found (de)';

  @override
  String get noMatchingApps => 'No matching apps (de)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (de)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (de)';

  @override
  String appsCount(int count) {
    return '$count apps (de)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (de)';
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
  String get allClean => 'All clean! (de)';

  @override
  String get deleting => 'Deleting... (de)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (de)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (de)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (de)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (de)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (de)';

  @override
  String get cleaning => 'Cleaning... (de)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (de)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (de)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (de)';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found. (de)';

  @override
  String get save => 'Save (de)';

  @override
  String get keep => 'KEEP (de)';

  @override
  String get deselectAll => 'Deselect All (de)';

  @override
  String get images => 'Images (de)';

  @override
  String get docs => 'Docs (de)';

  @override
  String get others => 'Others (de)';

  @override
  String get all => 'All (de)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (de)';
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
    return '$_temp0 (de)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (de)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (de)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (de)';

  @override
  String get systemDefault => 'System Default (de)';

  @override
  String get light => 'Light (de)';

  @override
  String get dark => 'Dark (de)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (de)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (de)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (de)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (de)';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only (de)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (de)';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations (de)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (de)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (de)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (de)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (de)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (de)';

  @override
  String get versionUnavailable => 'Version unavailable (de)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (de)';

  @override
  String get clearSpace => 'Clear Space (de)';

  @override
  String get storageDashboard => 'Storage Dashboard (de)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (de)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (de)';

  @override
  String get cleanup => 'Cleanup (de)';

  @override
  String get suggestions => 'Suggestions (de)';

  @override
  String get analyzing => 'Analyzing... (de)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (de)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (de)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (de)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (de)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (de)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (de)';
  }

  @override
  String get calculating => 'Calculating... (de)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (de)';

  @override
  String get free => 'Free (de)';

  @override
  String get used => 'Used (de)';

  @override
  String get total => 'Total (de)';

  @override
  String get phaseDisk => 'Disk (de)';

  @override
  String get phasePhotos => 'Photos (de)';

  @override
  String get phaseVideos => 'Videos (de)';

  @override
  String get phaseAudio => 'Audio (de)';

  @override
  String get phaseDocuments => 'Documents (de)';

  @override
  String get phaseJunk => 'Junk Files (de)';

  @override
  String get phaseFolders => 'Folders (de)';

  @override
  String get phaseApks => 'APKs (de)';

  @override
  String get phaseSimilar => 'Similar Photos (de)';

  @override
  String get phaseStorage => 'Storage (de)';

  @override
  String totalSize(String size) {
    return '$size Total (de)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (de)';
  }

  @override
  String get largeFilesTitle => 'Large Files (de)';

  @override
  String get selectYourLanguage => 'Select Your Language (de)';

  @override
  String get analyzingLabel => 'Analysieren...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count Elemente';
  }
}

/// The translations for German, as used in Germany (`de_DE`).
class AppLocalizationsDeDe extends AppLocalizationsDe {
  AppLocalizationsDeDe() : super('de_DE');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get cleanupTitle => 'Bereinigen';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Dateien';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get themeTitle => 'Design';

  @override
  String get systemTheme => 'Systemstandard';

  @override
  String get lightTheme => 'Hell';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String get storageAccessRequired => 'Speicherzugriff Erforderlich';

  @override
  String get storageAccessDesc =>
      'Clear Space benötigt \"Zugriff auf alle Dateien\", um Ihr Gerät auf Duplikate, große Dateien und Datenmüll zu überprüfen.\n\nSie werden zu den Systemeinstellungen weitergeleitet, um diese Berechtigung zu erteilen, wenn Sie auf Berechtigung erteilen tippen.';

  @override
  String get grantPermission => 'Berechtigung erteilen';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get next => 'Weiter';

  @override
  String get continueText => 'Fortfahren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get analyze => 'Analysieren';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get error => 'Fehler';

  @override
  String get success => 'Erfolg';

  @override
  String get noItemsFound => 'Keine Objekte gefunden';

  @override
  String itemsSelected(int count) {
    return '$count Objekte ausgewählt';
  }

  @override
  String get onboardingWelcome =>
      'Willkommen zur intelligentesten Lösung, Ihr Gerät sauber, schnell und sicher zu halten.';

  @override
  String get onboardingFeaturesTitle => 'Leistungsstarke Funktionen';

  @override
  String get onboardingFeaturesDesc =>
      'Alles, was Sie für eine effiziente Speicherverwaltung benötigen.';

  @override
  String get feature1Title => 'Verstehen Sie Ihren Speicher';

  @override
  String get feature1Desc =>
      'Erhalten Sie eine klare visuelle Übersicht darüber, was Platz beansprucht.';

  @override
  String get feature2Title => 'Sicheres Bereinigen';

  @override
  String get feature2Desc =>
      'Entfernen Sie unnötige Dateien mit sicheren Löschprotokollen.';

  @override
  String get feature3Title => 'Speicherplatz freigeben';

  @override
  String get feature3Desc =>
      'Finden und entfernen Sie Datenmüll, große Dateien und Duplikate sofort.';

  @override
  String get termsDesc =>
      'Indem Sie fortfahren, stimmen Sie unseren Nutzungsbedingungen und Datenschutzrichtlinien zu.';

  @override
  String get selectLanguage => 'Wählen Sie Ihre Sprache';

  @override
  String get changeLaterInSettings =>
      'Sie können dies später in den Einstellungen ändern.';

  @override
  String get photosAndImages => 'Fotos & Bilder';

  @override
  String get videos => 'Videos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Dokumente & Dateien';

  @override
  String get systemAndApps => 'System & Apps';

  @override
  String get other => 'SONSTIGES';

  @override
  String get review => 'Überprüfen';

  @override
  String get viewDetails => 'Details ansehen';

  @override
  String get smartCleanupPlan => 'Intelligenter Bereinigungsplan';

  @override
  String get analyzingSafeToDelete =>
      'Analysiere sicher zu löschende Dateien...';

  @override
  String get returnToDashboard => 'Zurück zum Dashboard';

  @override
  String get returnDirectlyToDashboard => 'Direkt zum Dashboard zurückkehren';

  @override
  String get appearanceAndLanguage => 'Darstellung & Sprache';

  @override
  String get supportAndEngagement => 'Support & Engagement';

  @override
  String get scanPreferences => 'Scan-Einstellungen';

  @override
  String get legalAndAppInfo => 'Rechtliches & App-Info';

  @override
  String get cleanupHistory => 'Bereinigungsverlauf';

  @override
  String get viewPastCleaning =>
      'Sehen Sie sich Ihre vergangenen Bereinigungsaktivitäten an';

  @override
  String get sendFeedback => 'Feedback senden';

  @override
  String get reportBugs => 'Fehler melden oder Verbesserungen vorschlagen';

  @override
  String get rateUs => 'Bewerten Sie uns mit 5 Sternen';

  @override
  String get helpOthers => 'Helfen Sie anderen, Clear Space zu finden';

  @override
  String get shareWithFriends => 'Mit Freunden teilen';

  @override
  String get recommendApp => 'App über Nachrichten empfehlen';

  @override
  String get similarPhotoSensitivity => 'Empfindlichkeit für ähnliche Fotos';

  @override
  String get largeFileThreshold => 'Schwellenwert für große Dateien';

  @override
  String get strict => 'Strikt';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Locker';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get howWeProtectData => 'Wie wir Ihre Daten schützen';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get rulesAndGuidelines => 'Regeln und Richtlinien';

  @override
  String get appVersion => 'App-Version';

  @override
  String get emailRestricted => 'E-Mail-Funktion durch Gerät eingeschränkt.';

  @override
  String get browserLaunchFailed => 'Browser konnte nicht gestartet werden.';

  @override
  String get storeUnavailable => 'Store-Service vorübergehend nicht verfügbar.';

  @override
  String get browserRestricted =>
      'Browserzugriff auf diesem Gerät eingeschränkt.';

  @override
  String get shareUnavailable => 'Freigabefunktion nicht verfügbar.';

  @override
  String get keepPhoneClean => 'Halten Sie Ihr Telefon sauber mit Clear Space';

  @override
  String get duplicateFiles => 'Doppelte Dateien';

  @override
  String get findIdenticalFiles =>
      'Finden und entfernen Sie identische Dateien';

  @override
  String get similarPhotos => 'Ähnliche Fotos';

  @override
  String get findKeyMoments => 'Fotohöhepunkte finden';

  @override
  String get largeFiles => 'Große Dateien';

  @override
  String filesLargerThan(String size) {
    return 'Dateien größer als $size';
  }

  @override
  String get screenshots => 'Screenshots';

  @override
  String get findAndDeleteScreenshots => 'Screenshots finden und löschen';

  @override
  String get downloads => 'Downloads';

  @override
  String get manageDownloadedFiles =>
      'Verwalten Sie Ihre heruntergeladenen Dateien';

  @override
  String get tempAndLogFiles => 'Temporäre & Protokolldateien';

  @override
  String sizeFound(String size) {
    return '$size gefunden';
  }

  @override
  String get emptyFolders => 'Leere Ordner';

  @override
  String emptyFoldersFound(int count) {
    return '$count leere Ordner gefunden';
  }

  @override
  String get safeApkInstallers => 'Sichere APK-Installationsprogramme';

  @override
  String get cleanOldApks => 'Installierte/alte APKs bereinigen';

  @override
  String get pleaseScanStorageFirst => 'Bitte scannen Sie zuerst den Speicher';

  @override
  String get noJunkFilesFound => 'Kein Datenmüll gefunden!';

  @override
  String get cleanupComplete => 'Bereinigung abgeschlossen!';

  @override
  String cleanupFailed(String error) {
    return 'Bereinigung fehlgeschlagen: $error';
  }

  @override
  String get selectAll => 'Alle Auswählen';

  @override
  String get noLargeFilesFound => 'Keine großen Dateien gefunden!';

  @override
  String get noDuplicatesFound => 'Keine Duplikate gefunden!';

  @override
  String get delete => 'Löschen';

  @override
  String get confirmation => 'Bestätigung';

  @override
  String get deleteFilesQuestion => 'Dateien löschen?';

  @override
  String deleteCountScreenshots(int count) {
    return '$count Screenshots dauerhaft löschen?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Screenshots erfolgreich gelöscht';

  @override
  String get junkFilesFound => 'Junk Files Found (de_DE)';

  @override
  String get noPhotosFound => 'Keine Fotos gefunden';

  @override
  String errorLoadingPhotos(String error) {
    return 'Fehler beim Laden der Fotos: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Löschen fehlgeschlagen: $error';
  }

  @override
  String get contacts => 'Kontakte';

  @override
  String get contactsNotImplemented => 'Kontaktliste nicht implementiert';

  @override
  String get smartSelect => 'Intelligente Auswahl';

  @override
  String get junkFiles => 'Datenmüll';

  @override
  String potentialSize(String size) {
    return '$size potenziell';
  }

  @override
  String get noFilesMatchFilter => 'Keine Dateien entsprechen diesem Filter';

  @override
  String get refreshingAppList => 'Refreshing app list... (de_DE)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (de_DE)';

  @override
  String get uninstallApp => 'Uninstall App (de_DE)';

  @override
  String get uninstall => 'Uninstall (de_DE)';

  @override
  String get sortLargest => 'Largest (de_DE)';

  @override
  String get sortSmallest => 'Smallest (de_DE)';

  @override
  String get sortNewest => 'Newest (de_DE)';

  @override
  String get sortAZ => 'A-Z (de_DE)';

  @override
  String get pageNotFound => 'Page Not Found (de_DE)';

  @override
  String get goToDashboard => 'Go to Dashboard (de_DE)';

  @override
  String get deleteFilesTitle => 'Delete Files (de_DE)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (de_DE)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (de_DE)';

  @override
  String get tryAgain => 'Try Again (de_DE)';

  @override
  String get appManagerTitle => 'App Manager (de_DE)';

  @override
  String get searchApps => 'Search apps... (de_DE)';

  @override
  String get noAppsFound => 'No apps found (de_DE)';

  @override
  String get noMatchingApps => 'No matching apps (de_DE)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (de_DE)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (de_DE)';

  @override
  String appsCount(int count) {
    return '$count apps (de_DE)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (de_DE)';
  }

  @override
  String get allClean => 'All clean! (de_DE)';

  @override
  String get deleting => 'Deleting... (de_DE)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (de_DE)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (de_DE)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (de_DE)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (de_DE)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (de_DE)';

  @override
  String get cleaning => 'Cleaning... (de_DE)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (de_DE)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (de_DE)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (de_DE)';

  @override
  String get noSmartCleanupItems =>
      'No duplicate or similar files found. (de_DE)';

  @override
  String get save => 'Save (de_DE)';

  @override
  String get keep => 'KEEP (de_DE)';

  @override
  String get deselectAll => 'Deselect All (de_DE)';

  @override
  String get images => 'Images (de_DE)';

  @override
  String get docs => 'Docs (de_DE)';

  @override
  String get others => 'Others (de_DE)';

  @override
  String get all => 'All (de_DE)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (de_DE)';
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
    return '$_temp0 (de_DE)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (de_DE)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (de_DE)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (de_DE)';

  @override
  String get systemDefault => 'System Default (de_DE)';

  @override
  String get light => 'Light (de_DE)';

  @override
  String get dark => 'Dark (de_DE)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (de_DE)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (de_DE)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (de_DE)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (de_DE)';

  @override
  String get strictSensitivityDesc =>
      '95% Match — Nearly identical only (de_DE)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (de_DE)';

  @override
  String get looseSensitivityDesc =>
      '75% Match — Catches more variations (de_DE)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (de_DE)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (de_DE)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (de_DE)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (de_DE)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (de_DE)';

  @override
  String get versionUnavailable => 'Version unavailable (de_DE)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (de_DE)';

  @override
  String get clearSpace => 'Clear Space (de_DE)';

  @override
  String get storageDashboard => 'Storage Dashboard (de_DE)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (de_DE)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (de_DE)';

  @override
  String get cleanup => 'Cleanup (de_DE)';

  @override
  String get suggestions => 'Suggestions (de_DE)';

  @override
  String get analyzing => 'Analyzing... (de_DE)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (de_DE)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (de_DE)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (de_DE)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (de_DE)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (de_DE)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (de_DE)';
  }

  @override
  String get calculating => 'Calculating... (de_DE)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (de_DE)';

  @override
  String get free => 'Free (de_DE)';

  @override
  String get used => 'Used (de_DE)';

  @override
  String get total => 'Total (de_DE)';

  @override
  String get phaseDisk => 'Disk (de_DE)';

  @override
  String get phasePhotos => 'Photos (de_DE)';

  @override
  String get phaseVideos => 'Videos (de_DE)';

  @override
  String get phaseAudio => 'Audio (de_DE)';

  @override
  String get phaseDocuments => 'Documents (de_DE)';

  @override
  String get phaseJunk => 'Junk Files (de_DE)';

  @override
  String get phaseFolders => 'Folders (de_DE)';

  @override
  String get phaseApks => 'APKs (de_DE)';

  @override
  String get phaseSimilar => 'Similar Photos (de_DE)';

  @override
  String get phaseStorage => 'Storage (de_DE)';

  @override
  String totalSize(String size) {
    return '$size Total (de_DE)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (de_DE)';
  }

  @override
  String get largeFilesTitle => 'Large Files (de_DE)';

  @override
  String get selectYourLanguage => 'Select Your Language (de_DE)';
}
