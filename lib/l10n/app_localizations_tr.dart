// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Panel';

  @override
  String get cleanupTitle => 'Temizle';

  @override
  String get photosTitle => 'Fotoğraflar';

  @override
  String get filesTitle => 'Dosyalar';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get languageTitle => 'Dil';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Sistem Varsayılanı';

  @override
  String get lightTheme => 'Açık';

  @override
  String get darkTheme => 'Koyu';

  @override
  String get storageAccessRequired => 'Erişim Gerekli';

  @override
  String get storageAccessDesc =>
      'Clear Space\'in cihazınızda kopyaları, büyük dosyaları ve çöp dosyaları taramak için \"Tüm dosyalara erişim\" iznine ihtiyacı var.\n\nİzin vermek için ayarlara yönlendirileceksiniz.';

  @override
  String get grantPermission => 'İzin Ver';

  @override
  String get getStarted => 'Başla';

  @override
  String get next => 'İleri';

  @override
  String get continueText => 'Devam';

  @override
  String get cancel => 'İptal';

  @override
  String get analyze => 'Analiz Et';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get error => 'Hata';

  @override
  String get success => 'Başarılı';

  @override
  String get noItemsFound => 'Öğe bulunamadı';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe',
      one: '1 öğe',
      zero: 'Öğe yok',
    );
    return '$_temp0 seçildi';
  }

  @override
  String get onboardingWelcome =>
      'Cihazınızı temiz, hızlı ve güvenli tutmanın en akıllı yoluna hoş geldiniz.';

  @override
  String get onboardingFeaturesTitle => 'Güçlü Özellikler';

  @override
  String get onboardingFeaturesDesc =>
      'Depolamanızı verimli bir şekilde yönetmek için ihtiyacınız olan her şey.';

  @override
  String get feature1Title => 'Depolamanızı anlayın';

  @override
  String get feature1Desc =>
      'Neyin yer kapladığına dair net bir görsel döküm alın.';

  @override
  String get feature2Title => 'Güvenle temizleyin';

  @override
  String get feature2Desc =>
      'Gereksiz dosyaları güvenli silme protokolleriyle kaldırın.';

  @override
  String get feature3Title => 'Yer açın';

  @override
  String get feature3Desc =>
      'Çöpleri, büyük dosyaları ve kopyaları anında bulun ve silin.';

  @override
  String get termsDesc =>
      'Devam ederek, Gizlilik Politikamızı kabul etmiş olursunuz.';

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings =>
      'You can change this later in Settings. (tr)';

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
  String get storeUnavailable => 'Store service temporarily unavailable. (tr)';

  @override
  String get browserRestricted =>
      'Browser access restricted on this device. (tr)';

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
  String get junkFilesFound => 'Junk Files Found (tr)';

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
  String get refreshingAppList => 'Refreshing app list... (tr)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (tr)';

  @override
  String get uninstallApp => 'Uninstall App (tr)';

  @override
  String get uninstall => 'Uninstall (tr)';

  @override
  String get sortLargest => 'Largest (tr)';

  @override
  String get sortSmallest => 'Smallest (tr)';

  @override
  String get sortNewest => 'Newest (tr)';

  @override
  String get sortAZ => 'A-Z (tr)';

  @override
  String get pageNotFound => 'Page Not Found (tr)';

  @override
  String get goToDashboard => 'Go to Dashboard (tr)';

  @override
  String get deleteFilesTitle => 'Delete Files (tr)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (tr)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (tr)';

  @override
  String get tryAgain => 'Try Again (tr)';

  @override
  String get appManagerTitle => 'App Manager (tr)';

  @override
  String get searchApps => 'Search apps... (tr)';

  @override
  String get noAppsFound => 'No apps found (tr)';

  @override
  String get noMatchingApps => 'No matching apps (tr)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (tr)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (tr)';

  @override
  String appsCount(int count) {
    return '$count apps (tr)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (tr)';
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
  String get allClean => 'All clean! (tr)';

  @override
  String get deleting => 'Deleting... (tr)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (tr)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (tr)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (tr)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (tr)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (tr)';

  @override
  String get cleaning => 'Cleaning... (tr)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (tr)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (tr)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (tr)';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found. (tr)';

  @override
  String get save => 'Save (tr)';

  @override
  String get keep => 'KEEP (tr)';

  @override
  String get deselectAll => 'Deselect All (tr)';

  @override
  String get images => 'Images (tr)';

  @override
  String get docs => 'Docs (tr)';

  @override
  String get others => 'Others (tr)';

  @override
  String get all => 'All (tr)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (tr)';
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
    return '$_temp0 (tr)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (tr)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (tr)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (tr)';

  @override
  String get systemDefault => 'System Default (tr)';

  @override
  String get light => 'Light (tr)';

  @override
  String get dark => 'Dark (tr)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (tr)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (tr)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (tr)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (tr)';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only (tr)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (tr)';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations (tr)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (tr)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (tr)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (tr)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (tr)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (tr)';

  @override
  String get versionUnavailable => 'Version unavailable (tr)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (tr)';

  @override
  String get clearSpace => 'Clear Space (tr)';

  @override
  String get storageDashboard => 'Storage Dashboard (tr)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (tr)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (tr)';

  @override
  String get cleanup => 'Cleanup (tr)';

  @override
  String get suggestions => 'Suggestions (tr)';

  @override
  String get analyzing => 'Analyzing... (tr)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (tr)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (tr)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (tr)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (tr)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (tr)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (tr)';
  }

  @override
  String get calculating => 'Calculating... (tr)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (tr)';

  @override
  String get free => 'Free (tr)';

  @override
  String get used => 'Used (tr)';

  @override
  String get total => 'Total (tr)';

  @override
  String get phaseDisk => 'Disk (tr)';

  @override
  String get phasePhotos => 'Photos (tr)';

  @override
  String get phaseVideos => 'Videos (tr)';

  @override
  String get phaseAudio => 'Audio (tr)';

  @override
  String get phaseDocuments => 'Documents (tr)';

  @override
  String get phaseJunk => 'Junk Files (tr)';

  @override
  String get phaseFolders => 'Folders (tr)';

  @override
  String get phaseApks => 'APKs (tr)';

  @override
  String get phaseSimilar => 'Similar Photos (tr)';

  @override
  String get phaseStorage => 'Storage (tr)';

  @override
  String totalSize(String size) {
    return '$size Total (tr)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (tr)';
  }

  @override
  String get largeFilesTitle => 'Large Files (tr)';

  @override
  String get selectYourLanguage => 'Select Your Language (tr)';

  @override
  String get analyzingLabel => 'Analiz ediliyor...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count öğe';
  }
}

