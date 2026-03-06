// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Accueil';

  @override
  String get cleanupTitle => 'Nettoyage';

  @override
  String get photosTitle => 'Photos';

  @override
  String get filesTitle => 'Fichiers';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get languageTitle => 'Langue';

  @override
  String get themeTitle => 'Thème';

  @override
  String get systemTheme => 'Auto';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get storageAccessRequired => 'Accès requis';

  @override
  String get storageAccessDesc =>
      'Clear Space a besoin de \"l\'accès à tous les fichiers\" pour analyser votre appareil à la recherche de doublons, de fichiers volumineux et de fichiers indésirables.\n\nVous serez redirigé vers les paramètres du système pour accorder cette autorisation.';

  @override
  String get grantPermission => 'Accorder';

  @override
  String get getStarted => 'Commencer';

  @override
  String get next => 'Suivant';

  @override
  String get continueText => 'Continuer';

  @override
  String get cancel => 'Annuler';

  @override
  String get analyze => 'Analyser';

  @override
  String get loading => 'Chargement...';

  @override
  String get error => 'Erreur';

  @override
  String get success => 'Succès';

  @override
  String get noItemsFound => 'Aucun fichier';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '1 élément',
      zero: '0 élément',
    );
    return '$_temp0 sélectionnés';
  }

  @override
  String get onboardingWelcome =>
      'Le moyen le plus intelligent de garder votre appareil propre et rapide.';

  @override
  String get onboardingFeaturesTitle => 'Fonctionnalités puissantes';

  @override
  String get onboardingFeaturesDesc =>
      'Tout ce dont vous avez besoin pour gérer votre espace de stockage.';

  @override
  String get feature1Title => 'Comprendre votre stockage';

  @override
  String get feature1Desc =>
      'Répartition visuelle claire de ce qui prend de la place.';

  @override
  String get feature2Title => 'Nettoyer en toute sécurité';

  @override
  String get feature2Desc =>
      'Supprimez les fichiers inutiles de manière sécurisée.';

  @override
  String get feature3Title => 'Libérer de l\'espace';

  @override
  String get feature3Desc =>
      'Trouvez et supprimez instantanément les fichiers indésirables.';

  @override
  String get termsDesc =>
      'En continuant, vous acceptez nos conditions d\'utilisation.';
}
