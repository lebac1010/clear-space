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
}