/// The translations for Turkish, as used in Turkey (`tr_TR`).
class AppLocalizationsTrTr extends AppLocalizationsTr {
  AppLocalizationsTrTr() : super('tr_TR');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Kontrol Paneli';

  @override
  String get cleanupTitle => 'Temizle';

  @override
  String get photosTitle => 'Fotoğraflar';

  @override
  String get filesTitle => 'Dosyalar';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get languageTitle => 'Dil';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Sistem Varsayılanı';

  @override
  String get lightTheme => 'Açık';

  @override
  String get darkTheme => 'Koyu';

  @override
  String get storageAccessRequired => 'Depolama Erişimi Gerekli';

  @override
  String get storageAccessDesc =>
      'Clear Space\'in cihazınızı kopyalar, büyük dosyalar ve gereksiz dosyalar için taraması amacıyla \"Tüm dosyalara erişim\" iznine ihtiyacı vardır.\n\nİzin Ver\'e dokunduğunuzda bu izni vermek için Sistem Ayarları\'na yönlendirileceksiniz.';

  @override
  String get grantPermission => 'İzin Ver';

  @override
  String get getStarted => 'Başlayın';

  @override
  String get next => 'İleri';

  @override
  String get continueText => 'Devam Et';

  @override
  String get cancel => 'İptal';

  @override
  String get analyze => 'Analiz Et';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get error => 'Hata';

  @override
  String get success => 'Başarılı';

  @override
  String get noItemsFound => 'Hiçbir öğe bulunamadı';

  @override
  String itemsSelected(int count) {
    return '$count öğe seçildi';
  }

