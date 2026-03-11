// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Painel';

  @override
  String get cleanupTitle => 'Limpeza';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Arquivos';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Padrão do Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Escuro';

  @override
  String get storageAccessRequired => 'Acesso Necessário';

  @override
  String get storageAccessDesc =>
      'O Clear Space precisa de \"Acesso a todos os arquivos\" para verificar se há duplicatas, arquivos grandes e arquivos indesejados no seu dispositivo.\n\nVocê será direcionado para as Configurações do Sistema para conceder essa permissão.';

  @override
  String get grantPermission => 'Conceder Permissão';

  @override
  String get getStarted => 'Começar';

  @override
  String get next => 'Próximo';

  @override
  String get continueText => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get analyze => 'Analisar';

  @override
  String get loading => 'Carregando...';

  @override
  String get error => 'Erro';

  @override
  String get success => 'Sucesso';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '1 item',
      zero: 'Nenhum item',
    );
    return '$_temp0 selecionados';
  }

  @override
  String get onboardingWelcome =>
      'Bem-vindo à maneira mais inteligente de manter seu dispositivo limpo, rápido e seguro.';

  @override
  String get onboardingFeaturesTitle => 'Recursos Poderosos';

  @override
  String get onboardingFeaturesDesc =>
      'Tudo o que você precisa para gerenciar seu armazenamento com eficiência.';

  @override
  String get feature1Title => 'Entenda seu armazenamento';

  @override
  String get feature1Desc =>
      'Obtenha um detalhamento visual claro do que está ocupando espaço.';

  @override
  String get feature2Title => 'Limpe com segurança';

  @override
  String get feature2Desc =>
      'Remova arquivos desnecessários com protocolos de exclusão seguros.';

  @override
  String get feature3Title => 'Libere espaço';

  @override
  String get feature3Desc =>
      'Encontre e remova instantaneamente lixo, arquivos grandes e duplicatas.';

  @override
  String get termsDesc =>
      'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade.';

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get changeLaterInSettings =>
      'You can change this later in Settings. (pt)';

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
  String get storeUnavailable => 'Store service temporarily unavailable. (pt)';

  @override
  String get browserRestricted =>
      'Browser access restricted on this device. (pt)';

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
  String get junkFilesFound => 'Junk Files Found (pt)';

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
  String get refreshingAppList => 'Refreshing app list... (pt)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (pt)';

  @override
  String get uninstallApp => 'Uninstall App (pt)';

  @override
  String get uninstall => 'Uninstall (pt)';

  @override
  String get sortLargest => 'Largest (pt)';

  @override
  String get sortSmallest => 'Smallest (pt)';

  @override
  String get sortNewest => 'Newest (pt)';

  @override
  String get sortAZ => 'A-Z (pt)';

  @override
  String get pageNotFound => 'Page Not Found (pt)';

  @override
  String get goToDashboard => 'Go to Dashboard (pt)';

  @override
  String get deleteFilesTitle => 'Delete Files (pt)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (pt)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (pt)';

  @override
  String get tryAgain => 'Try Again (pt)';

  @override
  String get appManagerTitle => 'App Manager (pt)';

  @override
  String get searchApps => 'Search apps... (pt)';

  @override
  String get noAppsFound => 'No apps found (pt)';

  @override
  String get noMatchingApps => 'No matching apps (pt)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (pt)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (pt)';

  @override
  String appsCount(int count) {
    return '$count apps (pt)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (pt)';
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
  String get allClean => 'All clean! (pt)';

  @override
  String get deleting => 'Deleting... (pt)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (pt)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (pt)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (pt)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (pt)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (pt)';

  @override
  String get cleaning => 'Cleaning... (pt)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (pt)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (pt)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (pt)';

  @override
  String get noSmartCleanupItems => 'No duplicate or similar files found. (pt)';

  @override
  String get save => 'Save (pt)';

  @override
  String get keep => 'KEEP (pt)';

  @override
  String get deselectAll => 'Deselect All (pt)';

  @override
  String get images => 'Images (pt)';

  @override
  String get docs => 'Docs (pt)';

  @override
  String get others => 'Others (pt)';

  @override
  String get all => 'All (pt)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (pt)';
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
    return '$_temp0 (pt)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (pt)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (pt)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (pt)';

  @override
  String get systemDefault => 'System Default (pt)';

  @override
  String get light => 'Light (pt)';

  @override
  String get dark => 'Dark (pt)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (pt)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (pt)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (pt)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (pt)';

  @override
  String get strictSensitivityDesc => '95% Match — Nearly identical only (pt)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (pt)';

  @override
  String get looseSensitivityDesc => '75% Match — Catches more variations (pt)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (pt)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (pt)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (pt)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (pt)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (pt)';

  @override
  String get versionUnavailable => 'Version unavailable (pt)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (pt)';

  @override
  String get clearSpace => 'Clear Space (pt)';

  @override
  String get storageDashboard => 'Storage Dashboard (pt)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (pt)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (pt)';

  @override
  String get cleanup => 'Cleanup (pt)';

  @override
  String get suggestions => 'Suggestions (pt)';

  @override
  String get analyzing => 'Analyzing... (pt)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (pt)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (pt)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (pt)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (pt)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (pt)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (pt)';
  }

  @override
  String get calculating => 'Calculating... (pt)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (pt)';

  @override
  String get free => 'Free (pt)';

  @override
  String get used => 'Used (pt)';

  @override
  String get total => 'Total (pt)';

  @override
  String get phaseDisk => 'Disk (pt)';

  @override
  String get phasePhotos => 'Photos (pt)';

  @override
  String get phaseVideos => 'Videos (pt)';

  @override
  String get phaseAudio => 'Audio (pt)';

  @override
  String get phaseDocuments => 'Documents (pt)';

  @override
  String get phaseJunk => 'Junk Files (pt)';

  @override
  String get phaseFolders => 'Folders (pt)';

  @override
  String get phaseApks => 'APKs (pt)';

  @override
  String get phaseSimilar => 'Similar Photos (pt)';

  @override
  String get phaseStorage => 'Storage (pt)';

  @override
  String totalSize(String size) {
    return '$size Total (pt)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (pt)';
  }

  @override
  String get largeFilesTitle => 'Large Files (pt)';

  @override
  String get selectYourLanguage => 'Select Your Language (pt)';

  @override
  String get analyzingLabel => 'Analisando...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count itens';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Painel';

  @override
  String get cleanupTitle => 'Limpeza';

  @override
  String get photosTitle => 'Fotos';

  @override
  String get filesTitle => 'Arquivos';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Padrão do Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Escuro';

  @override
  String get storageAccessRequired => 'Acesso Ao Armazenamento Necessário';

  @override
  String get storageAccessDesc =>
      'Clear Space precisa de \"Acesso a todos os arquivos\" para verificar seu dispositivo em busca de duplicados, arquivos grandes e lixo.\n\nVocê será direcionado para as Configurações do Sistema para conceder essa permissão ao tocar em Conceder Permissão.';

  @override
  String get grantPermission => 'Conceder Permissão';

  @override
  String get getStarted => 'Começar';

  @override
  String get next => 'Próximo';

  @override
  String get continueText => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get analyze => 'Analisar';

  @override
  String get loading => 'Carregando...';

  @override
  String get error => 'Erro';

  @override
  String get success => 'Sucesso';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String itemsSelected(int count) {
    return '$count itens selecionados';
  }

  @override
  String get onboardingWelcome =>
      'Bem-vindo à maneira mais inteligente de manter seu dispositivo limpo, rápido e seguro.';

  @override
  String get onboardingFeaturesTitle => 'Recursos Poderosos';

  @override
  String get onboardingFeaturesDesc =>
      'Tudo o que você precisa para gerenciar seu armazenamento com eficiência.';

  @override
  String get feature1Title => 'Entenda seu armazenamento';

  @override
  String get feature1Desc =>
      'Obtenha um detalhamento visual claro do que está ocupando espaço.';

  @override
  String get feature2Title => 'Limpe com segurança';

  @override
  String get feature2Desc =>
      'Remova arquivos desnecessários com protocolos de exclusão seguros.';

  @override
  String get feature3Title => 'Libere espaço';

  @override
  String get feature3Desc =>
      'Encontre e remova lixo, arquivos grandes e duplicados instantaneamente.';

  @override
  String get termsDesc =>
      'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade.';

  @override
  String get selectLanguage => 'Selecione seu Idioma';

  @override
  String get changeLaterInSettings =>
      'Você pode mudar isso depois em Configurações.';

  @override
  String get photosAndImages => 'Fotos e Imagens';

  @override
  String get videos => 'Vídeos';

  @override
  String get audio => 'Áudio';

  @override
  String get documentsAndFiles => 'Documentos e Arquivos';

  @override
  String get systemAndApps => 'Sistema e Aplicativos';

  @override
  String get other => 'OUTROS';

  @override
  String get review => 'Revisar';

  @override
  String get viewDetails => 'Ver Detalhes';

  @override
  String get smartCleanupPlan => 'Plano De Limpeza Inteligente';

  @override
  String get analyzingSafeToDelete =>
      'Analisando arquivos seguros para exclusão...';

  @override
  String get returnToDashboard => 'Voltar ao Painel';

  @override
  String get returnDirectlyToDashboard => 'Voltar diretamente ao Painel';

  @override
  String get appearanceAndLanguage => 'Aparência e Idioma';

  @override
  String get supportAndEngagement => 'Suporte e Engajamento';

  @override
  String get scanPreferences => 'Preferências de Verificação';

  @override
  String get legalAndAppInfo => 'Legal e Informações do App';

  @override
  String get cleanupHistory => 'Histórico de Limpeza';

  @override
  String get viewPastCleaning => 'Veja suas atividades de limpeza anteriores';

  @override
  String get sendFeedback => 'Enviar Feedback';

  @override
  String get reportBugs => 'Relatar bugs ou sugerir melhorias';

  @override
  String get rateUs => 'Avalie-nos com 5 Estrelas';

  @override
  String get helpOthers => 'Ajude outros a encontrar o Clear Space';

  @override
  String get shareWithFriends => 'Compartilhar com Amigos';

  @override
  String get recommendApp => 'Recomende o aplicativo por mensagens';

  @override
  String get similarPhotoSensitivity => 'Sensibilidade de Fotos Similares';

  @override
  String get largeFileThreshold => 'Limite de Arquivos Grandes';

  @override
  String get strict => 'Rigoroso';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Solto';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get howWeProtectData => 'Como protegemos seus dados';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get rulesAndGuidelines => 'Regras e diretrizes';

  @override
  String get appVersion => 'Versão do App';

  @override
  String get emailRestricted =>
      'Funcionalidade de e-mail restrita pelo dispositivo.';

  @override
  String get browserLaunchFailed => 'Não foi possível abrir o navegador.';

  @override
  String get storeUnavailable =>
      'Serviço da loja temporariamente indisponível.';

  @override
  String get browserRestricted =>
      'Acesso ao navegador restrito neste dispositivo.';

  @override
  String get shareUnavailable =>
      'Funcionalidade de compartilhamento indisponível.';

  @override
  String get keepPhoneClean => 'Mantenha seu telefone limpo com Clear Space';

  @override
  String get duplicateFiles => 'Arquivos Duplicados';

  @override
  String get findIdenticalFiles => 'Encontre e remova arquivos idênticos';

  @override
  String get similarPhotos => 'Fotos Similares';

  @override
  String get findKeyMoments => 'Encontre os momentos-chave das fotos';

  @override
  String get largeFiles => 'Arquivos Grandes';

  @override
  String filesLargerThan(String size) {
    return 'Arquivos maiores que $size';
  }

  @override
  String get screenshots => 'Capturas de tela';

  @override
  String get findAndDeleteScreenshots => 'Encontre e exclua capturas de tela';

  @override
  String get downloads => 'Downloads';

  @override
  String get manageDownloadedFiles => 'Gerencie seus arquivos baixados';

  @override
  String get tempAndLogFiles => 'Arquivos Temporários e de Log';

  @override
  String sizeFound(String size) {
    return '$size encontrados';
  }

  @override
  String get emptyFolders => 'Pastas Vazias';

  @override
  String emptyFoldersFound(int count) {
    return '$count pastas vazias encontradas';
  }

  @override
  String get safeApkInstallers => 'Instaladores APK Seguros';

  @override
  String get cleanOldApks => 'Limpe APKs instalados/antigos';

  @override
  String get pleaseScanStorageFirst =>
      'Por favor, verifique o armazenamento primeiro';

  @override
  String get noJunkFilesFound => 'Nenhum arquivo de lixo encontrado!';

  @override
  String get cleanupComplete => 'Limpeza concluída!';

  @override
  String cleanupFailed(String error) {
    return 'Limpeza falhou: $error';
  }

  @override
  String get selectAll => 'Selecionar Tudo';

  @override
  String get noLargeFilesFound => 'Nenhum arquivo grande encontrado!';

  @override
  String get noDuplicatesFound => 'Nenhuma duplicata encontrada!';

  @override
  String get delete => 'Excluir';

  @override
  String get confirmation => 'Confirmação';

  @override
  String get deleteFilesQuestion => 'Excluir arquivos?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Excluir permanentemente $count capturas de tela?';
  }

  @override
  String get screenshotsDeletedSuccess =>
      'Capturas de tela excluídas com sucesso';

  @override
  String get junkFilesFound => 'Junk Files Found (pt_BR)';

  @override
  String get noPhotosFound => 'Nenhuma foto encontrada';

  @override
  String errorLoadingPhotos(String error) {
    return 'Erro ao carregar fotos: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Falha ao excluir: $error';
  }

  @override
  String get contacts => 'Contatos';

  @override
  String get contactsNotImplemented => 'Lista de contatos não implementada';

  @override
  String get smartSelect => 'Seleção Inteligente';

  @override
  String get junkFiles => 'Lixo Eletrônico';

  @override
  String potentialSize(String size) {
    return '$size potencial';
  }

  @override
  String get noFilesMatchFilter => 'Nenhum arquivo corresponde a este filtro';

  @override
  String get refreshingAppList => 'Refreshing app list... (pt_BR)';

  @override
  String get openingUninstaller => 'Opening uninstaller... (pt_BR)';

  @override
  String get uninstallApp => 'Uninstall App (pt_BR)';

  @override
  String get uninstall => 'Uninstall (pt_BR)';

  @override
  String get sortLargest => 'Largest (pt_BR)';

  @override
  String get sortSmallest => 'Smallest (pt_BR)';

  @override
  String get sortNewest => 'Newest (pt_BR)';

  @override
  String get sortAZ => 'A-Z (pt_BR)';

  @override
  String get pageNotFound => 'Page Not Found (pt_BR)';

  @override
  String get goToDashboard => 'Go to Dashboard (pt_BR)';

  @override
  String get deleteFilesTitle => 'Delete Files (pt_BR)';

  @override
  String get smartCleanupPlanTitle => 'Smart Cleanup Plan (pt_BR)';

  @override
  String get screenshotsCleanerTitle => 'Screenshots Cleaner (pt_BR)';

  @override
  String get tryAgain => 'Try Again (pt_BR)';

  @override
  String get appManagerTitle => 'App Manager (pt_BR)';

  @override
  String get searchApps => 'Search apps... (pt_BR)';

  @override
  String get noAppsFound => 'No apps found (pt_BR)';

  @override
  String get noMatchingApps => 'No matching apps (pt_BR)';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Are you sure you want to uninstall \"$appName\" ($size)? (pt_BR)';
  }

  @override
  String get uninstallActionDesc =>
      'This will remove the app and all its data. (pt_BR)';

  @override
  String appsCount(int count) {
    return '$count apps (pt_BR)';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps (pt_BR)';
  }

  @override
  String get allClean => 'All clean! (pt_BR)';

  @override
  String get deleting => 'Deleting... (pt_BR)';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Delete $count items ($size) (pt_BR)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Deleted $count items ($size) (pt_BR)';
  }

  @override
  String get actionCannotBeUndone => 'This action cannot be undone. (pt_BR)';

  @override
  String get cleanupBreakdown => 'Cleanup Breakdown (pt_BR)';

  @override
  String get smartCleanupDesc =>
      'We automatically keep the best version of your photos and files. (pt_BR)';

  @override
  String get cleaning => 'Cleaning... (pt_BR)';

  @override
  String cleanUpSize(String size) {
    return 'Clean Up $size (pt_BR)';
  }

  @override
  String youSavedSize(String size) {
    return 'You saved $size (pt_BR)';
  }

  @override
  String get youreAllSet => 'You\'re All Set! (pt_BR)';

  @override
  String get noSmartCleanupItems =>
      'No duplicate or similar files found. (pt_BR)';

  @override
  String get save => 'Save (pt_BR)';

  @override
  String get keep => 'KEEP (pt_BR)';

  @override
  String get deselectAll => 'Deselect All (pt_BR)';

  @override
  String get images => 'Images (pt_BR)';

  @override
  String get docs => 'Docs (pt_BR)';

  @override
  String get others => 'Others (pt_BR)';

  @override
  String get all => 'All (pt_BR)';

  @override
  String deleteConfirmMsg(int count) {
    return 'Are you sure you want to delete $count selected files?\n\nItems will be moved to Trash if supported, or permanently deleted. (pt_BR)';
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
    return '$_temp0 (pt_BR)';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selected: $count ($size) (pt_BR)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Delete Selected ($size) (pt_BR)';
  }

  @override
  String get deleteFailedGeneral =>
      'Failed to delete some items. Please try again. (pt_BR)';

  @override
  String get systemDefault => 'System Default (pt_BR)';

  @override
  String get light => 'Light (pt_BR)';

  @override
  String get dark => 'Dark (pt_BR)';

  @override
  String get strictSensitivity => 'Strict (95% Match) (pt_BR)';

  @override
  String get normalSensitivity => 'Normal (85% Match) (pt_BR)';

  @override
  String get looseSensitivity => 'Loose (75% Match) (pt_BR)';

  @override
  String get sensitivityDesc =>
      'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged. (pt_BR)';

  @override
  String get strictSensitivityDesc =>
      '95% Match — Nearly identical only (pt_BR)';

  @override
  String get normalSensitivityDesc => '85% Match — Recommended (pt_BR)';

  @override
  String get looseSensitivityDesc =>
      '75% Match — Catches more variations (pt_BR)';

  @override
  String get sensitivityUpdated =>
      'Sensitivity setting updated. It will apply on the next scan. (pt_BR)';

  @override
  String get thresholdDesc =>
      'Files larger than this value will be flagged for cleanup. (pt_BR)';

  @override
  String get thresholdUpdated =>
      'Threshold updated. It will apply on the next scan. (pt_BR)';

  @override
  String largerThanSize(String size) {
    return 'Larger than $size (pt_BR)';
  }

  @override
  String get madeWithHeart => 'Made with ❤️ for a cleaner phone (pt_BR)';

  @override
  String get versionUnavailable => 'Version unavailable (pt_BR)';

  @override
  String get emailNotSupported =>
      'Could not open email client. Please email us directly. (pt_BR)';

  @override
  String get clearSpace => 'Clear Space (pt_BR)';

  @override
  String get storageDashboard => 'Storage Dashboard (pt_BR)';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count items can be cleaned (pt_BR)';
  }

  @override
  String get storageBreakdown => 'Storage Breakdown (pt_BR)';

  @override
  String get cleanup => 'Cleanup (pt_BR)';

  @override
  String get suggestions => 'Suggestions (pt_BR)';

  @override
  String get analyzing => 'Analyzing... (pt_BR)';

  @override
  String get keepStorageHealthy => 'Keep your storage healthy (pt_BR)';

  @override
  String get cleanupHeaderDesc =>
      'We found some files you might want to remove to free up space. (pt_BR)';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Used (pt_BR)';
  }

  @override
  String get scanPausedBattery => 'Scan Paused (Battery Low) (pt_BR)';

  @override
  String scanningPhase(String phase) {
    return 'Scanning $phase... (pt_BR)';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Scanning $phase... ($percentage%) (pt_BR)';
  }

  @override
  String get calculating => 'Calculating... (pt_BR)';

  @override
  String get internalStorage => 'INTERNAL STORAGE (pt_BR)';

  @override
  String get free => 'Free (pt_BR)';

  @override
  String get used => 'Used (pt_BR)';

  @override
  String get total => 'Total (pt_BR)';

  @override
  String get phaseDisk => 'Disk (pt_BR)';

  @override
  String get phasePhotos => 'Photos (pt_BR)';

  @override
  String get phaseVideos => 'Videos (pt_BR)';

  @override
  String get phaseAudio => 'Audio (pt_BR)';

  @override
  String get phaseDocuments => 'Documents (pt_BR)';

  @override
  String get phaseJunk => 'Junk Files (pt_BR)';

  @override
  String get phaseFolders => 'Folders (pt_BR)';

  @override
  String get phaseApks => 'APKs (pt_BR)';

  @override
  String get phaseSimilar => 'Similar Photos (pt_BR)';

  @override
  String get phaseStorage => 'Storage (pt_BR)';

  @override
  String totalSize(String size) {
    return '$size Total (pt_BR)';
  }

  @override
  String usedSize(String size) {
    return '$size Used (pt_BR)';
  }

  @override
  String get largeFilesTitle => 'Large Files (pt_BR)';

  @override
  String get selectYourLanguage => 'Select Your Language (pt_BR)';
}
