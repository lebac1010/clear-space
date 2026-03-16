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
  String get junkFilesFound => 'Fichiers résiduels trouvés';

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
  String get duplicates => 'Duplicates';

  @override
  String get similar => 'Similar';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get pageNotFoundDesc => 'The page you are looking for does not exist.';

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

/// The translations for French, as used in France (`fr_FR`).
class AppLocalizationsFrFr extends AppLocalizationsFr {
  AppLocalizationsFrFr() : super('fr_FR');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Tableau de bord';

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
  String get systemTheme => 'Par défaut du système';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get storageAccessRequired => 'Accès au stockage requis';

  @override
  String get storageAccessDesc =>
      'Clear Space a besoin de \"l\'accès à tous les fichiers\" pour analyser votre appareil à la recherche de doublons, de fichiers volumineux et de fichiers indésirables.\n\nVous serez redirigé vers les paramètres du système pour accorder cette autorisation lorsque vous appuierez sur Accorder l\'autorisation.';

  @override
  String get grantPermission => 'Accorder l\'autorisation';

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
  String get noItemsFound => 'Aucun élément trouvé';

  @override
  String itemsSelected(int count) {
    return '$count éléments sélectionnés';
  }

  @override
  String get onboardingWelcome =>
      'Bienvenue dans le moyen le plus intelligent de garder votre appareil propre, rapide et sécurisé.';

  @override
  String get onboardingFeaturesTitle => 'Fonctionnalités puissantes';

  @override
  String get onboardingFeaturesDesc =>
      'Tout ce dont vous avez besoin pour gérer efficacement votre stockage.';

  @override
  String get feature1Title => 'Comprenez votre stockage';

  @override
  String get feature1Desc =>
      'Obtenez une répartition visuelle claire de ce qui prend de la place.';

  @override
  String get feature2Title => 'Nettoyez en toute sécurité';

  @override
  String get feature2Desc =>
      'Supprimez les fichiers inutiles avec des protocoles de suppression sécurisés.';

  @override
  String get feature3Title => 'Libérez de l\'espace';

  @override
  String get feature3Desc =>
      'Trouvez et supprimez instantanément les fichiers indésirables, volumineux et les doublons.';

  @override
  String get termsDesc =>
      'En continuant, vous acceptez nos conditions d\'utilisation et notre politique de confidentialité.';

  @override
  String get selectLanguage => 'Sélectionnez votre langue';

  @override
  String get changeLaterInSettings =>
      'Vous pourrez modifier cela plus tard dans les paramètres.';

  @override
  String get photosAndImages => 'Photos et images';

  @override
  String get videos => 'Vidéos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Documents et fichiers';

  @override
  String get systemAndApps => 'Système et applications';

  @override
  String get other => 'AUTRE';

  @override
  String get review => 'Examiner';

  @override
  String get viewDetails => 'Voir les détails';

  @override
  String get smartCleanupPlan => 'Plan de nettoyage intelligent';

  @override
  String get analyzingSafeToDelete =>
      'Analyse des fichiers à supprimer en toute sécurité...';

  @override
  String get returnToDashboard => 'Retour au tableau de bord';

  @override
  String get returnDirectlyToDashboard =>
      'Retourner directement au tableau de bord';

  @override
  String get appearanceAndLanguage => 'Apparence et langue';

  @override
  String get supportAndEngagement => 'Assistance et engagement';

  @override
  String get scanPreferences => 'Préférences d\'analyse';

  @override
  String get legalAndAppInfo => 'Informations légales et sur l\'application';

  @override
  String get cleanupHistory => 'Historique de nettoyage';

  @override
  String get viewPastCleaning => 'Consultez vos activités de nettoyage passées';

  @override
  String get sendFeedback => 'Envoyer des commentaires';

  @override
  String get reportBugs => 'Signaler des bugs ou suggérer des améliorations';

  @override
  String get rateUs => 'Notez-nous 5 étoiles';

  @override
  String get helpOthers => 'Aidez les autres à trouver Clear Space';

  @override
  String get shareWithFriends => 'Partager avec des amis';

  @override
  String get recommendApp => 'Recommander l\'application par messages';

  @override
  String get similarPhotoSensitivity => 'Sensibilité aux photos similaires';

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
      'Fonctionnalité de messagerie restreinte par l\'appareil.';

  @override
  String get browserLaunchFailed => 'Impossible de lancer le navigateur.';

  @override
  String get storeUnavailable =>
      'Service de magasin temporairement indisponible.';

  @override
  String get browserRestricted =>
      'Accès au navigateur restreint sur cet appareil.';

  @override
  String get shareUnavailable => 'Fonctionnalité de partage non disponible.';

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
  String get findKeyMoments => 'Trouver les moments clés des photos';

  @override
  String get largeFiles => 'Fichiers volumineux';

  @override
  String filesLargerThan(String size) {
    return 'Fichiers supérieurs à $size';
  }

  @override
  String get screenshots => 'Captures d\'écran';

  @override
  String get findAndDeleteScreenshots =>
      'Trouver et supprimer des captures d\'écran';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get manageDownloadedFiles => 'Gérez vos fichiers téléchargés';

  @override
  String get tempAndLogFiles => 'Fichiers temporaires et journaux';

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
  String get safeApkInstallers => 'Installateurs APK sécurisés';

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
  String get noLargeFilesFound => 'Aucun fichier volumineux trouvé !';

  @override
  String get noDuplicatesFound => 'Aucun doublon trouvé !';

  @override
  String get delete => 'Supprimer';

  @override
  String get confirmation => 'Confirmation';

  @override
  String get deleteFilesQuestion => 'Supprimer les fichiers ?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Supprimer définitivement $count captures d\'écran ?';
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
    return 'Échec de la suppression : $error';
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
}