  @override
  String get onboardingWelcome =>
      'Cihazınızı temiz, hızlı ve güvende tutmanın en akıllı yoluna hoş geldiniz.';

  @override
  String get onboardingFeaturesTitle => 'Güçlü Özellikler';

  @override
  String get onboardingFeaturesDesc =>
      'Depolama alanınızı verimli bir şekilde yönetmek için ihtiyacınız olan her şey.';

  @override
  String get feature1Title => 'Depolama alanınızı anlayın';

  @override
  String get feature1Desc =>
      'Neyin yer kapladığına dair net bir görsel döküm elde edin.';

  @override
  String get feature2Title => 'Güvenle temizleyin';

  @override
  String get feature2Desc =>
      'Güvenli silme protokolleriyle gereksiz dosyaları kaldırın.';

  @override
  String get feature3Title => 'Yer açın';

  @override
  String get feature3Desc =>
      'Gereksiz dosyaları, büyük dosyaları ve kopyaları anında bulun ve kaldırın.';

  @override
  String get termsDesc =>
      'Devam ederek Hizmet Şartlarımızı ve Gizlilik Politikamızı kabul etmiş olursunuz.';

  @override
  String get selectLanguage => 'Dilinizi Seçin';

  @override
  String get changeLaterInSettings =>
      'Bunu daha sonra Ayarlar\'dan değiştirebilirsiniz.';

  @override
  String get photosAndImages => 'Fotoğraflar ve Görüntüler';

  @override
  String get videos => 'Videolar';

  @override
  String get audio => 'Ses';

  @override
  String get documentsAndFiles => 'Belgeler ve Dosyalar';

  @override
  String get systemAndApps => 'Sistem ve Uygulamalar';

  @override
  String get other => 'DİĞER';

  @override
  String get review => 'İncele';

  @override
  String get viewDetails => 'Ayrıntıları Görüntüle';

  @override
  String get smartCleanupPlan => 'Akıllı Temizlik Planı';

  @override
  String get analyzingSafeToDelete =>
      'Güvenle silinebilecek dosyalar analiz ediliyor...';

  @override
  String get returnToDashboard => 'Kontrol Paneline Dön';

  @override
  String get returnDirectlyToDashboard => 'Doğrudan Kontrol Paneline Dön';

  @override
  String get appearanceAndLanguage => 'Görünüm ve Dil';

  @override
  String get supportAndEngagement => 'Destek ve Etkileşim';

  @override
  String get scanPreferences => 'Tarama Tercihleri';

  @override
  String get legalAndAppInfo => 'Yasal ve Uygulama Bilgileri';

  @override
  String get cleanupHistory => 'Temizlik Geçmişi';

  @override
  String get viewPastCleaning =>
      'Geçmiş temizlik etkinliklerinizi görüntüleyin';

  @override
  String get sendFeedback => 'Geri Bildirim Gönder';

  @override
  String get reportBugs => 'Hata bildirin veya iyileştirme önerin';

  @override
  String get rateUs => 'Bize 5 Yıldız Verin';

  @override
  String get helpOthers => 'Başkalarının Clear Space\'i bulmasına yardım edin';

  @override
  String get shareWithFriends => 'Arkadaşlarla Paylaş';

  @override
  String get recommendApp => 'Uygulamayı mesajlarla tavsiye et';

  @override
  String get similarPhotoSensitivity => 'Benzer Fotoğraf Hassasiyeti';

  @override
  String get largeFileThreshold => 'Büyük Dosya Eşiği';

  @override
  String get strict => 'Sıkı';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Gevşek';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get howWeProtectData => 'Verilerinizi nasıl koruyoruz';

  @override
  String get termsOfService => 'Hizmet Şartları';

  @override
  String get rulesAndGuidelines => 'Kurallar ve yönergeler';

  @override
  String get appVersion => 'Uygulama Sürümü';

  @override
  String get emailRestricted => 'E-posta işlevi cihaz tarafından kısıtlandı.';

  @override
  String get browserLaunchFailed => 'Tarayıcı başlatılamadı.';

  @override
  String get storeUnavailable => 'Mağaza hizmeti geçici olarak kullanılamıyor.';

