// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Panel';

  @override
  String get cleanupTitle => 'Limpieza';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Archivos';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Auto';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get storageAccessRequired => 'Se requiere acceso';

  @override
  String get storageAccessDesc =>
      'Clear Space necesita \"Acceso a todos los archivos\" para buscar duplicados, archivos grandes y archivos basura en tu dispositivo.\n\nSerás dirigido a la configuración del sistema para otorgar este permiso cuando toques Conceder Permiso.';

  @override
  String get grantPermission => 'Conceder Permiso';

  @override
  String get getStarted => 'Empezar';

  @override
  String get next => 'Siguiente';

  @override
  String get continueText => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get analyze => 'Analizar';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Éxito';

  @override
  String get noItemsFound => 'No se encontraron elementos';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
      zero: 'Ningún elemento',
    );
    return '$_temp0 seleccionados';
  }

  @override
  String get onboardingWelcome =>
      'Bienvenido a la forma más inteligente de mantener tu dispositivo limpio, rápido y seguro.';

  @override
  String get onboardingFeaturesTitle => 'Funciones potentes';

  @override
  String get onboardingFeaturesDesc =>
      'Todo lo que necesitas para administrar tu almacenamiento de manera eficiente.';

  @override
  String get feature1Title => 'Entiende tu almacenamiento';

  @override
  String get feature1Desc =>
      'Obtén un desglose visual claro de lo que está ocupando espacio.';

  @override
  String get feature2Title => 'Limpia de forma segura';

  @override
  String get feature2Desc =>
      'Elimina archivos innecesarios con protocolos de eliminación seguros.';

  @override
  String get feature3Title => 'Libera espacio';

  @override
  String get feature3Desc =>
      'Encuentra y elimina instantáneamente basura, archivos grandes y duplicados.';

  @override
  String get termsDesc =>
      'Al continuar, aceptas nuestros Términos de Servicio y Política de Privacidad.';
}

/// The translations for Spanish Castilian, as used in Spain (`es_ES`).
class AppLocalizationsEsEs extends AppLocalizationsEs {
  AppLocalizationsEsEs() : super('es_ES');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Panel';

  @override
  String get cleanupTitle => 'Limpieza';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Archivos';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Auto';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get storageAccessRequired => 'Acceso requerido';

  @override
  String get storageAccessDesc =>
      'Clear Space necesita \"Acceso a todos los archivos\" para buscar duplicados, archivos grandes y archivos basura en tu dispositivo.\n\nSe te dirigirá a los Ajustes del sistema para otorgar este permiso cuando toques Conceder acceso.';

  @override
  String get grantPermission => 'Conceder acceso';

  @override
  String get getStarted => 'Empezar';

  @override
  String get next => 'Siguiente';

  @override
  String get continueText => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get analyze => 'Analizar';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Éxito';

  @override
  String get noItemsFound => 'No se encontraron elementos';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
      zero: 'Ningún elemento',
    );
    return '$_temp0 seleccionados';
  }

  @override
  String get onboardingWelcome =>
      'Bienvenido a la forma más inteligente de mantener tu dispositivo limpio, rápido y seguro.';

  @override
  String get onboardingFeaturesTitle => 'Funciones potentes';

  @override
  String get onboardingFeaturesDesc =>
      'Todo lo que necesitas para gestionar tu almacenamiento de manera eficiente.';

  @override
  String get feature1Title => 'Entiende tu almacenamiento';

  @override
  String get feature1Desc =>
      'Obtén un desglose visual claro de lo que está ocupando espacio.';

  @override
  String get feature2Title => 'Limpia de forma segura';

  @override
  String get feature2Desc =>
      'Elimina archivos innecesarios con protocolos de eliminación seguros.';

  @override
  String get feature3Title => 'Libera espacio';

  @override
  String get feature3Desc =>
      'Encuentra y elimina al instante basura, archivos grandes y duplicados.';

  @override
  String get termsDesc =>
      'Al continuar, aceptas nuestros Términos de servicio y Política de privacidad.';
}
