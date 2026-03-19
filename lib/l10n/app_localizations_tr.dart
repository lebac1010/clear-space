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
      'Clear Space\'in cihazınızda kopyaları, büyük dosyaları and çöp dosyaları taramak için \"Tüm dosyalara erişim\" iznine ihtiyacı var.\n\nİzin vermek için ayarlara yönlendirileceksiniz.';

  @override
  String get storagePermissionDeniedDesc =>
      'Depolama izni reddedildi. Lütfen devam etmek için Ayarlar\'dan etkinleştirin.';

  @override
  String get permissionMediaTitle => 'Fotoğraflar, videolar and ses';

  @override
  String get permissionMediaDesc =>
      'Cihazınızda saklanan kopya dosyaları, benzer fotoğrafları, ekran görüntülerini, indirmeleri and büyük medyaları bulmak için kullanılır.';

  @override
  String get permissionAllFilesTitle => 'Tüm dosyalara erişim';

  @override
  String get permissionAllFilesDesc =>
      'Gereksiz dosyalar, APK incelemesi, indirme incelemesi and boş klasörler gibi medya dışı temizleme özellikleri için kullanılır.';

  @override
  String get permissionInstalledAppsTitle => 'Yüklü uygulamalar';

  @override
  String get permissionInstalledAppsDesc =>
      'Uygulama Yöneticisi tarafından başlatıcıda görünen yüklü uygulamaları göstermek and seçtiğinizde Android kaldırma onayını açmak için kullanılır.';

  @override
  String get permissionVisibleProgressTitle => 'Görünür ilerleme';

  @override
  String get permissionVisibleProgressDesc =>
      'Kullanıcı tarafından başlatılan bir görev çalışırken tarama veya temizleme ilerlemesini görünür tutmak için kullanılır.';

  @override
  String get permissionOnDeviceNote =>
      'Tarama and temizleme analizi cihazınızda kalır. Clear Space, bu özellikler için dosyalarınızı bir geliştirici sunucusuna yüklemez.';

  @override
  String get openSettings => 'Ayarları Aç';

  @override
  String get grantPermission => 'İzin Ver';

  @override
  String get getStarted => 'Başla';

  @override
  String get skip => 'Atla';

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
      'Cihazınızı temiz, hızlı and güvenli tutmanın en akıllı yoluna hoş geldiniz.';

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
      'Çöpleri, büyük dosyaları and kopyaları anında bulun and silin.';

  @override
  String get termsDesc =>
      'Devam ederek, Gizlilik Politikamızı kabul etmiş olursunuz.';

  @override
  String get selectLanguage => 'Dilinizi Seçin';

  @override
  String get changeLaterInSettings =>
      'Bunu daha sonra Ayarlar\'dan değiştirebilirsiniz.';

  @override
  String get photosAndImages => 'Fotoğraflar and Resimler';

  @override
  String get videos => 'Videolar';

  @override
  String get audio => 'Ses';

  @override
  String get documentsAndFiles => 'Belgeler and Dosyalar';

  @override
  String get systemAndApps => 'Sistem and Uygulamalar';

  @override
  String get other => 'DİĞER';

  @override
  String get review => 'İncele';

  @override
  String get viewDetails => 'Detayları Görüntüle';

  @override
  String get smartCleanupPlan => 'Akıllı Temizlik Planı';

  @override
  String get analyzingSafeToDelete =>
      'Silinmesi güvenli dosyalar analiz ediliyor...';

  @override
  String get returnToDashboard => 'Panele Dön';

  @override
  String get returnDirectlyToDashboard => 'Doğrudan Panele Dön';

  @override
  String get appearanceAndLanguage => 'Görünüm and Dil';

  @override
  String get supportAndEngagement => 'Destek and Katılım';

  @override
  String get scanPreferences => 'Tarama Tercihleri';

  @override
  String get legalAndAppInfo => 'Yasal and Uygulama Bilgisi';

  @override
  String get cleanupHistory => 'Temizlik Geçmişi';

  @override
  String get viewPastCleaning =>
      'Geçmiş temizlik aktivitelerinizi görüntüleyin';

  @override
  String get sendFeedback => 'Geri Bildirim Gönder';

  @override
  String get reportBugs => 'Hataları bildirin veya iyileştirme önerin';

  @override
  String get rateUs => 'Bize 5 Yıldız Verin';

  @override
  String get helpOthers => 'Başkalarının Clear Space\'i bulmasına yardım edin';

  @override
  String get shareWithFriends => 'Arkadaşlarla Paylaş';

  @override
  String get recommendApp => 'Uygulamayı mesaj yoluyla önerin';

  @override
  String get similarPhotoSensitivity => 'Benzer Fotoğraf Hassasiyeti';

  @override
  String get largeFileThreshold => 'Büyük Dosya Eşiği';

  @override
  String get strict => 'Katı';

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
  String get rulesAndGuidelines => 'Kurallar and yönergeler';

  @override
  String get appVersion => 'Uygulama Sürümü';

  @override
  String get emailRestricted =>
      'E-posta işlevselliği cihaz tarafından kısıtlandı.';

  @override
  String get browserLaunchFailed => 'Tarayıcı başlatılamadı.';

  @override
  String get storeUnavailable => 'Mağaza hizmeti geçici olarak kullanılamıyor.';

  @override
  String get browserRestricted => 'Bu cihazda tarayıcı erişimi kısıtlandı.';

  @override
  String get shareUnavailable => 'Paylaşım işlevselliği kullanılamıyor.';

  @override
  String get keepPhoneClean => 'Clear Space ile telefonunuzu temiz tutun';

  @override
  String get duplicateFiles => 'Kopya Dosyalar';

  @override
  String get findIdenticalFiles => 'Özdeş dosyaları bulun and kaldırın';

  @override
  String get similarPhotos => 'Benzer Fotoğraflar';

  @override
  String get findKeyMoments => 'Önemli fotoğraf anlarını bulun';

  @override
  String get largeFiles => 'Büyük Dosyalar';

  @override
  String filesLargerThan(String size) {
    return '$size boyutundan büyük dosyalar';
  }

  @override
  String get screenshots => 'Ekran Görüntüleri';

  @override
  String get findAndDeleteScreenshots => 'Ekran görüntülerini bulun and silin';

  @override
  String get downloads => 'İndirilenler';

  @override
  String get manageDownloadedFiles => 'İndirilen dosyalarınızı yönetin';

  @override
  String get tempAndLogFiles => 'Geçici and Günlük Dosyaları';

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
  String get safeApkInstallers => 'Güvenli APK Yükleyiciler';

  @override
  String get cleanOldApks => 'Yüklü/eski APK\'ları temizleyin';

  @override
  String get pleaseScanStorageFirst => 'Lütfen önce depolamayı tarayın';

  @override
  String get noJunkFilesFound => 'Gereksiz dosya bulunamadı!';

  @override
  String get cleanupComplete => 'Temizlik tamamlandı!';

  @override
  String cleanupFailed(String error) {
    return 'Temizlik başarısız oldu: $error';
  }

  @override
  String get selectAll => 'Tümünü Seç';

  @override
  String get noLargeFilesFound => 'Büyük dosya bulunamadı!';

  @override
  String get noDuplicatesFound => 'Kopya bulunamadı!';

  @override
  String get delete => 'Sil';

  @override
  String get confirmation => 'Onay';

  @override
  String get clearHistory => 'Geçmişi Temizle';

  @override
  String get clearHistoryConfirm =>
      'Tüm temizlik günlüklerini silmek istediğinizden emin misiniz?';

  @override
  String get clearAll => 'Tümünü Temizle';

  @override
  String get cleanAllSafeItems => 'Tüm Güvenli Öğeleri Temizle';

  @override
  String get deleteFilesQuestion => 'Dosyalar silinsin mi?';

  @override
  String deleteCountScreenshots(int count) {
    return '$count ekran görüntüsünü kalıcı olarak sil?';
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
  String get contactsNotImplemented => 'Kişiler Listesi Uygulanmadı';

  @override
  String get smartSelect => 'Akıllı Seçim';

  @override
  String get junkFiles => 'Gereksiz Dosyalar';

  @override
  String potentialSize(String size) {
    return '$size potansiyel';
  }

  @override
  String get noFilesMatchFilter => 'Bu filtreye uygun dosya yok';

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
  String get uninstallActionDesc => 'Uygulama and tüm verileri silinecektir.';

  @override
  String appsCount(int count) {
    return '$count uygulama';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total uygulama gösteriliyor';
  }

  @override
  String get duplicates => 'Kopyalar';

  @override
  String get similar => 'Benzerler';

  @override
  String get somethingWentWrong => 'Bir şeyler yanlış gitti';

  @override
  String get pageNotFoundDesc => 'Aradığınız sayfa mevcut değil.';

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
      'Benzer fotoğrafların and dosyaların en iyi sürümünü otomatik tutuyoruz.';

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
