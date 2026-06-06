// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Navegador de espelhos Pub multiplataforma';

  @override
  String get navSearch => 'Buscar';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navSettings => 'Configurações';

  @override
  String get searchHint => 'Buscar pacotes Flutter/Dart...';

  @override
  String get searchFailed => 'Falha na busca, verifique sua rede';

  @override
  String get searchEmpty => 'Busque os pacotes Flutter/Dart que você precisa';

  @override
  String get searchNoResults => 'Nenhum pacote encontrado';

  @override
  String get hotRecommend => 'Recomendações populares';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get install => 'Instalar';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Carregando README...';

  @override
  String get about => 'Sobre';

  @override
  String get topics => 'Tópicos';

  @override
  String get details => 'Detalhes';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Selecionar idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get checkUpdate => 'Verificar atualizações';

  @override
  String get autoTranslate => 'Tradução automática';

  @override
  String get autoTranslateDesc => 'Tradução via API compatível com OpenAI';

  @override
  String get latestVersion => 'Mais recente';

  @override
  String get publishDate => 'Publicado';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Dependências';

  @override
  String get links => 'Links';

  @override
  String get homepage => 'Página inicial';

  @override
  String get repository => 'Repositório';

  @override
  String get dependencies => 'Dependências';

  @override
  String get noDependencies => 'Sem dependências diretas';

  @override
  String get versionHistory => 'Histórico de versões';

  @override
  String moreVersions(int count) {
    return '$count versões anteriores...';
  }

  @override
  String get latest => 'mais recente';

  @override
  String get copied => 'Copiado';

  @override
  String get copiedToClipboard => 'Código copiado para a área de transferência';

  @override
  String get favoritesFolders => 'Pastas';

  @override
  String get noFavorites => 'Nenhum favorito ainda';

  @override
  String get noFavoritesHint =>
      'Toque no ícone de coração nos resultados para favoritar';

  @override
  String emptyFolder(String name) {
    return '\"$name\" não tem favoritos';
  }

  @override
  String get createFolder => 'Nova pasta';

  @override
  String get folderName => 'Nome da pasta';

  @override
  String get create => 'Criar';

  @override
  String get rename => 'Renomear';

  @override
  String get delete => 'Excluir';

  @override
  String get renameFolder => 'Renomear pasta';

  @override
  String get deleteFolder => 'Excluir pasta';

  @override
  String deleteFolderConfirm(String name) {
    return 'Excluir \"$name\"? Os pacotes serão removidos.';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get folderExists => 'A pasta já existe';

  @override
  String removeFromFolder(String folder) {
    return 'Remover de \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Remover favorito';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Remover \"$name\" dos favoritos?';
  }

  @override
  String get addToOtherFolders => 'Adicionar a outras pastas';

  @override
  String get selectFolder => 'Selecionar pasta';

  @override
  String get createAndAdd => 'Criar e adicionar';

  @override
  String favoriteManaged(String folders) {
    return 'Salvo em: $folders';
  }

  @override
  String get cancelAllFavorites => 'Remover de todos';

  @override
  String get pubMirror => 'Espelho Pub';

  @override
  String get pubMirrorHint =>
      'Mudar para uma nova fonte de espelho para buscar pacotes';

  @override
  String get githubMirror => 'Espelho GitHub';

  @override
  String get githubRawMirror => 'Espelho GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Para obter README de pacotes, recomenda-se usar espelho na China';

  @override
  String get appearance => 'Aparência';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get selectTheme => 'Selecionar tema';

  @override
  String get themeColor => 'Cor do tema';

  @override
  String get data => 'Dados';

  @override
  String get clearCache => 'Limpar cache';

  @override
  String get clearCacheSubtitle => 'Limpar todos os dados de cache da API';

  @override
  String get clearCacheTitle => 'Limpar cache';

  @override
  String get clearCacheConfirm =>
      'Limpar todo o cache da API? Favoritos e configurações não serão removidos.';

  @override
  String get cacheCleared => 'Cache limpo';

  @override
  String get aboutPubPub => 'Sobre o PubPub';

  @override
  String version(String version) {
    return 'Versão $version';
  }

  @override
  String get aboutTitle => 'Sobre';

  @override
  String get aboutDescription => 'Navegador de espelhos Pub multiplataforma';

  @override
  String get features => 'Recursos';

  @override
  String get featureSearch => 'Busca de pacotes';

  @override
  String get featureSearchDesc => 'Busca através de múltiplos espelhos Pub';

  @override
  String get featureDetail => 'Detalhes do pacote';

  @override
  String get featureDetailDesc =>
      'Versão, dependências, exibição completa do README';

  @override
  String get featureFavorites => 'Coleções personalizadas';

  @override
  String get featureFavoritesDesc => 'Crie múltiplas pastas para organizar';

  @override
  String get featureTheme => 'Personalização de tema';

  @override
  String get featureThemeDesc => '10 cores de tema + modo escuro';

  @override
  String get featureLayout => 'Layout responsivo';

  @override
  String get featureLayoutDesc => 'Adaptação móvel/desktop';

  @override
  String get techStack => 'Stack tecnológico';

  @override
  String get linksTitle => 'Links';

  @override
  String get githubRepo => 'Repositório GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Oficial';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Licença';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Feito com ❤️ usando Flutter';

  @override
  String get loading => 'Carregando...';

  @override
  String get error => 'Erro';

  @override
  String get success => 'Sucesso';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get defaultFolder => 'Default';

  @override
  String get detailFailed =>
      'Failed to load details, please check your network';

  @override
  String get tip => 'Tip';

  @override
  String get checkingUpdate => 'Checking for updates...';

  @override
  String get alreadyLatest => 'Already the latest version';

  @override
  String get close => 'Close';

  @override
  String get original => 'Original';

  @override
  String get translated => 'Translated';

  @override
  String get latestVersionLabel => 'Latest Version';

  @override
  String get publishTime => 'Published';

  @override
  String get dependencyNum => 'Dependencies';

  @override
  String get colorBlue => 'Blue';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorPurple => 'Purple';

  @override
  String get colorDeepPurple => 'Deep Purple';

  @override
  String get colorTeal => 'Teal';

  @override
  String get colorGreen => 'Green';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorRed => 'Red';

  @override
  String get colorPink => 'Pink';

  @override
  String get colorBrown => 'Brown';

  @override
  String get configured => 'Configured';

  @override
  String get notConfigured => 'Not Configured';

  @override
  String get modelLabel => 'Model';

  @override
  String get targetLangLabel => 'Target Language';

  @override
  String get targetLangHint => '简体中文 / English / 日本語';

  @override
  String get translateApiHint =>
      'Supports all OpenAI compatible APIs (OpenAI, DeepSeek, Moonshot, etc.)';

  @override
  String get pubOfficial => 'Official (pub.dev)';

  @override
  String get tuna => 'Tsinghua TUNA';

  @override
  String get sjtu => 'SJTU';

  @override
  String get flutterChina => 'Flutter China';
}
