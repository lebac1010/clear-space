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

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings =>
      'You can change this later in Settings. (fr)';

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
  String get storeUnavailable => 'Store service temporarily unavailable. (fr)';

  @override
  String get browserRestricted =>
      'Browser access restricted on this device. (fr)';

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
  String get junkFilesFound => 'Junk Files Found (fr)';

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
  String get refreshingAppList => 'Refreshing app list... (fr)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (fr)';

  @override
  String get uninstallApp => 'Uninstall App (fr)';

  @override
  String get uninstall => 'Uninstall (fr)';

  @override
  String get sortLargest => 'Largest (fr)';

  @override
  String get sortSmallest => 'Smallest (fr)';

  @override
  String get sortNewest => 'Newest (fr)';

  @override
  String get sortAZ => 'A-Z (fr)';

  @override
  String get pageNotFound => 'Page Not Found (fr)';

  @override
  String get goToDashboard => 'Go to Dashboard (fr)';

  @override
  String get deleteFilesTitle => 'Delete Files (fr)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (fr)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (fr)';

  @override
  String get tryAgain => 'Try Again (fr)';

  @override
  String get appManagerTitle => 'App Manager (fr)';

  @override
  String get searchApps => 'Search apps... (fr)';

  @override
  String get noAppsFound => 'No apps found (fr)';

  @override
  String get noMatchingApps => 'No matching apps (fr)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (fr)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (fr)';

  @override
  String appsCount(int count) {
    return '$count apps (fr)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (fr)';
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
  String get allClean => 'All clean! (fr)';

  @override
  String get deleting => 'Deleting... (fr)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (fr)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (fr)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (fr)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (fr)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (fr)';

  @override
  String get cleaning => 'Cleaning... (fr)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (fr)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (fr)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (fr)';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found. (fr)';

  @override
  String get save => 'Save (fr)';

  @override
  String get keep => 'KEEP (fr)';

  @override
  String get deselectAll => 'Deselect All (fr)';

  @override
  String get images => 'Images (fr)';

  @override
  String get docs => 'Docs (fr)';

  @override
  String get others => 'Others (fr)';

  @override
  String get all => 'All (fr)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (fr)';
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
    return '$_temp0 (fr)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (fr)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (fr)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (fr)';

  @override
  String get systemDefault => 'System Default (fr)';

  @override
  String get light => 'Light (fr)';

  @override
  String get dark => 'Dark (fr)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (fr)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (fr)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (fr)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (fr)';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only (fr)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (fr)';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations (fr)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (fr)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (fr)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (fr)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (fr)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (fr)';

  @override
  String get versionUnavailable => 'Version unavailable (fr)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (fr)';

  @override
  String get clearSpace => 'Clear Space (fr)';

  @override
  String get storageDashboard => 'Storage Dashboard (fr)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (fr)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (fr)';

  @override
  String get cleanup => 'Cleanup (fr)';

  @override
  String get suggestions => 'Suggestions (fr)';

  @override
  String get analyzing => 'Analyzing... (fr)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (fr)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (fr)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (fr)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (fr)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (fr)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (fr)';
  }

  @override
  String get calculating => 'Calculating... (fr)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (fr)';

  @override
  String get free => 'Free (fr)';

  @override
  String get used => 'Used (fr)';

  @override
  String get total => 'Total (fr)';

  @override
  String get phaseDisk => 'Disk (fr)';

  @override
  String get phasePhotos => 'Photos (fr)';

  @override
  String get phaseVideos => 'Videos (fr)';

  @override
  String get phaseAudio => 'Audio (fr)';

  @override
  String get phaseDocuments => 'Documents (fr)';

  @override
  String get phaseJunk => 'Junk Files (fr)';

  @override
  String get phaseFolders => 'Folders (fr)';

  @override
  String get phaseApks => 'APKs (fr)';

  @override
  String get phaseSimilar => 'Similar Photos (fr)';

  @override
  String get phaseStorage => 'Storage (fr)';

  @override
  String totalSize(String size) {
    return '$size Total (fr)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (fr)';
  }

  @override
  String get largeFilesTitle => 'Large Files (fr)';

  @override
  String get selectYourLanguage => 'Select Your Language (fr)';

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
  String get junkFilesFound => 'Junk Files Found (fr_FR)';

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
  String get refreshingAppList => 'Refreshing app list... (fr_FR)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (fr_FR)';

  @override
  String get uninstallApp => 'Uninstall App (fr_FR)';

  @override
  String get uninstall => 'Uninstall (fr_FR)';

  @override
  String get sortLargest => 'Largest (fr_FR)';

  @override
  String get sortSmallest => 'Smallest (fr_FR)';

  @override
  String get sortNewest => 'Newest (fr_FR)';

  @override
  String get sortAZ => 'A-Z (fr_FR)';

  @override
  String get pageNotFound => 'Page Not Found (fr_FR)';

  @override
  String get goToDashboard => 'Go to Dashboard (fr_FR)';

  @override
  String get deleteFilesTitle => 'Delete Files (fr_FR)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (fr_FR)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (fr_FR)';

  @override
  String get tryAgain => 'Try Again (fr_FR)';

  @override
  String get appManagerTitle => 'App Manager (fr_FR)';

  @override
  String get searchApps => 'Search apps... (fr_FR)';

  @override
  String get noAppsFound => 'No apps found (fr_FR)';

  @override
  String get noMatchingApps => 'No matching apps (fr_FR)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (fr_FR)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (fr_FR)';

  @override
  String appsCount(int count) {
    return '$count apps (fr_FR)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (fr_FR)';
  }

  @override
  String get allClean => 'All clean! (fr_FR)';

  @override
  String get deleting => 'Deleting... (fr_FR)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (fr_FR)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (fr_FR)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (fr_FR)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (fr_FR)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (fr_FR)';

  @override
  String get cleaning => 'Cleaning... (fr_FR)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (fr_FR)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (fr_FR)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (fr_FR)';

  @override
  String get noSmartCleanupItems =>
      'No duplicate or similar files found. (fr_FR)';

  @override
  String get save => 'Save (fr_FR)';

  @override
  String get keep => 'KEEP (fr_FR)';

  @override
  String get deselectAll => 'Deselect All (fr_FR)';

  @override
  String get images => 'Images (fr_FR)';

  @override
  String get docs => 'Docs (fr_FR)';

  @override
  String get others => 'Others (fr_FR)';

  @override
  String get all => 'All (fr_FR)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (fr_FR)';
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
    return '$_temp0 (fr_FR)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (fr_FR)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (fr_FR)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (fr_FR)';

  @override
  String get systemDefault => 'System Default (fr_FR)';

  @override
  String get light => 'Light (fr_FR)';

  @override
  String get dark => 'Dark (fr_FR)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (fr_FR)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (fr_FR)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (fr_FR)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (fr_FR)';

  @override
  String get strictSensitivityDesc =>
      '95% Match — Nearly identical only (fr_FR)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (fr_FR)';

  @override
  String get looseSensitivityDesc =>
      '75% Match — Catches more variations (fr_FR)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (fr_FR)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (fr_FR)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (fr_FR)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (fr_FR)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (fr_FR)';

  @override
  String get versionUnavailable => 'Version unavailable (fr_FR)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (fr_FR)';

  @override
  String get clearSpace => 'Clear Space (fr_FR)';

  @override
  String get storageDashboard => 'Storage Dashboard (fr_FR)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (fr_FR)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (fr_FR)';

  @override
  String get cleanup => 'Cleanup (fr_FR)';

  @override
  String get suggestions => 'Suggestions (fr_FR)';

  @override
  String get analyzing => 'Analyzing... (fr_FR)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (fr_FR)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (fr_FR)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (fr_FR)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (fr_FR)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (fr_FR)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (fr_FR)';
  }

  @override
  String get calculating => 'Calculating... (fr_FR)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (fr_FR)';

  @override
  String get free => 'Free (fr_FR)';

  @override
  String get used => 'Used (fr_FR)';

  @override
  String get total => 'Total (fr_FR)';

  @override
  String get phaseDisk => 'Disk (fr_FR)';

  @override
  String get phasePhotos => 'Photos (fr_FR)';

  @override
  String get phaseVideos => 'Videos (fr_FR)';

  @override
  String get phaseAudio => 'Audio (fr_FR)';

  @override
  String get phaseDocuments => 'Documents (fr_FR)';

  @override
  String get phaseJunk => 'Junk Files (fr_FR)';

  @override
  String get phaseFolders => 'Folders (fr_FR)';

  @override
  String get phaseApks => 'APKs (fr_FR)';

  @override
  String get phaseSimilar => 'Similar Photos (fr_FR)';

  @override
  String get phaseStorage => 'Storage (fr_FR)';

  @override
  String totalSize(String size) {
    return '$size Total (fr_FR)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (fr_FR)';
  }

  @override
  String get largeFilesTitle => 'Large Files (fr_FR)';

  @override
  String get selectYourLanguage => 'Select Your Language (fr_FR)';
}
