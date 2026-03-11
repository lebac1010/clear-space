// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dasbor';

  @override
  String get cleanupTitle => 'Pembersihan';

  @override
  String get photosTitle => 'Foto';

  @override
  String get filesTitle => 'File';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get languageTitle => 'Bahasa';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Default Sistem';

  @override
  String get lightTheme => 'Terang';

  @override
  String get darkTheme => 'Gelap';

  @override
  String get storageAccessRequired => 'Akses Penyimpanan Diperlukan';

  @override
  String get storageAccessDesc =>
      'Clear Space memerlukan \"Akses ke semua file\" untuk memindai perangkat Anda dari file duplikat, file besar, dan file sampah.\n\nAnda akan diarahkan ke Pengaturan Sistem untuk memberikan izin ini setelah mengetuk Berikan Izin.';

  @override
  String get grantPermission => 'Berikan Izin';

  @override
  String get getStarted => 'Mulai';

  @override
  String get next => 'Selanjutnya';

  @override
  String get continueText => 'Lanjutkan';

  @override
  String get cancel => 'Batal';

  @override
  String get analyze => 'Analisis';

  @override
  String get loading => 'Memuat...';

  @override
  String get error => 'Galat';

  @override
  String get success => 'Sukses';

  @override
  String get noItemsFound => 'Tidak ada item ditemukan';

  @override
  String itemsSelected(int count) {
    return '$count item dipilih';
  }

  @override
  String get onboardingWelcome =>
      'Selamat datang di cara paling cerdas untuk menjaga perangkat Anda tetap bersih, cepat, dan aman.';

  @override
  String get onboardingFeaturesTitle => 'Fitur Canggih';

  @override
  String get onboardingFeaturesDesc =>
      'Semua yang Anda butuhkan untuk mengelola penyimpanan secara efisien.';

  @override
  String get feature1Title => 'Pahami penyimpanan Anda';

  @override
  String get feature1Desc =>
      'Dapatkan rincian visual yang jelas tentang apa yang menghabiskan ruang.';

  @override
  String get feature2Title => 'Bersihkan dengan aman';

  @override
  String get feature2Desc =>
      'Hapus file yang tidak perlu dengan protokol penghapusan yang aman.';

  @override
  String get feature3Title => 'Kosongkan ruang';

  @override
  String get feature3Desc =>
      'Temukan dan hapus file sampah, file besar, dan duplikat secara instan.';

  @override
  String get termsDesc =>
      'Dengan melanjutkan, Anda menyetujui Ketentuan Layanan & Kebijakan Privasi kami.';

  @override
  String get selectLanguage => 'Pilih Bahasa Anda';

  @override
  String get changeLaterInSettings =>
      'Anda dapat mengubahnya nanti di Pengaturan.';

  @override
  String get photosAndImages => 'Foto & Gambar';

  @override
  String get videos => 'Video';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Dokumen & File';

  @override
  String get systemAndApps => 'Sistem & Aplikasi';

  @override
  String get other => 'LAINNYA';

  @override
  String get review => 'Tinjau';

  @override
  String get viewDetails => 'Lihat Detail';

  @override
  String get smartCleanupPlan => 'Rencana Pembersihan Pintar';

  @override
  String get analyzingSafeToDelete =>
      'Menganalisis file yang aman untuk dihapus...';

  @override
  String get returnToDashboard => 'Kembali ke Dasbor';

  @override
  String get returnDirectlyToDashboard => 'Langsung kembali ke Dasbor';

  @override
  String get appearanceAndLanguage => 'Penampilan & Bahasa';

  @override
  String get supportAndEngagement => 'Dukungan & Keterlibatan';

  @override
  String get scanPreferences => 'Preferensi Pemindaian';

  @override
  String get legalAndAppInfo => 'Info Hukum & Aplikasi';

  @override
  String get cleanupHistory => 'Riwayat Pembersihan';

  @override
  String get viewPastCleaning => 'Lihat aktivitas pembersihan Anda sebelumnya';

  @override
  String get sendFeedback => 'Kirim Umpan Balik';

  @override
  String get reportBugs => 'Laporkan bug atau sarankan peningkatan';

  @override
  String get rateUs => 'Beri Kami Nilai 5 Bintang';

  @override
  String get helpOthers => 'Bantu orang lain menemukan Clear Space';

  @override
  String get shareWithFriends => 'Bagikan dengan Teman';

  @override
  String get recommendApp => 'Rekomendasikan aplikasi melalui pesan';

  @override
  String get similarPhotoSensitivity => 'Sensitivitas Foto Serupa';

  @override
  String get largeFileThreshold => 'Ambang Batas File Besar';

  @override
  String get strict => 'Ketat';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Longgar';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get howWeProtectData => 'Bagaimana kami melindungi data Anda';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get rulesAndGuidelines => 'Aturan dan pedoman';

  @override
  String get appVersion => 'Versi Aplikasi';

  @override
  String get emailRestricted => 'Fungsionalitas email dibatasi oleh perangkat.';

  @override
  String get browserLaunchFailed => 'Tidak dapat meluncurkan peramban.';

  @override
  String get storeUnavailable => 'Layanan toko untuk sementara tidak tersedia.';

  @override
  String get browserRestricted => 'Akses peramban dibatasi pada perangkat ini.';

  @override
  String get shareUnavailable => 'Fungsionalitas berbagi tidak tersedia.';

  @override
  String get keepPhoneClean =>
      'Jaga ponsel Anda tetap bersih dengan Clear Space';

  @override
  String get duplicateFiles => 'File Duplikat';

  @override
  String get findIdenticalFiles => 'Temukan dan hapus file yang identik';

  @override
  String get similarPhotos => 'Foto Serupa';

  @override
  String get findKeyMoments => 'Temukan momen foto utama';

  @override
  String get largeFiles => 'File Besar';

  @override
  String filesLargerThan(String size) {
    return 'File lebih besar dari $size';
  }

  @override
  String get screenshots => 'Tangkapan Layar';

  @override
  String get findAndDeleteScreenshots => 'Temukan dan hapus tangkapan layar';

  @override
  String get downloads => 'Unduhan';

  @override
  String get manageDownloadedFiles => 'Kelola file yang Anda unduh';

  @override
  String get tempAndLogFiles => 'File Sementara & Log';

  @override
  String sizeFound(String size) {
    return '$size ditemukan';
  }

  @override
  String get emptyFolders => 'Folder Kosong';

  @override
  String emptyFoldersFound(int count) {
    return '$count folder kosong ditemukan';
  }

  @override
  String get safeApkInstallers => 'Pemasang APK Aman';

  @override
  String get cleanOldApks => 'Bersihkan APK yang terinstal/lama';

  @override
  String get pleaseScanStorageFirst =>
      'Harap pindai penyimpanan terlebih dahulu';

  @override
  String get noJunkFilesFound => 'Tidak ditemukan file sampah!';

  @override
  String get cleanupComplete => 'Pembersihan selesai!';

  @override
  String cleanupFailed(String error) {
    return 'Pembersihan gagal: $error';
  }

  @override
  String get selectAll => 'Pilih Semua';

  @override
  String get noLargeFilesFound => 'Tidak ditemukan file besar!';

  @override
  String get noDuplicatesFound => 'Tidak ada duplikat yang ditemukan!';

  @override
  String get delete => 'Hapus';

  @override
  String get confirmation => 'Konfirmasi';

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
  String get deleteFilesQuestion => 'Hapus file?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Hapus $count tangkapan layar secara permanen?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Tangkapan layar berhasil dihapus';

  @override
  String get junkFilesFound => 'Junk Files Found (id)';

  @override
  String get noPhotosFound => 'Tidak ada foto yang ditemukan';

  @override
  String errorLoadingPhotos(String error) {
    return 'Galat memuat foto: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Penghapusan gagal: $error';
  }

  @override
  String get contacts => 'Kontak';

  @override
  String get contactsNotImplemented => 'Daftar Kontak Tidak Diimplementasikan';

  @override
  String get smartSelect => 'Pilih Pintar';

  @override
  String get junkFiles => 'File Sampah';

  @override
  String potentialSize(String size) {
    return '$size potensial';
  }

  @override
  String get noFilesMatchFilter =>
      'Tidak ada file yang cocok dengan filter ini';

  @override
  String get refreshingAppList => 'Refreshing app list... (id)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (id)';

  @override
  String get uninstallApp => 'Uninstall App (id)';

  @override
  String get uninstall => 'Uninstall (id)';

  @override
  String get sortLargest => 'Largest (id)';

  @override
  String get sortSmallest => 'Smallest (id)';

  @override
  String get sortNewest => 'Newest (id)';

  @override
  String get sortAZ => 'A-Z (id)';

  @override
  String get pageNotFound => 'Page Not Found (id)';

  @override
  String get goToDashboard => 'Go to Dashboard (id)';

  @override
  String get deleteFilesTitle => 'Delete Files (id)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (id)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (id)';

  @override
  String get tryAgain => 'Try Again (id)';

  @override
  String get appManagerTitle => 'App Manager (id)';

  @override
  String get searchApps => 'Search apps... (id)';

  @override
  String get noAppsFound => 'No apps found (id)';

  @override
  String get noMatchingApps => 'No matching apps (id)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (id)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (id)';

  @override
  String appsCount(int count) {
    return '$count apps (id)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (id)';
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
  String get allClean => 'All clean! (id)';

  @override
  String get deleting => 'Deleting... (id)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (id)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (id)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (id)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (id)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (id)';

  @override
  String get cleaning => 'Cleaning... (id)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (id)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (id)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (id)';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found. (id)';

  @override
  String get save => 'Save (id)';

  @override
  String get keep => 'KEEP (id)';

  @override
  String get deselectAll => 'Deselect All (id)';

  @override
  String get images => 'Images (id)';

  @override
  String get docs => 'Docs (id)';

  @override
  String get others => 'Others (id)';

  @override
  String get all => 'All (id)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (id)';
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
    return '$_temp0 (id)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (id)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (id)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (id)';

  @override
  String get systemDefault => 'System Default (id)';

  @override
  String get light => 'Light (id)';

  @override
  String get dark => 'Dark (id)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (id)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (id)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (id)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (id)';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only (id)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (id)';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations (id)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (id)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (id)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (id)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (id)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (id)';

  @override
  String get versionUnavailable => 'Version unavailable (id)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (id)';

  @override
  String get clearSpace => 'Clear Space (id)';

  @override
  String get storageDashboard => 'Storage Dashboard (id)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (id)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (id)';

  @override
  String get cleanup => 'Cleanup (id)';

  @override
  String get suggestions => 'Suggestions (id)';

  @override
  String get analyzing => 'Analyzing... (id)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (id)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (id)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (id)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (id)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (id)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (id)';
  }

  @override
  String get calculating => 'Calculating... (id)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (id)';

  @override
  String get free => 'Free (id)';

  @override
  String get used => 'Used (id)';

  @override
  String get total => 'Total (id)';

  @override
  String get phaseDisk => 'Disk (id)';

  @override
  String get phasePhotos => 'Photos (id)';

  @override
  String get phaseVideos => 'Videos (id)';

  @override
  String get phaseAudio => 'Audio (id)';

  @override
  String get phaseDocuments => 'Documents (id)';

  @override
  String get phaseJunk => 'Junk Files (id)';

  @override
  String get phaseFolders => 'Folders (id)';

  @override
  String get phaseApks => 'APKs (id)';

  @override
  String get phaseSimilar => 'Similar Photos (id)';

  @override
  String get phaseStorage => 'Storage (id)';

  @override
  String totalSize(String size) {
    return '$size Total (id)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (id)';
  }

  @override
  String get largeFilesTitle => 'Large Files (id)';

  @override
  String get selectYourLanguage => 'Select Your Language (id)';

  @override
  String get analyzingLabel => 'Menganalisis...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count item';
  }
}
