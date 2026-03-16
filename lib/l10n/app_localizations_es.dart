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
  String get junkFilesFound => 'Archivos basura encontrados';

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
  String get duplicates => 'Duplicates';

  @override
  String get similar => 'Similar';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get pageNotFoundDesc => 'The page you are looking for does not exist.';

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

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class AppLocalizationsEs419 extends AppLocalizationsEs {
  AppLocalizationsEs419() : super('es_419');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Panel';

  @override
  String get cleanupTitle => 'Limpiar';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Archivos';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Predeterminado del Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get storageAccessRequired => 'Se Requiere Acceso Al Almacenamiento';

  @override
  String get storageAccessDesc =>
      'Clear Space necesita \"Acceso a todos los archivos\" para escanear tu dispositivo en busca de duplicados, archivos grandes y basura.\n\nSerás dirigido a la Configuración del Sistema para otorgar este permiso cuando toques Otorgar Permiso.';

  @override
  String get grantPermission => 'Otorgar Permiso';

  @override
  String get getStarted => 'Comenzar';

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
    return '$count elementos seleccionados';
  }

  @override
  String get onboardingWelcome =>
      'Bienvenido a la forma más inteligente de mantener tu dispositivo limpio, rápido y seguro.';

  @override
  String get onboardingFeaturesTitle => 'Características Potentes';

  @override
  String get onboardingFeaturesDesc =>
      'Todo lo que necesitas para administrar tu almacenamiento eficientemente.';

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
      'Encuentra y elimina basura, archivos grandes y duplicados al instante.';

  @override
  String get termsDesc =>
      'Al continuar, aceptas nuestros Términos de Servicio y Política de Privacidad.';

  @override
  String get selectLanguage => 'Selecciona tu Idioma';

  @override
  String get changeLaterInSettings =>
      'Puedes cambiar esto más tarde en Configuración.';

  @override
  String get photosAndImages => 'Fotos e Imágenes';

  @override
  String get videos => 'Videos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Documentos y Archivos';

  @override
  String get systemAndApps => 'Sistema y Aplicaciones';

  @override
  String get other => 'OTROS';

  @override
  String get review => 'Revisar';

  @override
  String get viewDetails => 'Ver Detalles';

  @override
  String get smartCleanupPlan => 'Plan De Limpieza Inteligente';

  @override
  String get analyzingSafeToDelete =>
      'Analizando archivos seguros para eliminar...';

  @override
  String get returnToDashboard => 'Volver al Panel';

  @override
  String get returnDirectlyToDashboard => 'Volver directamente al Panel';

  @override
  String get appearanceAndLanguage => 'Apariencia e Idioma';

  @override
  String get supportAndEngagement => 'Soporte y Participación';

  @override
  String get scanPreferences => 'Preferencias de Escaneo';

  @override
  String get legalAndAppInfo => 'Legal e Información de la App';

  @override
  String get cleanupHistory => 'Historial de Limpieza';

  @override
  String get viewPastCleaning => 'Ver tus actividades de limpieza pasadas';

  @override
  String get sendFeedback => 'Enviar Comentarios';

  @override
  String get reportBugs => 'Reportar errores o sugerir mejoras';

  @override
  String get rateUs => 'Califícanos 5 Estrellas';

  @override
  String get helpOthers => 'Ayuda a otros a encontrar Clear Space';

  @override
  String get shareWithFriends => 'Compartir con Amigos';

  @override
  String get recommendApp => 'Recomendar la aplicación vía mensajes';

  @override
  String get similarPhotoSensitivity => 'Sensibilidad de Fotos Similares';

  @override
  String get largeFileThreshold => 'Umbral de Archivos Grandes';

  @override
  String get strict => 'Estricto';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Relajado';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get howWeProtectData => 'Cómo protegemos tus datos';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get rulesAndGuidelines => 'Reglas y directrices';

  @override
  String get appVersion => 'Versión de la App';

  @override
  String get emailRestricted =>
      'Funcionalidad de correo electrónico restringida por el dispositivo.';

  @override
  String get browserLaunchFailed => 'No se pudo abrir el navegador.';

  @override
  String get storeUnavailable =>
      'Servicio de la tienda temporalmente no disponible.';

  @override
  String get browserRestricted =>
      'Acceso al navegador restringido en este dispositivo.';

  @override
  String get shareUnavailable => 'Funcionalidad de compartir no disponible.';

  @override
  String get keepPhoneClean => 'Mantén tu teléfono limpio con Clear Space';

  @override
  String get duplicateFiles => 'Archivos Duplicados';

  @override
  String get findIdenticalFiles => 'Encuentra y elimina archivos idénticos';

  @override
  String get similarPhotos => 'Fotos Similares';

  @override
  String get findKeyMoments => 'Encuentra los momentos clave de las fotos';

  @override
  String get largeFiles => 'Archivos Grandes';

  @override
  String filesLargerThan(String size) {
    return 'Archivos mayores de $size';
  }

  @override
  String get screenshots => 'Capturas de pantalla';

  @override
  String get findAndDeleteScreenshots =>
      'Encuentra y elimina capturas de pantalla';

  @override
  String get downloads => 'Descargas';

  @override
  String get manageDownloadedFiles => 'Administra tus archivos descargados';

  @override
  String get tempAndLogFiles => 'Archivos Temporales y de Registro';

  @override
  String sizeFound(String size) {
    return '$size encontrados';
  }

  @override
  String get emptyFolders => 'Carpetas Vacías';

  @override
  String emptyFoldersFound(int count) {
    return '$count carpetas vacías encontradas';
  }

  @override
  String get safeApkInstallers => 'Instaladores APK Seguros';

  @override
  String get cleanOldApks => 'Limpia APKs instaladas/antiguas';

  @override
  String get pleaseScanStorageFirst =>
      'Por favor, escanea el almacenamiento primero';

  @override
  String get noJunkFilesFound => '¡No se encontraron archivos basura!';

  @override
  String get cleanupComplete => '¡Limpieza completada!';

  @override
  String cleanupFailed(String error) {
    return 'La limpieza falló: $error';
  }

  @override
  String get selectAll => 'Seleccionar Todo';

  @override
  String get noLargeFilesFound => '¡No se encontraron archivos grandes!';

  @override
  String get noDuplicatesFound => '¡No se encontraron duplicados!';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirmation => 'Confirmación';

  @override
  String get deleteFilesQuestion => '¿Eliminar archivos?';

  @override
  String deleteCountScreenshots(int count) {
    return '¿Eliminar permanentemente $count capturas de pantalla?';
  }

  @override
  String get screenshotsDeletedSuccess =>
      'Capturas de pantalla eliminadas con éxito';

  @override
  String get junkFilesFound => 'Junk Files Found (es_419)';

  @override
  String get noPhotosFound => 'No se encontraron fotos';

  @override
  String errorLoadingPhotos(String error) {
    return 'Error cargando fotos: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Fallo al eliminar: $error';
  }

  @override
  String get contacts => 'Contactos';

  @override
  String get contactsNotImplemented => 'Lista de contactos no implementada';

  @override
  String get smartSelect => 'Selección Inteligente';

  @override
  String get junkFiles => 'Archivos Basura';

  @override
  String potentialSize(String size) {
    return '$size potencial';
  }

  @override
  String get noFilesMatchFilter => 'Ningún archivo coincide con este filtro';

  @override
  String get refreshingAppList => 'Refreshing app list... (es_419)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (es_419)';

  @override
  String get uninstallApp => 'Uninstall App (es_419)';

  @override
  String get uninstall => 'Uninstall (es_419)';

  @override
  String get sortLargest => 'Largest (es_419)';

  @override
  String get sortSmallest => 'Smallest (es_419)';

  @override
  String get sortNewest => 'Newest (es_419)';

  @override
  String get sortAZ => 'A-Z (es_419)';

  @override
  String get pageNotFound => 'Page Not Found (es_419)';

  @override
  String get goToDashboard => 'Go to Dashboard (es_419)';

  @override
  String get deleteFilesTitle => 'Delete Files (es_419)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (es_419)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (es_419)';

  @override
  String get tryAgain => 'Try Again (es_419)';

  @override
  String get appManagerTitle => 'App Manager (es_419)';

  @override
  String get searchApps => 'Search apps... (es_419)';

  @override
  String get noAppsFound => 'No apps found (es_419)';

  @override
  String get noMatchingApps => 'No matching apps (es_419)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (es_419)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (es_419)';

  @override
  String appsCount(int count) {
    return '$count apps (es_419)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (es_419)';
  }

  @override
  String get allClean => 'All clean! (es_419)';

  @override
  String get deleting => 'Deleting... (es_419)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (es_419)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (es_419)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (es_419)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (es_419)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (es_419)';

  @override
  String get cleaning => 'Cleaning... (es_419)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (es_419)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (es_419)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (es_419)';

  @override
  String get noSmartCleanupItems =>
      'No duplicate or similar files found. (es_419)';

  @override
  String get save => 'Save (es_419)';

  @override
  String get keep => 'KEEP (es_419)';

  @override
  String get deselectAll => 'Deselect All (es_419)';

  @override
  String get images => 'Images (es_419)';

  @override
  String get docs => 'Docs (es_419)';

  @override
  String get others => 'Others (es_419)';

  @override
  String get all => 'All (es_419)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (es_419)';
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
    return '$_temp0 (es_419)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (es_419)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (es_419)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (es_419)';

  @override
  String get systemDefault => 'System Default (es_419)';

  @override
  String get light => 'Light (es_419)';

  @override
  String get dark => 'Dark (es_419)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (es_419)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (es_419)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (es_419)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (es_419)';

  @override
  String get strictSensitivityDesc =>
      '95% Match — Nearly identical only (es_419)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (es_419)';

  @override
  String get looseSensitivityDesc =>
      '75% Match — Catches more variations (es_419)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (es_419)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (es_419)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (es_419)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (es_419)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (es_419)';

  @override
  String get versionUnavailable => 'Version unavailable (es_419)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (es_419)';

  @override
  String get clearSpace => 'Clear Space (es_419)';

  @override
  String get storageDashboard => 'Storage Dashboard (es_419)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (es_419)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (es_419)';

  @override
  String get cleanup => 'Cleanup (es_419)';

  @override
  String get suggestions => 'Suggestions (es_419)';

  @override
  String get analyzing => 'Analyzing... (es_419)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (es_419)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (es_419)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (es_419)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (es_419)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (es_419)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (es_419)';
  }

  @override
  String get calculating => 'Calculating... (es_419)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (es_419)';

  @override
  String get free => 'Free (es_419)';

  @override
  String get used => 'Used (es_419)';

  @override
  String get total => 'Total (es_419)';

  @override
  String get phaseDisk => 'Disk (es_419)';

  @override
  String get phasePhotos => 'Photos (es_419)';

  @override
  String get phaseVideos => 'Videos (es_419)';

  @override
  String get phaseAudio => 'Audio (es_419)';

  @override
  String get phaseDocuments => 'Documents (es_419)';

  @override
  String get phaseJunk => 'Junk Files (es_419)';

  @override
  String get phaseFolders => 'Folders (es_419)';

  @override
  String get phaseApks => 'APKs (es_419)';

  @override
  String get phaseSimilar => 'Similar Photos (es_419)';

  @override
  String get phaseStorage => 'Storage (es_419)';

  @override
  String totalSize(String size) {
    return '$size Total (es_419)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (es_419)';
  }

  @override
  String get largeFilesTitle => 'Large Files (es_419)';

  @override
  String get selectYourLanguage => 'Select Your Language (es_419)';
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
  String get systemTheme => 'Predeterminado del Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get storageAccessRequired => 'Se Requiere Acceso Al Almacenamiento';

  @override
  String get storageAccessDesc =>
      'Clear Space necesita \"Acceso a todos los archivos\" para escanear tu dispositivo en busca de duplicados, archivos grandes y basura.\n\nSerás dirigido a la Configuración del Sistema para conceder este permiso cuando toques Conceder Permiso.';

  @override
  String get grantPermission => 'Conceder Permiso';

  @override
  String get getStarted => 'Comenzar';

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
    return '$count elementos seleccionados';
  }

  @override
  String get onboardingWelcome =>
      'Bienvenido a la forma más inteligente de mantener tu dispositivo limpio, rápido y seguro.';

  @override
  String get onboardingFeaturesTitle => 'Características Potentes';

  @override
  String get onboardingFeaturesDesc =>
      'Todo lo que necesitas para gestionar tu almacenamiento eficientemente.';

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
      'Encuentra y elimina basura, archivos grandes y duplicados al instante.';

  @override
  String get termsDesc =>
      'Al continuar, aceptas nuestros Términos de Servicio y Política de Privacidad.';

  @override
  String get selectLanguage => 'Selecciona tu Idioma';

  @override
  String get changeLaterInSettings =>
      'Puedes cambiar esto más tarde en Ajustes.';

  @override
  String get photosAndImages => 'Fotos e Imágenes';

  @override
  String get videos => 'Vídeos';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Documentos y Archivos';

  @override
  String get systemAndApps => 'Sistema y Aplicaciones';

  @override
  String get other => 'OTROS';

  @override
  String get review => 'Revisar';

  @override
  String get viewDetails => 'Ver Detalles';

  @override
  String get smartCleanupPlan => 'Plan De Limpieza Inteligente';

  @override
  String get analyzingSafeToDelete =>
      'Analizando archivos seguros para eliminar...';

  @override
  String get returnToDashboard => 'Volver al Panel';

  @override
  String get returnDirectlyToDashboard => 'Volver directamente al Panel';

  @override
  String get appearanceAndLanguage => 'Apariencia e Idioma';

  @override
  String get supportAndEngagement => 'Soporte y Participación';

  @override
  String get scanPreferences => 'Preferencias de Escaneo';

  @override
  String get legalAndAppInfo => 'Legal e Información de la App';

  @override
  String get cleanupHistory => 'Historial de Limpieza';

  @override
  String get viewPastCleaning => 'Ver tus actividades de limpieza pasadas';

  @override
  String get sendFeedback => 'Enviar Comentarios';

  @override
  String get reportBugs => 'Reportar errores o sugerir mejoras';

  @override
  String get rateUs => 'Califícanos 5 Estrellas';

  @override
  String get helpOthers => 'Ayuda a otros a encontrar Clear Space';

  @override
  String get shareWithFriends => 'Compartir con Amigos';

  @override
  String get recommendApp => 'Recomendar la aplicación vía mensajes';

  @override
  String get similarPhotoSensitivity => 'Sensibilidad de Fotos Similares';

  @override
  String get largeFileThreshold => 'Umbral de Archivos Grandes';

  @override
  String get strict => 'Estricto';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Relajado';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get howWeProtectData => 'Cómo protegemos tus datos';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get rulesAndGuidelines => 'Reglas y directrices';

  @override
  String get appVersion => 'Versión de la App';

  @override
  String get emailRestricted =>
      'Funcionalidad de correo electrónico restringida por el dispositivo.';

  @override
  String get browserLaunchFailed => 'No se pudo iniciar el navegador.';

  @override
  String get storeUnavailable =>
      'Servicio de la tienda temporalmente no disponible.';

  @override
  String get browserRestricted =>
      'Acceso al navegador restringido en este dispositivo.';

  @override
  String get shareUnavailable => 'Funcionalidad de compartir no disponible.';

  @override
  String get keepPhoneClean => 'Mantén tu teléfono limpio con Clear Space';

  @override
  String get duplicateFiles => 'Archivos Duplicados';

  @override
  String get findIdenticalFiles => 'Encuentra y elimina archivos idénticos';

  @override
  String get similarPhotos => 'Fotos Similares';

  @override
  String get findKeyMoments => 'Encuentra los momentos clave de las fotos';

  @override
  String get largeFiles => 'Archivos Grandes';

  @override
  String filesLargerThan(String size) {
    return 'Archivos mayores de $size';
  }

  @override
  String get screenshots => 'Capturas de pantalla';

  @override
  String get findAndDeleteScreenshots =>
      'Encuentra y elimina capturas de pantalla';

  @override
  String get downloads => 'Descargas';

  @override
  String get manageDownloadedFiles => 'Gestiona tus archivos descargados';

  @override
  String get tempAndLogFiles => 'Archivos Temporales y de Registro';

  @override
  String sizeFound(String size) {
    return '$size encontrados';
  }

  @override
  String get emptyFolders => 'Carpetas Vacías';

  @override
  String emptyFoldersFound(int count) {
    return '$count carpetas vacías encontradas';
  }

  @override
  String get safeApkInstallers => 'Instaladores APK Seguros';

  @override
  String get cleanOldApks => 'Limpia APKs instaladas/antiguas';

  @override
  String get pleaseScanStorageFirst =>
      'Por favor, escanea el almacenamiento primero';

  @override
  String get noJunkFilesFound => '¡No se encontraron archivos basura!';

  @override
  String get cleanupComplete => '¡Limpieza completada!';

  @override
  String cleanupFailed(String error) {
    return 'La limpieza falló: $error';
  }

  @override
  String get selectAll => 'Seleccionar Todo';

  @override
  String get noLargeFilesFound => '¡No se encontraron archivos grandes!';

  @override
  String get noDuplicatesFound => '¡No se encontraron duplicados!';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirmation => 'Confirmación';

  @override
  String get deleteFilesQuestion => '¿Eliminar archivos?';

  @override
  String deleteCountScreenshots(int count) {
    return '¿Eliminar permanentemente $count capturas de pantalla?';
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
    return 'Error cargando fotos: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Fallo al eliminar: $error';
  }

  @override
  String get contacts => 'Contactos';

  @override
  String get contactsNotImplemented => 'Lista de contactos no implementada';

  @override
  String get smartSelect => 'Selección Inteligente';

  @override
  String get junkFiles => 'Archivos Basura';

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
