// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'క్రాస్-ప్లాట్‌ఫారమ్ Pub మిర్రర్ బ్రౌజర్';

  @override
  String get navSearch => 'శోధించు';

  @override
  String get navFavorites => 'ఇష్టమైనవి';

  @override
  String get navSettings => 'సెట్టింగ్‌లు';

  @override
  String get searchHint => 'Flutter/Dart ప్యాకేజీలను శోధించండి...';

  @override
  String get searchFailed => 'శోధన విఫలమైంది, మీ నెట్‌వర్క్‌ను తనిఖీ చేయండి';

  @override
  String get searchEmpty => 'మీకు అవసరమైన Flutter/Dart ప్యాకేజీలను శోధించండి';

  @override
  String get searchNoResults => 'ప్యాకేజీలు కనుగొనబడలేదు';

  @override
  String get hotRecommend => 'ప్రసిద్ధ సిఫార్సులు';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String get install => 'ఇన్‌స్టాల్ చేయండి';

  @override
  String get terminal => 'టెర్మినల్';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README లోడ్ అవుతోంది...';

  @override
  String get about => 'గురించి';

  @override
  String get topics => 'అంశాలు';

  @override
  String get details => 'వివరాలు';

  @override
  String get language => 'భాష';

  @override
  String get selectLanguage => 'భాషను ఎంచుకోండి';

  @override
  String get languageSystem => 'సిస్టమ్';

  @override
  String get checkUpdate => 'అప్‌డేట్‌లను తనిఖీ చేయండి';

  @override
  String get autoTranslate => 'స్వయంచాలిత అనువాదం';

  @override
  String get autoTranslateDesc => 'OpenAI అనుకూల API అనువాదం';

  @override
  String get latestVersion => 'తాజా';

  @override
  String get publishDate => 'ప్రచురించబడింది';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'ఆధారపడటం';

  @override
  String get links => 'లింక్‌లు';

  @override
  String get homepage => 'హోమ్‌పేజీ';

  @override
  String get repository => 'రిపోజిటరీ';

  @override
  String get dependencies => 'ఆధారపడటం';

  @override
  String get noDependencies => 'ప్రత్యక్ష ఆధారపడటం లేదు';

  @override
  String get versionHistory => 'వెర్షన్ చరిత్ర';

  @override
  String moreVersions(int count) {
    return '$count పాత వెర్షన్‌లు...';
  }

  @override
  String get latest => 'తాజా';

  @override
  String get copied => 'కాపీ చేయబడింది';

  @override
  String get copiedToClipboard => 'కోడ్ క్లిప్‌బోర్డ్‌కు కాపీ చేయబడింది';

  @override
  String get favoritesFolders => 'ఫోల్డర్లు';

  @override
  String get noFavorites => 'ఇంకా ఇష్టమైనవి లేవు';

  @override
  String get noFavoritesHint =>
      'ఇష్టమైన వాటికి జోడించడానికి శోధన ఫలితాలలో హార్ట్ చిహ్నాన్ని నొక్కండి';

  @override
  String emptyFolder(String name) {
    return '\"$name\" లో ఇష్టమైనవి లేవు';
  }

  @override
  String get createFolder => 'కొత్త ఫోల్డర్';

  @override
  String get folderName => 'ఫోల్డర్ పేరు';

  @override
  String get create => 'సృష్టించు';

  @override
  String get rename => 'పేరు మార్చు';

  @override
  String get delete => 'తొలగించు';

  @override
  String get renameFolder => 'ఫోల్డర్ పేరు మార్చు';

  @override
  String get deleteFolder => 'ఫోల్డర్ తొలగించు';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" తొలగించాలా? దానిలోని ప్యాకేజీలు తొలగించబడతాయి.';
  }

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get confirm => 'నిర్ధారించు';

  @override
  String get folderExists => 'ఫోల్డర్ ఇప్పటికే ఉంది';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" నుండి తొలగించాలా?';
  }

  @override
  String get removeFavorite => 'ఇష్టమైన వాటి నుండి తొలగించు';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" ను ఇష్టమైన వాటి నుండి తొలగించాలా?';
  }

  @override
  String get addToOtherFolders => 'ఇతర ఫోల్డర్లకు జోడించు';

  @override
  String get selectFolder => 'ఫోల్డర్ ఎంచుకోండి';

  @override
  String get createAndAdd => 'సృష్టించి జోడించు';

  @override
  String favoriteManaged(String folders) {
    return 'సేవ్ చేయబడింది: $folders';
  }

  @override
  String get cancelAllFavorites => 'అన్నింటి నుండి తొలగించు';

  @override
  String get pubMirror => 'Pub మిర్రర్';

  @override
  String get pubMirrorHint => 'ప్యాకేజీల కోసం కొత్త మిర్రర్ మూలానికి మారండి';

  @override
  String get githubMirror => 'GitHub మిర్రర్';

  @override
  String get githubRawMirror => 'GitHub Raw మిర్రర్';

  @override
  String get githubMirrorHint =>
      'ప్యాకేజీ README పొందడానికి, చైనాలో మిర్రర్ ఉపయోగించమని సిఫార్సు చేయబడింది';

  @override
  String get appearance => 'రూపం';

  @override
  String get theme => 'థీమ్';

  @override
  String get themeSystem => 'సిస్టమ్';

  @override
  String get themeLight => 'లైట్';

  @override
  String get themeDark => 'డార్క్';

  @override
  String get selectTheme => 'థీమ్ ఎంచుకోండి';

  @override
  String get themeColor => 'థీమ్ రంగు';

  @override
  String get data => 'డేటా';

  @override
  String get clearCache => 'కాష్ క్లియర్ చేయండి';

  @override
  String get clearCacheSubtitle => 'అన్ని API కాష్ డేటాను క్లియర్ చేయండి';

  @override
  String get clearCacheTitle => 'కాష్ క్లియర్ చేయండి';

  @override
  String get clearCacheConfirm =>
      'అన్ని API కాష్ క్లియర్ చేయాలా? ఇష్టమైనవి మరియు సెట్టింగ్‌లు తొలగించబడవు.';

  @override
  String get cacheCleared => 'కాష్ క్లియర్ చేయబడింది';

  @override
  String get aboutPubPub => 'PubPub గురించి';

  @override
  String version(String version) {
    return 'వెర్షన్ $version';
  }

  @override
  String get aboutTitle => 'గురించి';

  @override
  String get aboutDescription => 'క్రాస్-ప్లాట్‌ఫారమ్ Pub మిర్రర్ బ్రౌజర్';

  @override
  String get features => 'లక్షణాలు';

  @override
  String get featureSearch => 'ప్యాకేజీ శోధన';

  @override
  String get featureSearchDesc => 'బహుళ Pub మిర్రర్ల ద్వారా శోధించండి';

  @override
  String get featureDetail => 'ప్యాకేజీ వివరాలు';

  @override
  String get featureDetailDesc => 'వెర్షన్, ఆధారపడటం, README పూర్తి ప్రదర్శన';

  @override
  String get featureFavorites => 'కస్టమ్ సేకరణలు';

  @override
  String get featureFavoritesDesc =>
      'నిర్వహించడానికి బహుళ ఫోల్డర్లను సృష్టించండి';

  @override
  String get featureTheme => 'థీమ్ అనుకూలీకరణ';

  @override
  String get featureThemeDesc => '10 థీమ్ రంగులు + డార్క్ మోడ్';

  @override
  String get featureLayout => 'రెస్పాన్సివ్ లేఅవుట్';

  @override
  String get featureLayoutDesc => 'మొబైల్/డెస్క్‌టాప్ అనుకూలం';

  @override
  String get techStack => 'టెక్ స్టాక్';

  @override
  String get linksTitle => 'లింక్‌లు';

  @override
  String get githubRepo => 'GitHub రిపోజిటరీ';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter అధికారిక';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'లైసెన్స్';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter తో ❤️ తో తయారు చేయబడింది';

  @override
  String get loading => 'లోడ్ అవుతోంది...';

  @override
  String get error => 'లోపం';

  @override
  String get success => 'విజయం';

  @override
  String get ok => 'సరే';

  @override
  String get yes => 'అవును';

  @override
  String get no => 'కాదు';
}