  @override
  String get browserRestricted => 'Bu cihazda tarayıcı erişimi kısıtlandı.';

  @override
  String get shareUnavailable => 'Paylaşım işlevi kullanılamıyor.';

  @override
  String get keepPhoneClean => 'Clear Space ile telefonunuzu temiz tutun';

  @override
  String get duplicateFiles => 'Kopya Dosyalar';

  @override
  String get findIdenticalFiles =>
      'Birbirinin aynı dosyaları bulun ve kaldırın';

  @override
  String get similarPhotos => 'Benzer Fotoğraflar';

  @override
  String get findKeyMoments => 'Önemli fotoğraf anlarını bulun';

  @override
  String get largeFiles => 'Büyük Dosyalar';

  @override
  String filesLargerThan(String size) {
    return '$size boyutundan daha büyük dosyalar';
  }

  @override
  String get screenshots => 'Ekran Görüntüleri';

  @override
  String get findAndDeleteScreenshots => 'Ekran görüntülerini bulun ve silin';

  @override
  String get downloads => 'İndirilenler';

  @override
  String get manageDownloadedFiles => 'İndirdiğiniz dosyaları yönetin';

  @override
  String get tempAndLogFiles => 'Geçici ve Günlük Dosyaları';

  @override
  String sizeFound(String size) {
    return '$size bulundu';
  }

  @override
  String get emptyFolders => 'Boş Klasörler';

  @override
  String emptyFoldersFound(int count) {
    return '$count boş klasör bulundu';
  }

  @override
  String get safeApkInstallers => 'Güvenli APK Yükleyicileri';

  @override
  String get cleanOldApks => 'Yüklü/eski APK\'ları temizleyin';

  @override
  String get pleaseScanStorageFirst => 'Lütfen önce depolama alanını tarayın';

  @override
  String get noJunkFilesFound => 'Hiçbir gereksiz dosya bulunamadı!';

  @override
  String get cleanupComplete => 'Temizlik tamamlandı!';

  @override
  String cleanupFailed(String error) {
    return 'Temizlik başarısız oldu: $error';
  }

  @override
  String get selectAll => 'Tümünü Seç';

  @override
  String get noLargeFilesFound => 'Hiçbir büyük dosya bulunamadı!';

  @override
  String get noDuplicatesFound => 'Hiçbir kopya bulunamadı!';

  @override
  String get delete => 'Sil';

  @override
  String get confirmation => 'Onaylama';

  @override
  String get deleteFilesQuestion => 'Dosyalar silinsin mi?';

