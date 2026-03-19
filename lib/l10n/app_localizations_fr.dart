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
  String get storagePermissionDeniedDesc =>
      'L\'autorisation de stockage a été refusée. Veuillez l\'activer dans les Paramètres pour continuer.';

  @override
  String get permissionMediaTitle => 'Photos, vidéos et audio';

  @override
  String get permissionMediaDesc =>
      'Utilisé pour trouver les doublons, les photos similaires, les captures d\'écran, les téléchargements et les fichiers volumineux sur votre appareil.';

  @override
  String get permissionAllFilesTitle => 'Accès à tous les fichiers';

  @override
  String get permissionAllFilesDesc =>
      'Utilisé pour les fonctionnalités de nettoyage non-médias telles que les fichiers indésirables, les APK, les téléchargements et les dossiers vides.';

  @override
  String get permissionInstalledAppsTitle => 'Applications installées';

  @override
  String get permissionInstalledAppsDesc =>
      'Utilisé par le Gestionnaire d\'applications pour afficher les applications installées et ouvrir la confirmation de désinstallation Android.';

  @override
  String get permissionVisibleProgressTitle => 'Progression visible';

  @override
  String get permissionVisibleProgressDesc =>
      'Utilisé pour garder visible la progression de l\'analyse ou du nettoyage pendant une tâche lancée par l\'utilisateur.';

  @override
  String get permissionOnDeviceNote =>
      'L\'analyse et le nettoyage restent sur votre appareil. Clear Space n\'envoie pas vos fichiers sur un serveur distant pour ces fonctions.';

  @override
  String get openSettings => 'Ouvrir les Paramètres';

  @override
  String get grantPermission => 'Accorder';

  @override
  String get getStarted => 'Commencer';

  @override
  String get skip => 'Passer';

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

  @override
  String get selectLanguage => 'Choisir votre langue';

  @override
  String get changeLaterInSettings =>
      'Vous pourrez changer cela plus tard dans les Paramètres.';

  @override
  String get photosAndImages => 'Photos & Images';

  @override
  String get videos => 'Vidéos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Documents & Fichiers';

  @override
  String get systemAndApps => 'Système & Apps';

  @override
  String get other => 'AUTRE';

  @override
  String get review => 'Revoir';

  @override
  String get viewDetails => 'Voir les détails';

  @override
  String get smartCleanupPlan => 'Plan de nettoyage intelligent';

  @override
  String get analyzingSafeToDelete =>
      'Analyse des fichiers pouvant être supprimés...';

  @override
  String get returnToDashboard => 'Retour à l\'accueil';

  @override
  String get returnDirectlyToDashboard => 'Retourner directement à l\'accueil';

  @override
  String get appearanceAndLanguage => 'Apparence & Langue';

  @override
  String get supportAndEngagement => 'Support & Engagement';

  @override
  String get scanPreferences => 'Préférences d\'analyse';

  @override
  String get legalAndAppInfo => 'Mentions légales & Infos';

  @override
  String get cleanupHistory => 'Historique de nettoyage';

  @override
  String get viewPastCleaning => 'Voir vos activités de nettoyage passées';

  @override
  String get sendFeedback => 'Envoyer un avis';

  @override
  String get reportBugs => 'Signaler un bug ou proposer une idée';

  @override
  String get rateUs => 'Notez-nous 5 étoiles';

  @override
  String get helpOthers => 'Aidez d\'autres personnes à trouver Clear Space';

  @override
  String get shareWithFriends => 'Partager avec des amis';

  @override
  String get recommendApp => 'Recommander l\'application par message';

  @override
  String get similarPhotoSensitivity => 'Sensibilité des photos similaires';

  @override
  String get largeFileThreshold => 'Seuil des fichiers volumineux';

  @override
  String get strict => 'Strict';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Souple';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get howWeProtectData => 'Comment nous protégeons vos données';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get rulesAndGuidelines => 'Règles et directives';

  @override
  String get appVersion => 'Version de l\'application';

  @override
  String get emailRestricted =>
      'La fonctionnalité email est restreinte sur cet appareil.';

  @override
  String get browserLaunchFailed => 'Impossible de lancer le navigateur.';

  @override
  String get storeUnavailable =>
      'Le service du store est temporairement indisponible.';

  @override
  String get browserRestricted =>
      'L\'accès au navigateur est restreint sur cet appareil.';

  @override
  String get shareUnavailable => 'La fonction de partage est indisponible.';

  @override
  String get keepPhoneClean => 'Gardez votre téléphone propre avec Clear Space';

  @override
  String get duplicateFiles => 'Fichiers en double';

  @override
  String get findIdenticalFiles =>
      'Trouver et supprimer les fichiers identiques';

  @override
  String get similarPhotos => 'Photos similaires';

  @override
  String get findKeyMoments => 'Trouver les moments clés en photo';

  @override
  String get largeFiles => 'Gros fichiers';

  @override
  String filesLargerThan(String size) {
    return 'Fichiers de plus de $size';
  }

  @override
  String get screenshots => 'Captures d\'écran';

  @override
  String get findAndDeleteScreenshots => 'Trouver et supprimer les captures';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get manageDownloadedFiles => 'Gérer vos fichiers téléchargés';

  @override
  String get tempAndLogFiles => 'Fichiers temporaires & logs';

  @override
  String sizeFound(String size) {
    return '$size trouvés';
  }

  @override
  String get emptyFolders => 'Dossiers vides';

  @override
  String emptyFoldersFound(int count) {
    return '$count dossiers vides trouvés';
  }

  @override
  String get safeApkInstallers => 'Installateurs APK sûrs';

  @override
  String get cleanOldApks => 'Nettoyer les APK installés/anciens';

  @override
  String get pleaseScanStorageFirst => 'Veuillez d\'abord analyser le stockage';

  @override
  String get noJunkFilesFound => 'Aucun fichier indésirable trouvé !';

  @override
  String get cleanupComplete => 'Nettoyage terminé !';

  @override
  String cleanupFailed(String error) {
    return 'Échec du nettoyage : $error';
  }

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get noLargeFilesFound => 'Aucun gros fichier trouvé !';

  @override
  String get noDuplicatesFound => 'Aucun doublon trouvé !';

  @override
  String get delete => 'Supprimer';

  @override
  String get confirmation => 'Confirmation';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get clearHistoryConfirm =>
      'Voulez-vous vraiment effacer tous les logs de nettoyage ?';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get cleanAllSafeItems => 'Nettoyer tous les éléments sûrs';

  @override
  String get deleteFilesQuestion => 'Supprimer les fichiers ?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Supprimer définitivement $count captures ?';
  }

  @override
  String get screenshotsDeletedSuccess =>
      'Captures d\'écran supprimées avec succès';

  @override
  String get junkFilesFound => 'Fichiers résiduels trouvés';

  @override
  String get noPhotosFound => 'Aucune photo trouvée';

  @override
  String errorLoadingPhotos(String error) {
    return 'Erreur lors du chargement des photos : $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Échec de suppression : $error';
  }

  @override
  String get contacts => 'Contacts';

  @override
  String get contactsNotImplemented => 'Liste de contacts non implémentée';

  @override
  String get smartSelect => 'Sélection intelligente';

  @override
  String get junkFiles => 'Fichiers indésirables';

  @override
  String potentialSize(String size) {
    return '$size potentiel';
  }

  @override
  String get noFilesMatchFilter => 'Aucun fichier ne correspond à ce filtre';

  @override
  String get refreshingAppList => 'Actualisation...';

  @override
  String get openingUninstaller => 'Ouverture de la désinstallation...';

  @override
  String get uninstallApp => 'Désinstaller l\'application';

  @override
  String get uninstall => 'Désinstaller';

  @override
  String get sortLargest => 'Plus gros';

  @override
  String get sortSmallest => 'Plus petit';

  @override
  String get sortNewest => 'Plus récents';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Page introuvable';

  @override
  String get goToDashboard => 'Aller à l\'accueil';

  @override
  String get deleteFilesTitle => 'Supprimer les fichiers';

  @override
  String get smartCleanupPlanTitle => 'Plan de nettoyage intelligent';

  @override
  String get screenshotsCleanerTitle => 'Nettoyage des captures';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get appManagerTitle => 'Gestionnaire d\'applications';

  @override
  String get searchApps => 'Rechercher...';

  @override
  String get noAppsFound => 'Aucune application';

  @override
  String get noMatchingApps => 'Aucun résultat';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Voulez-vous désinstaller \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'L\'application et ses données seront supprimées.';

  @override
  String appsCount(int count) {
    return '$count applications';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total applications';
  }

  @override
  String get duplicates => 'Doublons';

  @override
  String get similar => 'Similaires';

  @override
  String get somethingWentWrong => 'Un problème est survenu';

  @override
  String get pageNotFoundDesc => 'La page demandée n\'existe pas.';

  @override
  String get allClean => 'Tout propre !';

  @override
  String get deleting => 'Suppression...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Supprimer $count éléments ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count éléments supprimés ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Cette action est irréversible.';

  @override
  String get cleanupBreakdown => 'Bilan de nettoyage';

  @override
  String get smartCleanupDesc =>
      'Nous gardons automatiquement la meilleure version de vos fichiers.';

  @override
  String get cleaning => 'Nettoyage...';

  @override
  String cleanUpSize(String size) {
    return 'Nettoyer $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Vous avez libéré $size';
  }

  @override
  String get youreAllSet => 'Tout est prêt !';

  @override
  String get noSmartCleanupItems => 'Aucun doublon trouvé.';

  @override
  String get save => 'Sauvegarder';

  @override
  String get keep => 'GARDER';

  @override
  String get deselectAll => 'Tout désélectionner';

  @override
  String get images => 'Images';

  @override
  String get docs => 'Docs';

  @override
  String get others => 'Autres';

  @override
  String get all => 'Tout';

  @override
  String deleteConfirmMsg(int count) {
    return 'Voulez-vous vraiment supprimer les fichiers sélectionnés ?';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count captures',
      one: '1 capture',
      zero: 'Aucune',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Sélection : $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Effacer la sélection ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Échec de suppression.';

  @override
  String get systemDefault => 'Système par défaut';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get strictSensitivity => 'Strict (Correspondance 95%)';

  @override
  String get normalSensitivity => 'Normal (Correspondance 85%)';

  @override
  String get looseSensitivity => 'Souple (Correspondance 75%)';

  @override
  String get sensitivityDesc =>
      'Choisissez comment les photos similaires sont identifiées.';

  @override
  String get strictSensitivityDesc => 'Seulement presque identiques';

  @override
  String get normalSensitivityDesc => 'Recommandé';

  @override
  String get looseSensitivityDesc => 'Variations plus larges';

  @override
  String get sensitivityUpdated => 'Paramètre de sensibilité mis à jour.';

  @override
  String get thresholdDesc => 'Fichiers plus grands que cette valeur ciblés.';

  @override
  String get thresholdUpdated => 'Seuil mis à jour.';

  @override
  String largerThanSize(String size) {
    return 'Supérieur à $size';
  }

  @override
  String get madeWithHeart => 'Fait avec ❤️ pour nettoyer votre mobile';

  @override
  String get versionUnavailable => 'Version non disponible';

  @override
  String get emailNotSupported => 'Action d\'email non supportée.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Tableau de Bord';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count fichiers à nettoyer';
  }

  @override
  String get storageBreakdown => 'Détail de l\'espace';

  @override
  String get cleanup => 'Nettoyage';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get analyzing => 'Analyse...';

  @override
  String get keepStorageHealthy => 'Gardez votre stockage à flot';

  @override
  String get cleanupHeaderDesc => 'Fichiers pouvant être supprimés.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Utilisé';
  }

  @override
  String get scanPausedBattery => 'Analyse Pause (Batterie)';

  @override
  String scanningPhase(String phase) {
    return 'Scanner $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanner $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Calcul...';

  @override
  String get internalStorage => 'STOCKAGE INTERNE';

  @override
  String get free => 'Libre';

  @override
  String get used => 'Utilisé';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disque';

  @override
  String get phasePhotos => 'Photos';

  @override
  String get phaseVideos => 'Vidéos';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Documents';

  @override
  String get phaseJunk => 'Résiduels';

  @override
  String get phaseFolders => 'Dossiers';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Similaires';

  @override
  String get phaseStorage => 'Espace';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Utilisé';
  }

  @override
  String get largeFilesTitle => 'Fichiers Volumineux';

  @override
  String get selectYourLanguage => 'Sélectionnez votre Langue';

  @override
  String get analyzingLabel => 'Analyse en cours...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count éléments';
  }
}
