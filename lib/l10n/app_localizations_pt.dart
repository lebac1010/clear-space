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
      'O Clear Space precisa de \"Acesso a todos os arquivos\" para verificar se há duplicatas, arquivos grandes and arquivos indesejados no seu dispositivo.\n\nVocê será direcionado para as Configurações do Sistema para conceder essa permissão.';

  @override
  String get storagePermissionDeniedDesc =>
      'A permissão de armazenamento foi negada. Por favor, ative nas Configurações para continuar.';

  @override
  String get permissionMediaTitle => 'Fotos, vídeos and áudio';

  @override
  String get permissionMediaDesc =>
      'Usado para encontrar arquivos duplicados, fotos semelhantes, capturas de tela, downloads and mídias grandes armazenadas no seu dispositivo.';

  @override
  String get permissionAllFilesTitle => 'Acesso a todos os arquivos';

  @override
  String get permissionAllFilesDesc =>
      'Usado para recursos de limpeza que não são de mídia, como arquivos inúteis, análise de APK, análise de downloads and pastas vazias.';

  @override
  String get permissionInstalledAppsTitle => 'Apps instalados';

  @override
  String get permissionInstalledAppsDesc =>
      'Usado pelo Gerenciador de Apps para mostrar aplicativos instalados visíveis no launcher and abrir a confirmação de desinstalação do Android.';

  @override
  String get permissionVisibleProgressTitle => 'Progresso visível';

  @override
  String get permissionVisibleProgressDesc =>
      'Usado para manter visível o progresso da varredura ou limpeza enquanto uma tarefa iniciada pelo usuário está em execução.';

  @override
  String get permissionOnDeviceNote =>
      'A análise de varredura and limpeza permanece no seu dispositivo. O Clear Space não envia seus arquivos para um servidor de desenvolvedor para esses recursos.';

  @override
  String get openSettings => 'Abrir Configurações';

  @override
  String get grantPermission => 'Conceder Permissão';

  @override
  String get getStarted => 'Começar';

  @override
  String get skip => 'Pular';

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
      'Bem-vindo à maneira mais inteligente de manter seu dispositivo limpo, rápido and seguro.';

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
      'Encontre and remova instantaneamente lixo, arquivos grandes and duplicatas.';

  @override
  String get termsDesc =>
      'Ao continuar, você concorda com nossos Termos de Serviço and Política de Privacidade.';

  @override
  String get selectLanguage => 'Selecione seu idioma';

  @override
  String get changeLaterInSettings =>
      'Você pode mudar isso mais tarde nas Configurações.';

  @override
  String get photosAndImages => 'Fotos and Imagens';

  @override
  String get videos => 'Vídeos';

  @override
  String get audio => 'Áudio';

  @override
  String get documentsAndFiles => 'Documentos and Arquivos';

  @override
  String get systemAndApps => 'Sistema and Apps';

  @override
  String get other => 'OUTRO';

  @override
  String get review => 'Revisar';

  @override
  String get viewDetails => 'Ver Detalhes';

  @override
  String get smartCleanupPlan => 'Plano de Limpeza Inteligente';

  @override
  String get analyzingSafeToDelete =>
      'Analisando arquivos seguros para excluir...';

  @override
  String get returnToDashboard => 'Voltar ao Painel';

  @override
  String get returnDirectlyToDashboard => 'Voltar diretamente ao Painel';

  @override
  String get appearanceAndLanguage => 'Aparência and Idioma';

  @override
  String get supportAndEngagement => 'Suporte and Engajamento';

  @override
  String get scanPreferences => 'Preferências de Varredura';

  @override
  String get legalAndAppInfo => 'Informações Legais do App';

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
  String get recommendApp => 'Recomendar o app por mensagens';

  @override
  String get similarPhotoSensitivity => 'Sensibilidade de Fotos Semelhantes';

  @override
  String get largeFileThreshold => 'Limite de Arquivo Grande';

  @override
  String get strict => 'Rigoroso';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Flexível';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get howWeProtectData => 'Como protegemos seus dados';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get rulesAndGuidelines => 'Regras and diretrizes';

  @override
  String get appVersion => 'Versi do App';

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
  String get keepPhoneClean => 'Mantenha seu celular limpo com o Clear Space';

  @override
  String get duplicateFiles => 'Arquivos Duplicados';

  @override
  String get findIdenticalFiles => 'Encontre and remova arquivos idênticos';

  @override
  String get similarPhotos => 'Fotos Semelhantes';

  @override
  String get findKeyMoments => 'Encontre momentos importantes em fotos';

  @override
  String get largeFiles => 'Arquivos Grandes';

  @override
  String filesLargerThan(String size) {
    return 'Arquivos maiores que $size';
  }

  @override
  String get screenshots => 'Capturas de Tela';

  @override
  String get findAndDeleteScreenshots => 'Encontre and exclua capturas de tela';

  @override
  String get downloads => 'Downloads';

  @override
  String get manageDownloadedFiles => 'Gerencie seus arquivos baixados';

  @override
  String get tempAndLogFiles => 'Arquivos Temporários and de Log';

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
  String get cleanOldApks => 'Limpar APKs instalados/antigos';

  @override
  String get pleaseScanStorageFirst => 'Por favor, faça a varredura primeiro';

  @override
  String get noJunkFilesFound => 'Nenhum arquivo indesejado encontrado!';

  @override
  String get cleanupComplete => 'Limpeza concluída!';

  @override
  String cleanupFailed(String error) {
    return 'A limpeza falhou: $error';
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
  String get clearHistory => 'Limpar Histórico';

  @override
  String get clearHistoryConfirm =>
      'Tem certeza de que deseja excluir todos os logs de limpeza?';

  @override
  String get clearAll => 'Limpar Tudo';

  @override
  String get cleanAllSafeItems => 'Limpar Todos os Itens Seguros';

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
    return 'A exclusão falhou: $error';
  }

  @override
  String get contacts => 'Contatos';

  @override
  String get contactsNotImplemented =>
      'A lista de contatos não foi implementada';

  @override
  String get smartSelect => 'Seleção Inteligente';

  @override
  String get junkFiles => 'Arquivos Inúteis';

  @override
  String potentialSize(String size) {
    return '$size potenciais';
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
      'Isso removerá o aplicativo and todos os dados.';

  @override
  String appsCount(int count) {
    return '$count aplicativos';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total aplicativos';
  }

  @override
  String get duplicates => 'Duplicatas';

  @override
  String get similar => 'Semelhantes';

  @override
  String get somethingWentWrong => 'Algo deu errado';

  @override
  String get pageNotFoundDesc =>
      'A página que você está procurando não existe.';

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
      'Mantemos automaticamente a melhor versão de suas fotos and arquivos.';

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
