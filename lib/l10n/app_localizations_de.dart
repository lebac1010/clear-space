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
  String get storagePermissionDeniedDesc =>
      'Storage permission was denied. Please enable it in Settings to continue.';

  @override
  String get permissionMediaTitle => 'Photos, videos, and audio';

  @override
  String get permissionMediaDesc =>
      'Used to find duplicate files, similar photos, screenshots, downloads, and large media stored on your device.';

  @override
  String get permissionAllFilesTitle => 'All files access';

  @override
  String get permissionAllFilesDesc =>
      'Used for non-media cleanup features such as junk files, APK review, download review, and empty folders.';

  @override
  String get permissionInstalledAppsTitle => 'Installed apps';

  @override
  String get permissionInstalledAppsDesc =>
      'Used by App Manager to show launcher-visible installed apps and open Android uninstall confirmation when you choose.';

  @override
  String get permissionVisibleProgressTitle => 'Visible progress';

  @override
  String get permissionVisibleProgressDesc =>
      'Used to keep scan or cleanup progress visible while a user-initiated task is running.';

  @override
  String get permissionOnDeviceNote =>
      'Scanning and cleanup analysis stay on your device. Clear Space does not upload your files to a developer server for these features.';

  @override
  String get openSettings => 'Open Settings';

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
  String get junkFilesFound => 'Junk-Dateien gefunden';

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
  String get refreshingAppList => 'Aktualisiere App-Liste...';

  @override
  String get openingUninstaller => 'Öffne Deinstallationsprogramm...';

  @override
  String get uninstallApp => 'App deinstallieren';

  @override
  String get uninstall => 'Deinstallieren';

  @override
  String get sortLargest => 'Größte';

  @override
  String get sortSmallest => 'Kleinste';

  @override
  String get sortNewest => 'Neueste';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Seite nicht gefunden';

  @override
  String get goToDashboard => 'Zum Dashboard';

  @override
  String get deleteFilesTitle => 'Dateien löschen';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan';

  @override
  String get screenshotsCleanerTitle => 'Screenshot-Reiniger';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get appManagerTitle => 'App-Manager';

  @override
  String get searchApps => 'Apps suchen...';

  @override
  String get noAppsFound => 'Keine Apps gefunden';

  @override
  String get noMatchingApps => 'Keine Treffer';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Möchten Sie \"$appName\" ($size) wirklich deinstallieren?';
  }

  @override
  String get uninstallActionDesc => 'App und alle Daten werden entfernt.';

  @override
  String appsCount(int count) {
    return '$count Apps';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total Apps';
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
  String get allClean => 'Alles sauber!';

  @override
  String get deleting => 'Lösche...';

  @override
  String deleteItemsCount(int count, String size) {
    return '$count Elemente löschen ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count Elemente gelöscht ($size)';
  }

  @override
  String get actionCannotBeUndone =>
      'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get cleanupBreakdown => 'Zusammenfassung';

  @override
  String get smartCleanupDesc => 'Beste Version wird automatisch behalten.';

  @override
  String get cleaning => 'Wird gereinigt...';

  @override
  String cleanUpSize(String size) {
    return '$size reinigen';
  }

  @override
  String youSavedSize(String size) {
    return 'Sie haben $size gespart';
  }

  @override
  String get youreAllSet => 'Alles bereit!';

  @override
  String get noSmartCleanupItems => 'Keine Duplikate gefunden.';

  @override
  String get save => 'Speichern';

  @override
  String get keep => 'BEHALTEN';

  @override
  String get deselectAll => 'Alle abwählen';

  @override
  String get images => 'Bilder';

  @override
  String get docs => 'Dokumente';

  @override
  String get others => 'Andere';

  @override
  String get all => 'Alle';

  @override
  String deleteConfirmMsg(int count) {
    return 'Möchten Sie $count Elemente wirklich löschen?';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Screenshots',
      one: '1 Screenshot',
      zero: 'Keine Screenshots',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Ausgewählt: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Auswahl löschen ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Löschen fehlgeschlagen.';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get strictSensitivity => 'Streng (95% Übereinstimmung)';

  @override
  String get normalSensitivity => 'Normal (85% Übereinstimmung)';

  @override
  String get looseSensitivity => 'Locker (75% Übereinstimmung)';

  @override
  String get sensitivityDesc =>
      'Wie streng ähnliche Fotos identifiziert werden sollen.';

  @override
  String get strictSensitivityDesc => 'Nur nahezu identisch';

  @override
  String get normalSensitivityDesc => 'Empfohlen';

  @override
  String get looseSensitivityDesc => 'Erfasst mehr Variationen';

  @override
  String get sensitivityUpdated => 'Empfindlichkeit aktualisiert.';

  @override
  String get thresholdDesc => 'Dateien über diesem Wert werden markiert.';

  @override
  String get thresholdUpdated => 'Schwellenwert aktualisiert.';

  @override
  String largerThanSize(String size) {
    return 'Größer als $size';
  }

  @override
  String get madeWithHeart => 'Gemacht mit ❤️ für ein sauberes Telefon';

  @override
  String get versionUnavailable => 'Version unerreichbar';

  @override
  String get emailNotSupported => 'E-Mail konnte nicht geöffnet werden.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Speicher-Dashboard';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count Elemente reinigbar';
  }

  @override
  String get storageBreakdown => 'Speichernutzung';

  @override
  String get cleanup => 'Reinigung';

  @override
  String get suggestions => 'Vorschläge';

  @override
  String get analyzing => 'Analysieren...';

  @override
  String get keepStorageHealthy => 'Speicher gesund halten';

  @override
  String get cleanupHeaderDesc => 'Gefundene Dateien zum Löschen.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% genutzt';
  }

  @override
  String get scanPausedBattery => 'Pause (Batterie schwach)';

  @override
  String scanningPhase(String phase) {
    return 'Prüfe $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Prüfe $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Berechne...';

  @override
  String get internalStorage => 'INTERNER SPEICHER';

  @override
  String get free => 'Frei';

  @override
  String get used => 'Belegt';

  @override
  String get total => 'Gesamt';

  @override
  String get phaseDisk => 'Festplatte';

  @override
  String get phasePhotos => 'Fotos';

  @override
  String get phaseVideos => 'Videos';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Dokumente';

  @override
  String get phaseJunk => 'Junk-Dateien';

  @override
  String get phaseFolders => 'Ordner';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Ähnliche Fotos';

  @override
  String get phaseStorage => 'Speicher';

  @override
  String totalSize(String size) {
    return '$size total';
  }

  @override
  String usedSize(String size) {
    return '$size belegt';
  }

  @override
  String get largeFilesTitle => 'Große Dateien';

  @override
  String get selectYourLanguage => 'Sprache wählen';

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
  String get junkFilesFound => 'Junk-Dateien gefunden';

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
  String get refreshingAppList => 'Aktualisiere App-Liste...';

  @override
  String get openingUninstaller => 'Öffne Deinstallationsprogramm...';

  @override
  String get uninstallApp => 'App deinstallieren';

  @override
  String get uninstall => 'Deinstallieren';

  @override
  String get sortLargest => 'Größte';

  @override
  String get sortSmallest => 'Kleinste';

  @override
  String get sortNewest => 'Neueste';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Seite nicht gefunden';

  @override
  String get goToDashboard => 'Zum Dashboard';

  @override
  String get deleteFilesTitle => 'Dateien löschen';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan';

  @override
  String get screenshotsCleanerTitle => 'Screenshot-Reiniger';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get appManagerTitle => 'App-Manager';

  @override
  String get searchApps => 'Apps suchen...';

  @override
  String get noAppsFound => 'Keine Apps gefunden';

  @override
  String get noMatchingApps => 'Keine Treffer';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Möchten Sie \"$appName\" ($size) wirklich deinstallieren?';
  }

  @override
  String get uninstallActionDesc => 'App und alle Daten werden entfernt.';

  @override
  String appsCount(int count) {
    return '$count Apps';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total Apps';
  }

  @override
  String get allClean => 'Alles sauber!';

  @override
  String get deleting => 'Lösche...';

  @override
  String deleteItemsCount(int count, String size) {
    return '$count Elemente löschen ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count Elemente gelöscht ($size)';
  }

  @override
  String get actionCannotBeUndone =>
      'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get cleanupBreakdown => 'Zusammenfassung';

  @override
  String get smartCleanupDesc => 'Beste Version wird automatisch behalten.';

  @override
  String get cleaning => 'Wird gereinigt...';

  @override
  String cleanUpSize(String size) {
    return '$size reinigen';
  }

  @override
  String youSavedSize(String size) {
    return 'Sie haben $size gespart';
  }

  @override
  String get youreAllSet => 'Alles bereit!';

  @override
  String get noSmartCleanupItems => 'Keine Duplikate gefunden.';

  @override
  String get save => 'Speichern';

  @override
  String get keep => 'BEHALTEN';

  @override
  String get deselectAll => 'Alle abwählen';

  @override
  String get images => 'Bilder';

  @override
  String get docs => 'Dokumente';

  @override
  String get others => 'Andere';

  @override
  String get all => 'Alle';

  @override
  String deleteConfirmMsg(int count) {
    return 'Möchten Sie $count Elemente wirklich löschen?';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Screenshots',
      one: '1 Screenshot',
      zero: 'Keine Screenshots',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Ausgewählt: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Auswahl löschen ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Löschen fehlgeschlagen.';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get strictSensitivity => 'Streng (95% Übereinstimmung)';

  @override
  String get normalSensitivity => 'Normal (85% Übereinstimmung)';

  @override
  String get looseSensitivity => 'Locker (75% Übereinstimmung)';

  @override
  String get sensitivityDesc =>
      'Wie streng ähnliche Fotos identifiziert werden sollen.';

  @override
  String get strictSensitivityDesc => 'Nur nahezu identisch';

  @override
  String get normalSensitivityDesc => 'Empfohlen';

  @override
  String get looseSensitivityDesc => 'Erfasst mehr Variationen';

  @override
  String get sensitivityUpdated => 'Empfindlichkeit aktualisiert.';

  @override
  String get thresholdDesc => 'Dateien über diesem Wert werden markiert.';

  @override
  String get thresholdUpdated => 'Schwellenwert aktualisiert.';

  @override
  String largerThanSize(String size) {
    return 'Größer als $size';
  }

  @override
  String get madeWithHeart => 'Gemacht mit ❤️ für ein sauberes Telefon';

  @override
  String get versionUnavailable => 'Version unerreichbar';

  @override
  String get emailNotSupported => 'E-Mail konnte nicht geöffnet werden.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Speicher-Dashboard';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count Elemente reinigbar';
  }

  @override
  String get storageBreakdown => 'Speichernutzung';

  @override
  String get cleanup => 'Reinigung';

  @override
  String get suggestions => 'Vorschläge';

  @override
  String get analyzing => 'Analysieren...';

  @override
  String get keepStorageHealthy => 'Speicher gesund halten';

  @override
  String get cleanupHeaderDesc => 'Gefundene Dateien zum Löschen.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% genutzt';
  }

  @override
  String get scanPausedBattery => 'Pause (Batterie schwach)';

  @override
  String scanningPhase(String phase) {
    return 'Prüfe $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Prüfe $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Berechne...';

  @override
  String get internalStorage => 'INTERNER SPEICHER';

  @override
  String get free => 'Frei';

  @override
  String get used => 'Belegt';

  @override
  String get total => 'Gesamt';

  @override
  String get phaseDisk => 'Festplatte';

  @override
  String get phasePhotos => 'Fotos';

  @override
  String get phaseVideos => 'Videos';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Dokumente';

  @override
  String get phaseJunk => 'Junk-Dateien';

  @override
  String get phaseFolders => 'Ordner';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Ähnliche Fotos';

  @override
  String get phaseStorage => 'Speicher';

  @override
  String totalSize(String size) {
    return '$size total';
  }

  @override
  String usedSize(String size) {
    return '$size belegt';
  }

  @override
  String get largeFilesTitle => 'Große Dateien';

  @override
  String get selectYourLanguage => 'Sprache wählen';
}
