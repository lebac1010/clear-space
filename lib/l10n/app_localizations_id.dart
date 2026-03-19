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
  String get grantPermission => 'Berikan Izin';

  @override
  String get getStarted => 'Mulai';

  @override
  String get skip => 'Skip';

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
  String get junkFilesFound => 'File Sampah Ditemukan';

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
  String get refreshingAppList => 'Menyegarkan daftar aplikasi...';

  @override
  String get openingUninstaller => 'Membuka pencopot pemasangan...';

  @override
  String get uninstallApp => 'Copot Aplikasi';

  @override
  String get uninstall => 'Copot Pemasangan';

  @override
  String get sortLargest => 'Terbesar';

  @override
  String get sortSmallest => 'Terkecil';

  @override
  String get sortNewest => 'Terbaru';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Halaman Tidak Ditemukan';

  @override
  String get goToDashboard => 'Ke Dasbor';

  @override
  String get deleteFilesTitle => 'Hapus File';

  @override
  String get smartCleanupPlanTitle => 'Rencana Pembersihan Pintar';

  @override
  String get screenshotsCleanerTitle => 'Pembersih Tangkapan Layar';

  @override
  String get tryAgain => 'Coba Lagi';

  @override
  String get appManagerTitle => 'Manajer Aplikasi';

  @override
  String get searchApps => 'Cari aplikasi...';

  @override
  String get noAppsFound => 'Tidak ada aplikasi';

  @override
  String get noMatchingApps => 'Tidak ada aplikasi cocok';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Apakah Anda yakin ingin mencopot \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'Ini akan menghapus aplikasi dan semua datanya.';

  @override
  String appsCount(int count) {
    return '$count aplikasi';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total aplikasi';
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
  String get allClean => 'Semua bersih!';

  @override
  String get deleting => 'Menghapus...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Hapus $count item ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count item dihapus ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Tindakan tak dapat dibatalkan.';

  @override
  String get cleanupBreakdown => 'Rincian Pembersihan';

  @override
  String get smartCleanupDesc =>
      'Kami secara otomatis menyimpan versi terbaik foto dan file Anda.';

  @override
  String get cleaning => 'Membersihkan...';

  @override
  String cleanUpSize(String size) {
    return 'Bersihkan $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Anda menghemat $size';
  }

  @override
  String get youreAllSet => 'Semuanya Beres!';

  @override
  String get noSmartCleanupItems => 'Tidak ditemukan file duplikat.';

  @override
  String get save => 'Simpan';

  @override
  String get keep => 'SIMPAN';

  @override
  String get deselectAll => 'Batalkan Pilihan Semua';

  @override
  String get images => 'Gambar';

  @override
  String get docs => 'Dokumen';

  @override
  String get others => 'Lainnya';

  @override
  String get all => 'Semua';

  @override
  String deleteConfirmMsg(int count) {
    return 'Apakah Anda yakin ingin menghapus $count file yang dipilih?\n\nFile akan dihapus secara permanen.';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tangkapan layar',
      one: '1 tangkapan layar',
      zero: 'Tidak ada tangkapan layar',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Terpilih: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Hapus Terpilih ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Gagal menghapus file. Coba lagi.';

  @override
  String get systemDefault => 'Standar Sistem';

  @override
  String get light => 'Terang';

  @override
  String get dark => 'Gelap';

  @override
  String get strictSensitivity => 'Ketat (Cocok 95%)';

  @override
  String get normalSensitivity => 'Normal (Cocok 85%)';

  @override
  String get looseSensitivity => 'Longgar (Cocok 75%)';

  @override
  String get sensitivityDesc =>
      'Seberapa ketat aplikasi saat mengidentifikasi foto serupa.';

  @override
  String get strictSensitivityDesc => 'Ketat — Hanya yang sangat mirip';

  @override
  String get normalSensitivityDesc => 'Normal — Disarankan';

  @override
  String get looseSensitivityDesc => 'Longgar — Banyak variasi foto';

  @override
  String get sensitivityUpdated =>
      'Sensitivitas diperbarui. Akan digunakan pada pemindaian berikutnya.';

  @override
  String get thresholdDesc =>
      'File lebih besar dari ini akan ditandai untuk dihapus.';

  @override
  String get thresholdUpdated =>
      'Batas diperbarui. Akan digunakan pada pemindaian berikutnya.';

  @override
  String largerThanSize(String size) {
    return 'Lebih besar dari $size';
  }

  @override
  String get madeWithHeart => 'Dibuat dengan ❤️ untuk ponsel yang lebih bersih';

  @override
  String get versionUnavailable => 'Versi tidak tersedia';

  @override
  String get emailNotSupported => 'Gagal membuka email.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Dasbor Penyimpanan';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count item siap dibersihkan';
  }

  @override
  String get storageBreakdown => 'Rincian Penyimpanan';

  @override
  String get cleanup => 'Pembersihan';

  @override
  String get suggestions => 'Saran';

  @override
  String get analyzing => 'Menganalisis...';

  @override
  String get keepStorageHealthy => 'Jaga ruang ponsel Anda';

  @override
  String get cleanupHeaderDesc => 'File ini dapat dihapus untuk ruang kosong.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Digunakan';
  }

  @override
  String get scanPausedBattery => 'Jeda (Baterai Lemah)';

  @override
  String scanningPhase(String phase) {
    return 'Memindai $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Memindai $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Menghitung...';

  @override
  String get internalStorage => 'PENYIMPANAN INTERNAL';

  @override
  String get free => 'Kosong';

  @override
  String get used => 'Digunakan';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disk';

  @override
  String get phasePhotos => 'Foto';

  @override
  String get phaseVideos => 'Video';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Dokumen';

  @override
  String get phaseJunk => 'Berkas Sampah';

  @override
  String get phaseFolders => 'Folder';

  @override
  String get phaseApks => 'APK';

  @override
  String get phaseSimilar => 'Foto Mirip';

  @override
  String get phaseStorage => 'Penyimpanan';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Digunakan';
  }

  @override
  String get largeFilesTitle => 'File Besar';

  @override
  String get selectYourLanguage => 'Pilih Bahasa';

  @override
  String get analyzingLabel => 'Menganalisis...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count item';
  }
}
