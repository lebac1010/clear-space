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
  String get storagePermissionDeniedDesc =>
      'Se denegó el permiso de almacenamiento. Por favor, actívalo en Ajustes para continuar.';

  @override
  String get permissionMediaTitle => 'Fotos, videos y audio';

  @override
  String get permissionMediaDesc =>
      'Se usa para encontrar archivos duplicados, fotos similares, capturas de pantalla, descargas y archivos grandes en tu dispositivo.';

  @override
  String get permissionAllFilesTitle => 'Acceso a todos los archivos';

  @override
  String get permissionAllFilesDesc =>
      'Se usa para funciones de limpieza que no son de medios, como archivos basura, revisión de APKs, revisión de descargas y carpetas vacías.';

  @override
  String get permissionInstalledAppsTitle => 'Aplicaciones instaladas';

  @override
  String get permissionInstalledAppsDesc =>
      'Se usa en el Gestor de aplicaciones para mostrar las aplicaciones instaladas visibles en el lanzador y abrir la confirmación de desinstalación de Android cuando elijas.';

  @override
  String get permissionVisibleProgressTitle => 'Progreso visible';

  @override
  String get permissionVisibleProgressDesc =>
      'Se usa para mantener visible el progreso del escaneo o la limpieza mientras se ejecuta una tarea iniciada por el usuario.';

  @override
  String get permissionOnDeviceNote =>
      'El escaneo y el análisis de limpieza permanecen en tu dispositivo. Clear Space no sube tus archivos a un servidor externo para estas funciones.';

  @override
  String get openSettings => 'Abrir Ajustes';

  @override
  String get grantPermission => 'Conceder Permiso';

  @override
  String get getStarted => 'Empezar';

  @override
  String get skip => 'Saltar';

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

  @override
  String get selectLanguage => 'Selecciona tu idioma';

  @override
  String get changeLaterInSettings =>
      'Puedes cambiar esto más tarde en Ajustes.';

  @override
  String get photosAndImages => 'Fotos e imágenes';

  @override
  String get videos => 'Videos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Documentos y archivos';

  @override
  String get systemAndApps => 'Sistema y aplicaciones';

  @override
  String get other => 'OTRO';

  @override
  String get review => 'Revisar';

  @override
  String get viewDetails => 'Ver detalles';

  @override
  String get smartCleanupPlan => 'Plan de limpieza inteligente';

  @override
  String get analyzingSafeToDelete =>
      'Analizando archivos seguros para eliminar...';

  @override
  String get returnToDashboard => 'Volver al Panel';

  @override
  String get returnDirectlyToDashboard => 'Volver directamente al Panel';

  @override
  String get appearanceAndLanguage => 'Apariencia e idioma';

  @override
  String get supportAndEngagement => 'Soporte e interacción';

  @override
  String get scanPreferences => 'Preferencias de escaneo';

  @override
  String get legalAndAppInfo => 'Información legal y de la aplicación';

  @override
  String get cleanupHistory => 'Historial de limpieza';

  @override
  String get viewPastCleaning => 'Ver tus actividades de limpieza pasadas';

  @override
  String get sendFeedback => 'Enviar comentarios';

  @override
  String get reportBugs => 'Informar de errores o sugerir mejoras';

  @override
  String get rateUs => 'Califícanos con 5 estrellas';

  @override
  String get helpOthers => 'Ayuda a otros a encontrar Clear Space';

  @override
  String get shareWithFriends => 'Compartir con amigos';

  @override
  String get recommendApp => 'Recomendar la aplicación por mensaje';

  @override
  String get similarPhotoSensitivity => 'Sensibilidad de fotos similares';

  @override
  String get largeFileThreshold => 'Umbral de archivos grandes';

  @override
  String get strict => 'Estricto';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Flexible';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get howWeProtectData => 'Cómo protegemos tus datos';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get rulesAndGuidelines => 'Reglas y pautas';

  @override
  String get appVersion => 'Versión de la aplicación';

  @override
  String get emailRestricted =>
      'La funcionalidad de correo está restringida en este dispositivo.';

  @override
  String get browserLaunchFailed => 'No se pudo abrir el navegador.';

  @override
  String get storeUnavailable =>
      'El servicio de la tienda no está disponible temporalmente.';

  @override
  String get browserRestricted =>
      'El acceso al navegador está restringido en este dispositivo.';

  @override
  String get shareUnavailable => 'La función de compartir no está disponible.';

  @override
  String get keepPhoneClean => 'Mantén tu teléfono limpio con Clear Space';

  @override
  String get duplicateFiles => 'Archivos duplicados';

  @override
  String get findIdenticalFiles => 'Busca y elimina archivos idénticos';

  @override
  String get similarPhotos => 'Fotos similares';

  @override
  String get findKeyMoments => 'Encuentra momentos clave en tus fotos';

  @override
  String get largeFiles => 'Archivos grandes';

  @override
  String filesLargerThan(String size) {
    return 'Archivos mayores a $size';
  }

  @override
  String get screenshots => 'Capturas de pantalla';

  @override
  String get findAndDeleteScreenshots => 'Busca y elimina capturas de pantalla';

  @override
  String get downloads => 'Descargas';

  @override
  String get manageDownloadedFiles => 'Administra tus archivos descargados';

  @override
  String get tempAndLogFiles => 'Archivos temporales y de registro';

  @override
  String sizeFound(String size) {
    return '$size encontrados';
  }

  @override
  String get emptyFolders => 'Carpetas vacías';

  @override
  String emptyFoldersFound(int count) {
    return 'Se encontraron $count carpetas vacías';
  }

  @override
  String get safeApkInstallers => 'Instaladores APK seguros';

  @override
  String get cleanOldApks => 'Limpiar APKs instalados o antiguos';

  @override
  String get pleaseScanStorageFirst =>
      'Por favor, escanea el almacenamiento primero';

  @override
  String get noJunkFilesFound => '¡No se encontraron archivos basura!';

  @override
  String get cleanupComplete => '¡Limpieza completada!';

  @override
  String cleanupFailed(String error) {
    return 'Error en la limpieza: $error';
  }

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String get noLargeFilesFound => '¡No se encontraron archivos grandes!';

  @override
  String get noDuplicatesFound => '¡No se encontraron duplicados!';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirmation => 'Confirmación';

  @override
  String get clearHistory => 'Borrar historial';

  @override
  String get clearHistoryConfirm =>
      '¿Estás seguro de que quieres borrar todos los registros de limpieza?';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get cleanAllSafeItems => 'Limpiar todos los elementos seguros';

  @override
  String get deleteFilesQuestion => '¿Eliminar archivos?';

  @override
  String deleteCountScreenshots(int count) {
    return '¿Eliminar $count capturas de pantalla permanentemente?';
  }

  @override
  String get screenshotsDeletedSuccess =>
      'Capturas de pantalla eliminadas con éxito';

  @override
  String get junkFilesFound => 'Archivos basura encontrados';

  @override
  String get noPhotosFound => 'No se encontraron fotos';

  @override
  String errorLoadingPhotos(String error) {
    return 'Error al cargar las fotos: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Error al eliminar: $error';
  }

  @override
  String get contacts => 'Contactos';

  @override
  String get contactsNotImplemented => 'Lista de contactos no implementada';

  @override
  String get smartSelect => 'Selección inteligente';

  @override
  String get junkFiles => 'Archivos basura';

  @override
  String potentialSize(String size) {
    return '$size potencial';
  }

  @override
  String get noFilesMatchFilter => 'Ningún archivo coincide con este filtro';

  @override
  String get refreshingAppList => 'Actualizando lista de aplicaciones...';

  @override
  String get openingUninstaller => 'Abriendo desinstalador...';

  @override
  String get uninstallApp => 'Desinstalar aplicación';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get sortLargest => 'Más grandes';

  @override
  String get sortSmallest => 'Más pequeños';

  @override
  String get sortNewest => 'Más recientes';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Página no encontrada';

  @override
  String get goToDashboard => 'Ir al Panel';

  @override
  String get deleteFilesTitle => 'Eliminar archivos';

  @override
  String get smartCleanupPlanTitle => 'Plan de limpieza inteligente';

  @override
  String get screenshotsCleanerTitle => 'Limpiador de capturas';

  @override
  String get tryAgain => 'Reintentar';

  @override
  String get appManagerTitle => 'Gestor de aplicaciones';

  @override
  String get searchApps => 'Buscar aplicaciones...';

  @override
  String get noAppsFound => 'No se encontraron aplicaciones';

  @override
  String get noMatchingApps => 'Sin coincidencias';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return '¿Seguro que quieres desinstalar \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'Se eliminará la aplicación y todos sus datos.';

  @override
  String appsCount(int count) {
    return '$count aplicaciones';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total aplicaciones';
  }

  @override
  String get duplicates => 'Duplicados';

  @override
  String get similar => 'Similares';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get pageNotFoundDesc => 'La página que buscas no existe.';

  @override
  String get allClean => '¡Todo limpio!';

  @override
  String get deleting => 'Eliminando...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Eliminar $count elementos ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Eliminados $count elementos ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Esta acción no se puede deshacer.';

  @override
  String get cleanupBreakdown => 'Resumen de limpieza';

  @override
  String get smartCleanupDesc =>
      'Conservamos automáticamente la mejor versión de tus fotos y archivos.';

  @override
  String get cleaning => 'Limpiando...';

  @override
  String cleanUpSize(String size) {
    return 'Liberar $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Has ahorrado $size';
  }

  @override
  String get youreAllSet => '¡Todo listo!';

  @override
  String get noSmartCleanupItems =>
      'No se encontraron archivos duplicados o similares.';

  @override
  String get save => 'Guardar';

  @override
  String get keep => 'MANTENER';

  @override
  String get deselectAll => 'Deseleccionar todo';

  @override
  String get images => 'Imágenes';

  @override
  String get docs => 'Documentos';

  @override
  String get others => 'Otros';

  @override
  String get all => 'Todos';

  @override
  String deleteConfirmMsg(int count) {
    return '¿Seguro que quieres eliminar $count archivos seleccionados?\n\nSe moverán a la papelera o se eliminarán definitivamente.';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas',
      one: '1 captura',
      zero: 'Sin capturas',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Seleccionado: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Eliminar selección ($size)';
  }

  @override
  String get deleteFailedGeneral =>
      'Error al eliminar algunos elementos. Inténtalo de nuevo.';

  @override
  String get systemDefault => 'Por defecto';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get strictSensitivity => 'Estricto (Coincidencia 95%)';

  @override
  String get normalSensitivity => 'Normal (Coincidencia 85%)';

  @override
  String get looseSensitivity => 'Flexible (Coincidencia 75%)';

  @override
  String get sensitivityDesc =>
      'Elige qué tan estricta es la aplicación al identificar fotos similares. Una configuración estricta significa que las fotos deben ser casi idénticas.';

  @override
  String get strictSensitivityDesc => 'Coincidencia 95% — Solo casi idénticas';

  @override
  String get normalSensitivityDesc => 'Coincidencia 85% — Recomendado';

  @override
  String get looseSensitivityDesc =>
      'Coincidencia 75% — Captura más variaciones';

  @override
  String get sensitivityUpdated =>
      'Límite de sensibilidad actualizado. Se aplicará en el próximo escaneo.';

  @override
  String get thresholdDesc =>
      'Los archivos por encima de este valor se marcarán para su eliminación.';

  @override
  String get thresholdUpdated =>
      'Límite de tamaño actualizado. Se aplicará en el próximo escaneo.';

  @override
  String largerThanSize(String size) {
    return 'Mayores a $size';
  }

  @override
  String get madeWithHeart => 'Hecho con ❤️ para un teléfono más limpio';

  @override
  String get versionUnavailable => 'Versión no disponible';

  @override
  String get emailNotSupported =>
      'No se pudo abrir el correo. Escríbenos directamente.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Panel de almacenamiento';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count elementos a limpiar';
  }

  @override
  String get storageBreakdown => 'Desglose de uso';

  @override
  String get cleanup => 'Limpiar';

  @override
  String get suggestions => 'Sugerencias';

  @override
  String get analyzing => 'Analizando...';

  @override
  String get keepStorageHealthy => 'Mantén tu memoria sana';

  @override
  String get cleanupHeaderDesc =>
      'Encontramos archivos que podrías eliminar para liberar espacio.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Usado';
  }

  @override
  String get scanPausedBattery => 'Pausado (Batería baja)';

  @override
  String scanningPhase(String phase) {
    return 'Escaneando $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Escaneando $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Calculando...';

  @override
  String get internalStorage => 'ALMACENAMIENTO';

  @override
  String get free => 'Libre';

  @override
  String get used => 'Usado';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disco';

  @override
  String get phasePhotos => 'Fotos';

  @override
  String get phaseVideos => 'Videos';

  @override
  String get phaseAudio => 'Audio';

  @override
  String get phaseDocuments => 'Docs';

  @override
  String get phaseJunk => 'Basura';

  @override
  String get phaseFolders => 'Carpetas';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Fotos similares';

  @override
  String get phaseStorage => 'Memoria';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Usado';
  }

  @override
  String get largeFilesTitle => 'Archivos grandes';

  @override
  String get selectYourLanguage => 'Elige tu idioma';

  @override
  String get analyzingLabel => 'Analizando...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count elementos';
  }
}
