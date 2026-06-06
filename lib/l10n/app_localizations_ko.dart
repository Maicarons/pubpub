// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => '크로스 플랫폼 Pub 미러 브라우저';

  @override
  String get navSearch => '검색';

  @override
  String get navFavorites => '즐겨찾기';

  @override
  String get navSettings => '설정';

  @override
  String get searchHint => 'Flutter/Dart 패키지 검색...';

  @override
  String get searchFailed => '검색 실패, 네트워크를 확인하세요';

  @override
  String get searchEmpty => '필요한 Flutter/Dart 패키지를 검색하세요';

  @override
  String get searchNoResults => '패키지를 찾을 수 없습니다';

  @override
  String get hotRecommend => '인기 추천';

  @override
  String get retry => '재시도';

  @override
  String get install => '설치';

  @override
  String get terminal => '터미널';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README 로딩 중...';

  @override
  String get about => '정보';

  @override
  String get topics => '토픽';

  @override
  String get details => '상세정보';

  @override
  String get language => '언어';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get languageSystem => '시스템';

  @override
  String get checkUpdate => '업데이트 확인';

  @override
  String get autoTranslate => '자동 번역';

  @override
  String get autoTranslateDesc => 'OpenAI 호환 API 번역';

  @override
  String get latestVersion => '최신';

  @override
  String get publishDate => '발행일';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => '의존성';

  @override
  String get links => '링크';

  @override
  String get homepage => '홈페이지';

  @override
  String get repository => '저장소';

  @override
  String get dependencies => '의존성';

  @override
  String get noDependencies => '직접 의존성 없음';

  @override
  String get versionHistory => '버전 기록';

  @override
  String moreVersions(int count) {
    return '$count개의 이전 버전...';
  }

  @override
  String get latest => '최신';

  @override
  String get copied => '복사됨';

  @override
  String get copiedToClipboard => '클립보드에 복사되었습니다';

  @override
  String get favoritesFolders => '폴더';

  @override
  String get noFavorites => '아직 즐겨찾기가 없습니다';

  @override
  String get noFavoritesHint => '검색 결과에서 하트 아이콘을 눌러 즐겨찾기에 추가하세요';

  @override
  String emptyFolder(String name) {
    return '\"$name\"에 즐겨찾기가 없습니다';
  }

  @override
  String get createFolder => '새 폴더';

  @override
  String get folderName => '폴더 이름';

  @override
  String get create => '생성';

  @override
  String get rename => '이름 변경';

  @override
  String get delete => '삭제';

  @override
  String get renameFolder => '폴더 이름 변경';

  @override
  String get deleteFolder => '폴더 삭제';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\"을(를) 삭제하시겠습니까? 포함된 패키지가 제거됩니다.';
  }

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get folderExists => '폴더가 이미 존재합니다';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\"에서 제거하시겠습니까?';
  }

  @override
  String get removeFavorite => '즐겨찾기 제거';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\"을(를) 즐겨찾기에서 제거하시겠습니까?';
  }

  @override
  String get addToOtherFolders => '다른 폴더에 추가';

  @override
  String get selectFolder => '폴더 선택';

  @override
  String get createAndAdd => '생성 후 추가';

  @override
  String favoriteManaged(String folders) {
    return '저장 위치: $folders';
  }

  @override
  String get cancelAllFavorites => '모두 제거';

  @override
  String get pubMirror => 'Pub 미러';

  @override
  String get pubMirrorHint => '패키지 검색을 위한 새 미러 소스로 전환';

  @override
  String get githubMirror => 'GitHub 미러';

  @override
  String get githubRawMirror => 'GitHub Raw 미러';

  @override
  String get githubMirrorHint => '패키지 README 가져오기용, 중국에서는 미러 사용 권장';

  @override
  String get appearance => '외관';

  @override
  String get theme => '테마';

  @override
  String get themeSystem => '시스템';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get selectTheme => '테마 선택';

  @override
  String get themeColor => '테마 색상';

  @override
  String get data => '데이터';

  @override
  String get clearCache => '캐시 삭제';

  @override
  String get clearCacheSubtitle => '모든 API 캐시 데이터 삭제';

  @override
  String get clearCacheTitle => '캐시 삭제';

  @override
  String get clearCacheConfirm => '모든 API 캐시를 삭제하시겠습니까? 즐겨찾기와 설정은 삭제되지 않습니다.';

  @override
  String get cacheCleared => '캐시가 삭제되었습니다';

  @override
  String get aboutPubPub => 'PubPub 정보';

  @override
  String version(String version) {
    return '버전 $version';
  }

  @override
  String get aboutTitle => '정보';

  @override
  String get aboutDescription => '크로스 플랫폼 Pub 미러 브라우저';

  @override
  String get features => '기능';

  @override
  String get featureSearch => '패키지 검색';

  @override
  String get featureSearchDesc => '여러 Pub 미러를 통한 검색';

  @override
  String get featureDetail => '패키지 상세정보';

  @override
  String get featureDetailDesc => '버전, 의존성, README 전체 표시';

  @override
  String get featureFavorites => '사용자 정의 컬렉션';

  @override
  String get featureFavoritesDesc => '여러 폴더를 만들어 정리';

  @override
  String get featureTheme => '테마 사용자 정의';

  @override
  String get featureThemeDesc => '10가지 테마 색상 + 다크 모드';

  @override
  String get featureLayout => '반응형 레이아웃';

  @override
  String get featureLayoutDesc => '모바일/데스크톱 자동 적응';

  @override
  String get techStack => '기술 스택';

  @override
  String get linksTitle => '링크';

  @override
  String get githubRepo => 'GitHub 저장소';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter 공식';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => '라이선스';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter로 ❤️을 담아 제작';

  @override
  String get loading => '로딩 중...';

  @override
  String get error => '오류';

  @override
  String get success => '성공';

  @override
  String get ok => '확인';

  @override
  String get yes => '예';

  @override
  String get no => '아니오';

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
  String get njtech => 'Nanjing Tech';

  @override
  String get cernet => 'CERNET';

  @override
  String get flutterChina => 'Flutter China';

  @override
  String get mirrorNoSearch =>
      'Current mirror does not support search, please switch to a supported source';

  @override
  String get mirrorSearchNotSupported => 'Search not supported';

  @override
  String get mirrorSearchSupported => 'Search supported';

  @override
  String get addCustomMirror => 'Add Custom Mirror';

  @override
  String get deleteMirror => 'Delete Mirror';

  @override
  String deleteMirrorConfirm(Object url) {
    return 'Delete \"$url\"?';
  }
}
