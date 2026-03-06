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
}