  @override
  String deleteCountScreenshots(int count) {
    return '$count ekran görüntüsü kalıcı olarak silinsin mi?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Ekran görüntüleri başarıyla silindi';

  @override
  String get junkFilesFound => 'Junk Files Found (tr_TR)';

  @override
  String get noPhotosFound => 'Fotoğraf bulunamadı';

  @override
  String errorLoadingPhotos(String error) {
    return 'Fotoğraflar yüklenirken hata oluştu: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Silme başarısız oldu: $error';
  }

  @override
  String get contacts => 'Kişiler';

  @override
  String get contactsNotImplemented => 'Kişi Listesi uygulanmadı';

  @override
  String get smartSelect => 'Akıllı Seçim';

  @override
  String get junkFiles => 'Gereksiz Dosyalar';

  @override
  String potentialSize(String size) {
    return '$size potansiyel';
  }

  @override
  String get noFilesMatchFilter => 'Bu filtreyle eşleşen dosya yok';

  @override
  String get refreshingAppList => 'Refreshing app list... (tr_TR)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (tr_TR)';

  @override
  String get uninstallApp => 'Uninstall App (tr_TR)';

  @override
  String get uninstall => 'Uninstall (tr_TR)';

  @override
  String get sortLargest => 'Largest (tr_TR)';

  @override
  String get sortSmallest => 'Smallest (tr_TR)';

  @override
  String get sortNewest => 'Newest (tr_TR)';

  @override
  String get sortAZ => 'A-Z (tr_TR)';

  @override
  String get pageNotFound => 'Page Not Found (tr_TR)';

  @override
  String get goToDashboard => 'Go to Dashboard (tr_TR)';

  @override
  String get deleteFilesTitle => 'Delete Files (tr_TR)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (tr_TR)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (tr_TR)';

  @override
  String get tryAgain => 'Try Again (tr_TR)';

  @override
  String get appManagerTitle => 'App Manager (tr_TR)';

  @override
  String get searchApps => 'Search apps... (tr_TR)';

  @override
  String get noAppsFound => 'No apps found (tr_TR)';

  @override
  String get noMatchingApps => 'No matching apps (tr_TR)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (tr_TR)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (tr_TR)';

  @override
  String appsCount(int count) {
    return '$count apps (tr_TR)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (tr_TR)';
  }

  @override
  String get allClean => 'All clean! (tr_TR)';

  @override
  String get deleting => 'Deleting... (tr_TR)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (tr_TR)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (tr_TR)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (tr_TR)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (tr_TR)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (tr_TR)';

  @override
  String get cleaning => 'Cleaning... (tr_TR)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (tr_TR)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (tr_TR)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (tr_TR)';

  @override
  String get noSmartCleanupItems =>
      'No duplicate or similar files found. (tr_TR)';

  @override
  String get save => 'Save (tr_TR)';

  @override
  String get keep => 'KEEP (tr_TR)';

  @override
  String get deselectAll => 'Deselect All (tr_TR)';

  @override
  String get images => 'Images (tr_TR)';

  @override
  String get docs => 'Docs (tr_TR)';

  @override
  String get others => 'Others (tr_TR)';

  @override
  String get all => 'All (tr_TR)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (tr_TR)';
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
    return '$_temp0 (tr_TR)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (tr_TR)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (tr_TR)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (tr_TR)';

  @override
  String get systemDefault => 'System Default (tr_TR)';

  @override
  String get light => 'Light (tr_TR)';

  @override
  String get dark => 'Dark (tr_TR)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (tr_TR)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (tr_TR)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (tr_TR)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (tr_TR)';

  @override
  String get strictSensitivityDesc =>
      '95% Match — Nearly identical only (tr_TR)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (tr_TR)';

  @override
  String get looseSensitivityDesc =>
      '75% Match — Catches more variations (tr_TR)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (tr_TR)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (tr_TR)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (tr_TR)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (tr_TR)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (tr_TR)';

  @override
  String get versionUnavailable => 'Version unavailable (tr_TR)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (tr_TR)';

  @override
  String get clearSpace => 'Clear Space (tr_TR)';

  @override
  String get storageDashboard => 'Storage Dashboard (tr_TR)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (tr_TR)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (tr_TR)';

  @override
  String get cleanup => 'Cleanup (tr_TR)';

  @override
  String get suggestions => 'Suggestions (tr_TR)';

  @override
  String get analyzing => 'Analyzing... (tr_TR)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (tr_TR)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (tr_TR)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (tr_TR)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (tr_TR)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (tr_TR)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (tr_TR)';
  }

  @override
  String get calculating => 'Calculating... (tr_TR)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (tr_TR)';

  @override
  String get free => 'Free (tr_TR)';

  @override
  String get used => 'Used (tr_TR)';

  @override
  String get total => 'Total (tr_TR)';

  @override
  String get phaseDisk => 'Disk (tr_TR)';

  @override
  String get phasePhotos => 'Photos (tr_TR)';

  @override
  String get phaseVideos => 'Videos (tr_TR)';

  @override
  String get phaseAudio => 'Audio (tr_TR)';

  @override
  String get phaseDocuments => 'Documents (tr_TR)';

  @override
  String get phaseJunk => 'Junk Files (tr_TR)';

  @override
  String get phaseFolders => 'Folders (tr_TR)';

  @override
  String get phaseApks => 'APKs (tr_TR)';

  @override
  String get phaseSimilar => 'Similar Photos (tr_TR)';

  @override
  String get phaseStorage => 'Storage (tr_TR)';

  @override
  String totalSize(String size) {
    return '$size Total (tr_TR)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (tr_TR)';
  }

  @override
  String get largeFilesTitle => 'Large Files (tr_TR)';

  @override
  String get selectYourLanguage => 'Select Your Language (tr_TR)';
}
