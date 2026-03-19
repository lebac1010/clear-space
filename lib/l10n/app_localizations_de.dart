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
      'Der Speicherzugriff wurde verweigert. Bitte aktiviere ihn in den Einstellungen, um fortzufahren.';

  @override
  String get permissionMediaTitle => 'Fotos, Videos und Audio';

  @override
  String get permissionMediaDesc =>
      'Wird verwendet, um doppelte Dateien, ähnliche Fotos, Screenshots, Downloads und große Mediendateien auf deinem Gerät zu finden.';

  @override
  String get permissionAllFilesTitle => 'Zugriff auf alle Dateien';

  @override
  String get permissionAllFilesDesc =>
      'Wird für Nicht-Medien-Bereinigungen wie Junk-Dateien, APK-Prüfung, Download-Prüfung und leere Ordner verwendet.';

  @override
  String get permissionInstalledAppsTitle => 'Installierte Apps';

  @override
  String get permissionInstalledAppsDesc =>
      'Wird vom App-Manager verwendet, um über den Launcher sichtbare installierte Apps anzuzeigen und die Android-Deinstallationsbestätigung zu öffnen.';

  @override
  String get permissionVisibleProgressTitle => 'Sichtbarer Fortschritt';

  @override
  String get permissionVisibleProgressDesc =>
      'Wird verwendet, um den Fortschritt beim Scannen oder Bereinigen während einer vom Nutzer gestarteten Aufgabe sichtbar zu halten.';

  @override
  String get permissionOnDeviceNote =>
      'Scan- und Bereinigungsanalysen bleiben auf deinem Gerät. Clear Space lädt deine Dateien für diese Funktionen nicht auf einen Entwickler-Server hoch.';

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get grantPermission => 'Erlauben';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get skip => 'Überspringen';

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
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get changeLaterInSettings =>
      'Du kannst dies später in den Einstellungen ändern.';

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
  String get other => 'ANDERE';

  @override
  String get review => 'Überprüfen';

  @override
  String get viewDetails => 'Details anzeigen';

  @override
  String get smartCleanupPlan => 'Intelligenter Bereinigungsplan';

  @override
  String get analyzingSafeToDelete =>
      'Sicher löschbare Dateien werden analysiert...';

  @override
  String get returnToDashboard => 'Zum Dashboard zurückkehren';

  @override
  String get returnDirectlyToDashboard => 'Direkt zum Dashboard zurückkehren';

  @override
  String get appearanceAndLanguage => 'Darstellung & Sprache';

  @override
  String get supportAndEngagement => 'Support & Interaktion';

  @override
  String get scanPreferences => 'Scan-Einstellungen';

  @override
  String get legalAndAppInfo => 'Rechtliches & App-Info';

  @override
  String get cleanupHistory => 'Bereinigungsverlauf';

  @override
  String get viewPastCleaning => 'Deine bisherigen Bereinigungen ansehen';

  @override
  String get sendFeedback => 'Feedback senden';

  @override
  String get reportBugs => 'Fehler melden oder Verbesserungen vorschlagen';

  @override
  String get rateUs => 'Bewerte uns mit 5 Sternen';

  @override
  String get helpOthers => 'Hilf anderen, Clear Space zu finden';

  @override
  String get shareWithFriends => 'Mit Freunden teilen';

  @override
  String get recommendApp => 'Die App per Nachricht empfehlen';

  @override
  String get similarPhotoSensitivity => 'Empfindlichkeit für ähnliche Fotos';

  @override
  String get largeFileThreshold => 'Grenzwert für große Dateien';

  @override
  String get strict => 'Streng';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Locker';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get howWeProtectData => 'Wie wir deine Daten schützen';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get rulesAndGuidelines => 'Regeln und Richtlinien';

  @override
  String get appVersion => 'App-Version';

  @override
  String get emailRestricted =>
      'E-Mail-Funktion auf diesem Gerät eingeschränkt.';

  @override
  String get browserLaunchFailed => 'Browser konnte nicht geöffnet werden.';

  @override
  String get storeUnavailable => 'Store-Dienst vorübergehend nicht verfügbar.';

  @override
  String get browserRestricted =>
      'Browserzugriff auf diesem Gerät eingeschränkt.';

  @override
  String get shareUnavailable => 'Teilen-Funktion nicht verfügbar.';

  @override
  String get keepPhoneClean => 'Halte dein Handy mit Clear Space sauber';

  @override
  String get duplicateFiles => 'Doppelte Dateien';

  @override
  String get findIdenticalFiles => 'Identische Dateien finden und entfernen';

  @override
  String get similarPhotos => 'Ähnliche Fotos';

  @override
  String get findKeyMoments => 'Wichtige Fotomomente finden';

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
      'Deine heruntergeladenen Dateien verwalten';

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
  String get safeApkInstallers => 'Sichere APK-Installationsdateien';

  @override
  String get cleanOldApks => 'Installierte/alte APKs bereinigen';

  @override
  String get pleaseScanStorageFirst => 'Bitte zuerst den Speicher scannen';

  @override
  String get noJunkFilesFound => 'Keine Junk-Dateien gefunden!';

  @override
  String get cleanupComplete => 'Bereinigung abgeschlossen!';

  @override
  String cleanupFailed(String error) {
    return 'Bereinigung fehlgeschlagen: $error';
  }

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String get noLargeFilesFound => 'Keine großen Dateien gefunden!';

  @override
  String get noDuplicatesFound => 'Keine Duplikate gefunden!';

  @override
  String get delete => 'Löschen';

  @override
  String get confirmation => 'Bestätigung';

  @override
  String get clearHistory => 'Verlauf löschen';

  @override
  String get clearHistoryConfirm =>
      'Möchtest du wirklich alle Bereinigungsprotokolle löschen?';

  @override
  String get clearAll => 'Alles löschen';

  @override
  String get cleanAllSafeItems => 'Alle sicheren Elemente bereinigen';

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
  String get junkFiles => 'Junk-Dateien';

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
  String get smartCleanupPlanTitle => 'Intelligenter Bereinigungsplan';

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
  String get duplicates => 'Duplikate';

  @override
  String get similar => 'Ähnlich';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen';

  @override
  String get pageNotFoundDesc => 'Die gesuchte Seite existiert nicht.';

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
  String get youreAllSet => 'Alles erledigt!';

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
    return 'Möchten Sie $count ausgewählte Dateien wirklich löschen?\n\nElemente werden, wenn unterstützt, in den Papierkorb verschoben oder dauerhaft gelöscht.';
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
  String get strictSensitivity => 'Streng (95 % Übereinstimmung)';

  @override
  String get normalSensitivity => 'Normal (85 % Übereinstimmung)';

  @override
  String get looseSensitivity => 'Locker (75 % Übereinstimmung)';

  @override
  String get sensitivityDesc =>
      'Wie streng ähnliche Fotos identifiziert werden sollen.';

  @override
  String get strictSensitivityDesc =>
      '95 % Übereinstimmung — Nur nahezu identische Fotos';

  @override
  String get normalSensitivityDesc => '85 % Übereinstimmung — Empfohlen';

  @override
  String get looseSensitivityDesc =>
      '75 % Übereinstimmung — Erfasst mehr Varianten';

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
  String get madeWithHeart => 'Mit ❤ für ein saubereres Handy gemacht';

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
