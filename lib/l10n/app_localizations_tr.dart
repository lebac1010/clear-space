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
  String get grantPermission => 'İzin Ver';

  @override
  String get getStarted => 'Başla';

  @override
  String get skip => 'Skip';

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
  String get junkFilesFound => 'Gereksiz Dosyalar Bulundu';

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
  String get refreshingAppList => 'Uygulama listesi yenileniyor...';

  @override
  String get openingUninstaller => 'Kaldırıcı açılıyor...';

  @override
  String get uninstallApp => 'Uygulamayı Kaldır';

  @override
  String get uninstall => 'Kaldır';

  @override
  String get sortLargest => 'En büyük';

  @override
  String get sortSmallest => 'En küçük';

  @override
  String get sortNewest => 'En yeni';

  @override
  String get sortAZ => 'A\'dan Z\'ye';

  @override
  String get pageNotFound => 'Sayfa bulunamadı';

  @override
  String get goToDashboard => 'Panele Git';

  @override
  String get deleteFilesTitle => 'Dosyaları Sil';

  @override
  String get smartCleanupPlanTitle => 'Akıllı Temizlik Planı';

  @override
  String get screenshotsCleanerTitle => 'Ekran Görüntüsü Temizleyici';

  @override
  String get tryAgain => 'Tekrar dene';

  @override
  String get appManagerTitle => 'Uygulama Yöneticisi';

  @override
  String get searchApps => 'Uygulama ara...';

  @override
  String get noAppsFound => 'Uygulama bulunamadı';

  @override
  String get noMatchingApps => 'Eşleşen uygulama yok';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return '\"$appName\" ($size) uygulamasını kaldırmak istiyor musunuz?';
  }

  @override
  String get uninstallActionDesc => 'Uygulama ve tüm verileri silinecektir.';

  @override
  String appsCount(int count) {
    return '$count uygulama';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total uygulama gösteriliyor';
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
  String get allClean => 'Tertemiz!';

  @override
  String get deleting => 'Siliniyor...';

  @override
  String deleteItemsCount(int count, String size) {
    return '$count öğeyi sil ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count öğe silindi ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Bu işlem geri alınamaz.';

  @override
  String get cleanupBreakdown => 'Temizlik Dağılımı';

  @override
  String get smartCleanupDesc =>
      'Benzer fotoğrafların ve dosyaların en iyi sürümünü otomatik tutuyoruz.';

  @override
  String get cleaning => 'Temizleniyor...';

  @override
  String cleanUpSize(String size) {
    return '$size Temizle';
  }

  @override
  String youSavedSize(String size) {
    return '$size yer açtınız';
  }

  @override
  String get youreAllSet => 'Her Şey Hazır!';

  @override
  String get noSmartCleanupItems => 'Hiç kopya dosya bulunamadı.';

  @override
  String get save => 'Kaydet';

  @override
  String get keep => 'TUT';

  @override
  String get deselectAll => 'Tümünü Kaldır';

  @override
  String get images => 'Resimler';

  @override
  String get docs => 'Belgeler';

  @override
  String get others => 'Diğer';

  @override
  String get all => 'Tümü';

  @override
  String deleteConfirmMsg(int count) {
    return 'Seçilen $count dosyayı silmek istediğinizden emin misiniz?';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görüntü',
      one: '1 görüntü',
      zero: 'Ekran görüntüsü yok',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Seçilen: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Seçilenleri Sil ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Bazı öğeler silinemedi. Tekrar deneyin.';

  @override
  String get systemDefault => 'Sistem Varsayılanı';

  @override
  String get light => 'Açık';

  @override
  String get dark => 'Koyu';

  @override
  String get strictSensitivity => 'Katı (%95 Eşleşme)';

  @override
  String get normalSensitivity => 'Normal (%85 Eşleşme)';

  @override
  String get looseSensitivity => 'Gevşek (%75 Eşleşme)';

  @override
  String get sensitivityDesc =>
      'Uygulamanın benzer fotoğrafları nasıl tanımlayacağını seçin.';

  @override
  String get strictSensitivityDesc => 'Sadece neredeyse birebir aynı';

  @override
  String get normalSensitivityDesc => 'Önerilen ayar';

  @override
  String get looseSensitivityDesc => 'Daha fazla benzerlik bulur';

  @override
  String get sensitivityUpdated => 'Hassasiyet ayarı güncellendi.';

  @override
  String get thresholdDesc => 'Bu değerden büyük dosyalar işaretlenir.';

  @override
  String get thresholdUpdated => 'Limit güncellendi.';

  @override
  String largerThanSize(String size) {
    return '$size boyutundan büyük';
  }

  @override
  String get madeWithHeart => 'Daha temiz bir telefon için ❤️ ile yapıldı';

  @override
  String get versionUnavailable => 'Sürüm yok';

  @override
  String get emailNotSupported => 'E-posta desteklenmiyor.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Depolama Paneli';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count öğe temizlenebilir';
  }

  @override
  String get storageBreakdown => 'Depolama Kullanımı';

  @override
  String get cleanup => 'Temizlik';

  @override
  String get suggestions => 'Önerilenler';

  @override
  String get analyzing => 'İnceleniyor...';

  @override
  String get keepStorageHealthy => 'Depolamanızı koruyun';

  @override
  String get cleanupHeaderDesc =>
      'Yer açmak için silebileceğiniz dosyaları bulduk.';

  @override
  String percentUsed(int percentage) {
    return '%$percentage Dolu';
  }

  @override
  String get scanPausedBattery => 'Tarama Durduruldu (Düşük Pil)';

  @override
  String scanningPhase(String phase) {
    return 'Taranıyor: $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Taranıyor: $phase... (%$percentage)';
  }

  @override
  String get calculating => 'Hesaplanıyor...';

  @override
  String get internalStorage => 'DAHİLİ DEPOLAMA';

  @override
  String get free => 'Boş';

  @override
  String get used => 'Kullanılan';

  @override
  String get total => 'Toplam';

  @override
  String get phaseDisk => 'Disk';

  @override
  String get phasePhotos => 'Fotoğraflar';

  @override
  String get phaseVideos => 'Videolar';

  @override
  String get phaseAudio => 'Ses';

  @override
  String get phaseDocuments => 'Belgeler';

  @override
  String get phaseJunk => 'Gereksiz';

  @override
  String get phaseFolders => 'Klasörler';

  @override
  String get phaseApks => 'Kurulumlar';

  @override
  String get phaseSimilar => 'Benzer Resimler';

  @override
  String get phaseStorage => 'Depolama';

  @override
  String totalSize(String size) {
    return '$size Toplam';
  }

  @override
  String usedSize(String size) {
    return '$size Kullanımda';
  }

  @override
  String get largeFilesTitle => 'Büyük Dosyalar';

  @override
  String get selectYourLanguage => 'Dilinizi Seçin';

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
  String get grantPermission => 'İzin Ver';

  @override
  String get getStarted => 'Başlayın';

  @override
  String get skip => 'Skip';

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
  String get clearHistory => 'Clear History';

  @override
  String get clearHistoryConfirm =>
      'Are you sure you want to delete all cleanup logs?';

  @override
  String get clearAll => 'Clear All';

  @override
  String get cleanAllSafeItems => 'Clean All Safe Items';

  @override
  String get deleteFilesQuestion => 'Dosyalar silinsin mi?';

  @override
  String deleteCountScreenshots(int count) {
    return '$count ekran görüntüsü kalıcı olarak silinsin mi?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Ekran görüntüleri başarıyla silindi';

  @override
  String get junkFilesFound => 'Gereksiz Dosyalar Bulundu';

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
  String get refreshingAppList => 'Uygulama listesi yenileniyor...';

  @override
  String get openingUninstaller => 'Kaldırıcı açılıyor...';

  @override
  String get uninstallApp => 'Uygulamayı Kaldır';

  @override
  String get uninstall => 'Kaldır';

  @override
  String get sortLargest => 'En büyük';

  @override
  String get sortSmallest => 'En küçük';

  @override
  String get sortNewest => 'En yeni';

  @override
  String get sortAZ => 'A\'dan Z\'ye';

  @override
  String get pageNotFound => 'Sayfa bulunamadı';

  @override
  String get goToDashboard => 'Panele Git';

  @override
  String get deleteFilesTitle => 'Dosyaları Sil';

  @override
  String get smartCleanupPlanTitle => 'Akıllı Temizlik Planı';

  @override
  String get screenshotsCleanerTitle => 'Ekran Görüntüsü Temizleyici';

  @override
  String get tryAgain => 'Tekrar dene';

  @override
  String get appManagerTitle => 'Uygulama Yöneticisi';

  @override
  String get searchApps => 'Uygulama ara...';

  @override
  String get noAppsFound => 'Uygulama bulunamadı';

  @override
  String get noMatchingApps => 'Eşleşen uygulama yok';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return '\"$appName\" ($size) uygulamasını kaldırmak istiyor musunuz?';
  }

  @override
  String get uninstallActionDesc => 'Uygulama ve tüm verileri silinecektir.';

  @override
  String appsCount(int count) {
    return '$count uygulama';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total uygulama gösteriliyor';
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
  String get allClean => 'Tertemiz!';

  @override
  String get deleting => 'Siliniyor...';

  @override
  String deleteItemsCount(int count, String size) {
    return '$count öğeyi sil ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count öğe silindi ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Bu işlem geri alınamaz.';

  @override
  String get cleanupBreakdown => 'Temizlik Dağılımı';

  @override
  String get smartCleanupDesc =>
      'Benzer fotoğrafların ve dosyaların en iyi sürümünü otomatik tutuyoruz.';

  @override
  String get cleaning => 'Temizleniyor...';

  @override
  String cleanUpSize(String size) {
    return '$size Temizle';
  }

  @override
  String youSavedSize(String size) {
    return '$size yer açtınız';
  }

  @override
  String get youreAllSet => 'Her Şey Hazır!';

  @override
  String get noSmartCleanupItems => 'Hiç kopya dosya bulunamadı.';

  @override
  String get save => 'Kaydet';

  @override
  String get keep => 'TUT';

  @override
  String get deselectAll => 'Tümünü Kaldır';

  @override
  String get images => 'Resimler';

  @override
  String get docs => 'Belgeler';

  @override
  String get others => 'Diğer';

  @override
  String get all => 'Tümü';

  @override
  String deleteConfirmMsg(int count) {
    return 'Seçilen $count dosyayı silmek istediğinizden emin misiniz?';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görüntü',
      one: '1 görüntü',
      zero: 'Ekran görüntüsü yok',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Seçilen: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Seçilenleri Sil ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Bazı öğeler silinemedi. Tekrar deneyin.';

  @override
  String get systemDefault => 'Sistem Varsayılanı';

  @override
  String get light => 'Açık';

  @override
  String get dark => 'Koyu';

  @override
  String get strictSensitivity => 'Katı (%95 Eşleşme)';

  @override
  String get normalSensitivity => 'Normal (%85 Eşleşme)';

  @override
  String get looseSensitivity => 'Gevşek (%75 Eşleşme)';

  @override
  String get sensitivityDesc =>
      'Uygulamanın benzer fotoğrafları nasıl tanımlayacağını seçin.';

  @override
  String get strictSensitivityDesc => 'Sadece neredeyse birebir aynı';

  @override
  String get normalSensitivityDesc => 'Önerilen ayar';

  @override
  String get looseSensitivityDesc => 'Daha fazla benzerlik bulur';

  @override
  String get sensitivityUpdated => 'Hassasiyet ayarı güncellendi.';

  @override
  String get thresholdDesc => 'Bu değerden büyük dosyalar işaretlenir.';

  @override
  String get thresholdUpdated => 'Limit güncellendi.';

  @override
  String largerThanSize(String size) {
    return '$size boyutundan büyük';
  }

  @override
  String get madeWithHeart => 'Daha temiz bir telefon için ❤️ ile yapıldı';

  @override
  String get versionUnavailable => 'Sürüm yok';

  @override
  String get emailNotSupported => 'E-posta desteklenmiyor.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Depolama Paneli';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count öğe temizlenebilir';
  }

  @override
  String get storageBreakdown => 'Depolama Kullanımı';

  @override
  String get cleanup => 'Temizlik';

  @override
  String get suggestions => 'Önerilenler';

  @override
  String get analyzing => 'İnceleniyor...';

  @override
  String get keepStorageHealthy => 'Depolamanızı koruyun';

  @override
  String get cleanupHeaderDesc =>
      'Yer açmak için silebileceğiniz dosyaları bulduk.';

  @override
  String percentUsed(int percentage) {
    return '%$percentage Dolu';
  }

  @override
  String get scanPausedBattery => 'Tarama Durduruldu (Düşük Pil)';

  @override
  String scanningPhase(String phase) {
    return 'Taranıyor: $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Taranıyor: $phase... (%$percentage)';
  }

  @override
  String get calculating => 'Hesaplanıyor...';

  @override
  String get internalStorage => 'DAHİLİ DEPOLAMA';

  @override
  String get free => 'Boş';

  @override
  String get used => 'Kullanılan';

  @override
  String get total => 'Toplam';

  @override
  String get phaseDisk => 'Disk';

  @override
  String get phasePhotos => 'Fotoğraflar';

  @override
  String get phaseVideos => 'Videolar';

  @override
  String get phaseAudio => 'Ses';

  @override
  String get phaseDocuments => 'Belgeler';

  @override
  String get phaseJunk => 'Gereksiz';

  @override
  String get phaseFolders => 'Klasörler';

  @override
  String get phaseApks => 'Kurulumlar';

  @override
  String get phaseSimilar => 'Benzer Resimler';

  @override
  String get phaseStorage => 'Depolama';

  @override
  String totalSize(String size) {
    return '$size Toplam';
  }

  @override
  String usedSize(String size) {
    return '$size Kullanımda';
  }

  @override
  String get largeFilesTitle => 'Büyük Dosyalar';

  @override
  String get selectYourLanguage => 'Dilinizi Seçin';

  @override
  String get analyzingLabel => 'Analyzing...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count items';
  }
}
