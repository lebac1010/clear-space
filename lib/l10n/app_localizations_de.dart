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
}
