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
  String get systemTheme => 'Auto';

  @override
  String get lightTheme => 'Terang';

  @override
  String get darkTheme => 'Gelap';

  @override
  String get storageAccessRequired => 'Akses Penyimpanan';

  @override
  String get storageAccessDesc =>
      'Clear Space memerlukan \"Akses ke semua file\" untuk memindai perangkat Anda dari file duplikat, file besar, dan file sampah.\n\nAnda akan diarahkan ke Pengaturan Sistem untuk memberikan izin ini.';

  @override
  String get grantPermission => 'Berikan Izin';

  @override
  String get getStarted => 'Mulai';

  @override
  String get next => 'Berikutnya';

  @override
  String get continueText => 'Lanjutkan';

  @override
  String get cancel => 'Batal';

  @override
  String get analyze => 'Analisis';

  @override
  String get loading => 'Memuat...';

  @override
  String get error => 'Kesalahan';

  @override
  String get success => 'Sukses';

  @override
  String get noItemsFound => 'Tidak ada file';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item',
      one: '1 item',
      zero: '0 item',
    );
    return '$_temp0 dipilih';
  }

  @override
  String get onboardingWelcome =>
      'Selamat datang di cara paling cerdas untuk menjaga ponsel Anda bersih, cepat, dan aman.';

  @override
  String get onboardingFeaturesTitle => 'Fitur Canggih';

  @override
  String get onboardingFeaturesDesc =>
      'Semua yang Anda butuhkan untuk mengelola penyimpanan.';

  @override
  String get feature1Title => 'Pahami penyimpanan Anda';

  @override
  String get feature1Desc =>
      'Dapatkan rincian visual yang jelas tentang apa yang menghabiskan ruang.';

  @override
  String get feature2Title => 'Bersihkan dengan aman';

  @override
  String get feature2Desc =>
      'Hapus file yang tidak perlu dengan penghapusan yang aman.';

  @override
  String get feature3Title => 'Kosongkan ruang';

  @override
  String get feature3Desc =>
      'Temukan dan hapus file sampah, file besar, dan duplikat.';

  @override
  String get termsDesc =>
      'Dengan melanjutkan, Anda menyetujui Ketentuan & Privasi kami.';
}
