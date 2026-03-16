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
  String get junkFilesFound => 'Arquivos residuais encontrados';

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
  String get refreshingAppList => 'Atualizando lista de aplicativos...';

  @override
  String get openingUninstaller => 'Abrindo desinstalador...';

  @override
  String get uninstallApp => 'Desinstalar o aplicativo';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get sortLargest => 'Mais pesados';

  @override
  String get sortSmallest => 'Mais leves';

  @override
  String get sortNewest => 'Mais recentes';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Página não encontrada';

  @override
  String get goToDashboard => 'Ir para o Painel';

  @override
  String get deleteFilesTitle => 'Excluir arquivos';

  @override
  String get smartCleanupPlanTitle => 'Plano de limpeza inteligente';

  @override
  String get screenshotsCleanerTitle => 'Limpeza de capturas';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get appManagerTitle => 'Gerenciador de Apps';

  @override
  String get searchApps => 'Procurar aplicativos...';

  @override
  String get noAppsFound => 'Nenhum aplicativo encontrado';

  @override
  String get noMatchingApps => 'Nenhuma correspondência';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Tem certeza que deseja desinstalar \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'Isso removerá o aplicativo e todos os dados.';

  @override
  String appsCount(int count) {
    return '$count aplicativos';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total aplicativos';
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
  String get allClean => 'Tudo limpo!';

  @override
  String get deleting => 'Excluindo...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Excluir $count itens ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count itens excluídos ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Esta ação não pode ser desfeita.';

  @override
  String get cleanupBreakdown => 'Resumo da Limpeza';

  @override
  String get smartCleanupDesc =>
      'Mantemos automaticamente a melhor versão de suas fotos e arquivos.';

  @override
  String get cleaning => 'Limpando...';

  @override
  String cleanUpSize(String size) {
    return 'Limpar $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Você economizou $size';
  }

  @override
  String get youreAllSet => 'Tudo pronto!';

  @override
  String get noSmartCleanupItems =>
      'Nenhum arquivo duplicado ou semelhante encontrado.';

  @override
  String get save => 'Salvar';

  @override
  String get keep => 'MANTER';

  @override
  String get deselectAll => 'Desmarcar todos';

  @override
  String get images => 'Imagens';

  @override
  String get docs => 'Documentos';

  @override
  String get others => 'Outros';

  @override
  String get all => 'Todos';

  @override
  String deleteConfirmMsg(int count) {
    return 'Tem certeza de que deseja excluir os $count arquivos selecionados?\n\nOs itens serão movidos para a lixeira ou permanentemente excluídos.';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas',
      one: '1 captura',
      zero: 'Nenhuma captura',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selecionados: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Excluir selecionados ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Falha ao excluir alguns itens.';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get strictSensitivity => 'Estrito (Match 95%)';

  @override
  String get normalSensitivity => 'Normal (Match 85%)';

  @override
  String get looseSensitivity => 'Flexível (Match 75%)';

  @override
  String get sensitivityDesc =>
      'Escolha quão estritamente o aplicativo identifica fotos semelhantes.';

  @override
  String get strictSensitivityDesc => 'Match de 95% — Apenas quase idênticas';

  @override
  String get normalSensitivityDesc => 'Match de 85% — Recomendado';

  @override
  String get looseSensitivityDesc => 'Match de 75% — Captura mais variações';

  @override
  String get sensitivityUpdated =>
      'Configuração atualizada. Será aplicada na próxima varredura.';

  @override
  String get thresholdDesc =>
      'Arquivos maiores que esse valor serão marcados para limpeza.';

  @override
  String get thresholdUpdated =>
      'Limite atualizado. Será aplicado na próxima varredura.';

  @override
  String largerThanSize(String size) {
    return 'Maior que $size';
  }

  @override
  String get madeWithHeart => 'Feito com ❤️ para um celular mais limpo';

  @override
  String get versionUnavailable => 'Versão indisponível';

  @override
  String get emailNotSupported => 'Não foi possível abrir seu email.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Armazenamento';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count itens a limpar';
  }

  @override
  String get storageBreakdown => 'Detalhes de Uso';

  @override
  String get cleanup => 'Limpeza';

  @override
  String get suggestions => 'Sugestões';

  @override
  String get analyzing => 'Analisando...';

  @override
  String get keepStorageHealthy => 'Mantenha o sistema saudável';

  @override
  String get cleanupHeaderDesc =>
      'Encontramos arquivos que você pode remover para liberar espaço.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Usado';
  }

  @override
  String get scanPausedBattery => 'Pausado (Bateria Franca)';

  @override
  String scanningPhase(String phase) {
    return 'Verificando $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Verificando $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Calculando...';

  @override
  String get internalStorage => 'ARMAZENAMENTO INTERNO';

  @override
  String get free => 'Livre';

  @override
  String get used => 'Usado';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disco';

  @override
  String get phasePhotos => 'Fotos';

  @override
  String get phaseVideos => 'Vídeos';

  @override
  String get phaseAudio => 'Áudio';

  @override
  String get phaseDocuments => 'Docs';

  @override
  String get phaseJunk => 'Residuais';

  @override
  String get phaseFolders => 'Pastas';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Fotos similares';

  @override
  String get phaseStorage => 'Memória';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Usado';
  }

  @override
  String get largeFilesTitle => 'Arquivos Grandes';

  @override
  String get selectYourLanguage => 'Selecione seu Idioma';

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
  String get junkFilesFound => 'Arquivos residuais encontrados';

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
  String get refreshingAppList => 'Atualizando lista de aplicativos...';

  @override
  String get openingUninstaller => 'Abrindo desinstalador...';

  @override
  String get uninstallApp => 'Desinstalar o aplicativo';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get sortLargest => 'Mais pesados';

  @override
  String get sortSmallest => 'Mais leves';

  @override
  String get sortNewest => 'Mais recentes';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Página não encontrada';

  @override
  String get goToDashboard => 'Ir para o Painel';

  @override
  String get deleteFilesTitle => 'Excluir arquivos';

  @override
  String get smartCleanupPlanTitle => 'Plano de limpeza inteligente';

  @override
  String get screenshotsCleanerTitle => 'Limpeza de capturas';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get appManagerTitle => 'Gerenciador de Apps';

  @override
  String get searchApps => 'Procurar aplicativos...';

  @override
  String get noAppsFound => 'Nenhum aplicativo encontrado';

  @override
  String get noMatchingApps => 'Nenhuma correspondência';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Tem certeza que deseja desinstalar \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'Isso removerá o aplicativo e todos os dados.';

  @override
  String appsCount(int count) {
    return '$count aplicativos';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total aplicativos';
  }

  @override
  String get allClean => 'Tudo limpo!';

  @override
  String get deleting => 'Excluindo...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Excluir $count itens ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return '$count itens excluídos ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Esta ação não pode ser desfeita.';

  @override
  String get cleanupBreakdown => 'Resumo da Limpeza';

  @override
  String get smartCleanupDesc =>
      'Mantemos automaticamente a melhor versão de suas fotos e arquivos.';

  @override
  String get cleaning => 'Limpando...';

  @override
  String cleanUpSize(String size) {
    return 'Limpar $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Você economizou $size';
  }

  @override
  String get youreAllSet => 'Tudo pronto!';

  @override
  String get noSmartCleanupItems =>
      'Nenhum arquivo duplicado ou semelhante encontrado.';

  @override
  String get save => 'Salvar';

  @override
  String get keep => 'MANTER';

  @override
  String get deselectAll => 'Desmarcar todos';

  @override
  String get images => 'Imagens';

  @override
  String get docs => 'Documentos';

  @override
  String get others => 'Outros';

  @override
  String get all => 'Todos';

  @override
  String deleteConfirmMsg(int count) {
    return 'Tem certeza de que deseja excluir os $count arquivos selecionados?\n\nOs itens serão movidos para a lixeira ou permanentemente excluídos.';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas',
      one: '1 captura',
      zero: 'Nenhuma captura',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Selecionados: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Excluir selecionados ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Falha ao excluir alguns itens.';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get strictSensitivity => 'Estrito (Match 95%)';

  @override
  String get normalSensitivity => 'Normal (Match 85%)';

  @override
  String get looseSensitivity => 'Flexível (Match 75%)';

  @override
  String get sensitivityDesc =>
      'Escolha quão estritamente o aplicativo identifica fotos semelhantes.';

  @override
  String get strictSensitivityDesc => 'Match de 95% — Apenas quase idênticas';

  @override
  String get normalSensitivityDesc => 'Match de 85% — Recomendado';

  @override
  String get looseSensitivityDesc => 'Match de 75% — Captura mais variações';

  @override
  String get sensitivityUpdated =>
      'Configuração atualizada. Será aplicada na próxima varredura.';

  @override
  String get thresholdDesc =>
      'Arquivos maiores que esse valor serão marcados para limpeza.';

  @override
  String get thresholdUpdated =>
      'Limite atualizado. Será aplicado na próxima varredura.';

  @override
  String largerThanSize(String size) {
    return 'Maior que $size';
  }

  @override
  String get madeWithHeart => 'Feito com ❤️ para um celular mais limpo';

  @override
  String get versionUnavailable => 'Versão indisponível';

  @override
  String get emailNotSupported => 'Não foi possível abrir seu email.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Armazenamento';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count itens a limpar';
  }

  @override
  String get storageBreakdown => 'Detalhes de Uso';

  @override
  String get cleanup => 'Limpeza';

  @override
  String get suggestions => 'Sugestões';

  @override
  String get analyzing => 'Analisando...';

  @override
  String get keepStorageHealthy => 'Mantenha o sistema saudável';

  @override
  String get cleanupHeaderDesc =>
      'Encontramos arquivos que você pode remover para liberar espaço.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Usado';
  }

  @override
  String get scanPausedBattery => 'Pausado (Bateria Franca)';

  @override
  String scanningPhase(String phase) {
    return 'Verificando $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Verificando $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Calculando...';

  @override
  String get internalStorage => 'ARMAZENAMENTO INTERNO';

  @override
  String get free => 'Livre';

  @override
  String get used => 'Usado';

  @override
  String get total => 'Total';

  @override
  String get phaseDisk => 'Disco';

  @override
  String get phasePhotos => 'Fotos';

  @override
  String get phaseVideos => 'Vídeos';

  @override
  String get phaseAudio => 'Áudio';

  @override
  String get phaseDocuments => 'Docs';

  @override
  String get phaseJunk => 'Residuais';

  @override
  String get phaseFolders => 'Pastas';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Fotos similares';

  @override
  String get phaseStorage => 'Memória';

  @override
  String totalSize(String size) {
    return '$size Total';
  }

  @override
  String usedSize(String size) {
    return '$size Usado';
  }

  @override
  String get largeFilesTitle => 'Arquivos Grandes';

  @override
  String get selectYourLanguage => 'Selecione seu Idioma';
}
