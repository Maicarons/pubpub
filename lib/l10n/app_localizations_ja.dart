// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'クロスプラットフォーム Pub ミラーブラウザ';

  @override
  String get navSearch => '検索';

  @override
  String get navFavorites => 'お気に入り';

  @override
  String get navSettings => '設定';

  @override
  String get searchHint => 'Flutter/Dart パッケージを検索...';

  @override
  String get searchFailed => '検索失敗、ネットワークを確認してください';

  @override
  String get searchEmpty => '必要な Flutter/Dart パッケージを検索';

  @override
  String get searchNoResults => 'パッケージが見つかりません';

  @override
  String get hotRecommend => '人気のおすすめ';

  @override
  String get retry => '再試行';

  @override
  String get install => 'インストール';

  @override
  String get terminal => 'ターミナル';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README を読み込み中...';

  @override
  String get about => 'について';

  @override
  String get topics => 'トピック';

  @override
  String get details => '詳細';

  @override
  String get language => '言語';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get languageSystem => 'システム';

  @override
  String get checkUpdate => 'アップデートを確認';

  @override
  String get autoTranslate => '自動翻訳';

  @override
  String get autoTranslateDesc => 'OpenAI 互換 API 翻訳';

  @override
  String get latestVersion => '最新';

  @override
  String get publishDate => '公開日';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => '依存関係';

  @override
  String get links => 'リンク';

  @override
  String get homepage => 'ホームページ';

  @override
  String get repository => 'リポジトリ';

  @override
  String get dependencies => '依存関係';

  @override
  String get noDependencies => '直接の依存関係なし';

  @override
  String get versionHistory => 'バージョン履歴';

  @override
  String moreVersions(int count) {
    return '他 $count 件の過去バージョン...';
  }

  @override
  String get latest => '最新';

  @override
  String get copied => 'コピー済み';

  @override
  String get copiedToClipboard => 'コードをクリップボードにコピーしました';

  @override
  String get favoritesFolders => 'フォルダ';

  @override
  String get noFavorites => 'お気に入りはまだありません';

  @override
  String get noFavoritesHint => '検索結果のハートアイコンをタップしてお気に入りに追加';

  @override
  String emptyFolder(String name) {
    return '\"$name\" にお気に入りはありません';
  }

  @override
  String get createFolder => '新しいフォルダ';

  @override
  String get folderName => 'フォルダ名';

  @override
  String get create => '作成';

  @override
  String get rename => '名前を変更';

  @override
  String get delete => '削除';

  @override
  String get renameFolder => 'フォルダ名を変更';

  @override
  String get deleteFolder => 'フォルダを削除';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" を削除しますか？含まれるパッケージも削除されます。';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get folderExists => 'フォルダは既に存在します';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" から削除しますか？';
  }

  @override
  String get removeFavorite => 'お気に入りから削除';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" をお気に入りから削除しますか？';
  }

  @override
  String get addToOtherFolders => '他のフォルダに追加';

  @override
  String get selectFolder => 'フォルダを選択';

  @override
  String get createAndAdd => '作成して追加';

  @override
  String favoriteManaged(String folders) {
    return '保存先: $folders';
  }

  @override
  String get cancelAllFavorites => 'すべてから削除';

  @override
  String get pubMirror => 'Pub ミラー';

  @override
  String get pubMirrorHint => 'パッケージ検索用の新しいミラーに切り替え';

  @override
  String get githubMirror => 'GitHub ミラー';

  @override
  String get githubRawMirror => 'GitHub Raw ミラー';

  @override
  String get githubMirrorHint => 'パッケージ README 取得用、中国ではミラー使用推奨';

  @override
  String get appearance => '外観';

  @override
  String get theme => 'テーマ';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get selectTheme => 'テーマを選択';

  @override
  String get themeColor => 'テーマカラー';

  @override
  String get data => 'データ';

  @override
  String get clearCache => 'キャッシュをクリア';

  @override
  String get clearCacheSubtitle => 'すべての API キャッシュデータをクリア';

  @override
  String get clearCacheTitle => 'キャッシュをクリア';

  @override
  String get clearCacheConfirm => 'すべての API キャッシュをクリアしますか？お気に入りと設定は削除されません。';

  @override
  String get cacheCleared => 'キャッシュをクリアしました';

  @override
  String get aboutPubPub => 'PubPub について';

  @override
  String version(String version) {
    return 'バージョン $version';
  }

  @override
  String get aboutTitle => 'について';

  @override
  String get aboutDescription => 'クロスプラットフォーム Pub ミラーブラウザ';

  @override
  String get features => '機能';

  @override
  String get featureSearch => 'パッケージ検索';

  @override
  String get featureSearchDesc => '複数の Pub ミラーを横断検索';

  @override
  String get featureDetail => 'パッケージ詳細';

  @override
  String get featureDetailDesc => 'バージョン、依存関係、README 完全表示';

  @override
  String get featureFavorites => 'カスタムコレクション';

  @override
  String get featureFavoritesDesc => '複数のフォルダで整理';

  @override
  String get featureTheme => 'テーマカスタマイズ';

  @override
  String get featureThemeDesc => '10色のテーマ + ダークモード';

  @override
  String get featureLayout => 'レスポンシブレイアウト';

  @override
  String get featureLayoutDesc => 'モバイル/デスクトップ対応';

  @override
  String get techStack => '技術スタック';

  @override
  String get linksTitle => 'リンク';

  @override
  String get githubRepo => 'GitHub リポジトリ';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter 公式';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'ライセンス';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter で ❤️ を込めて作成';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラー';

  @override
  String get success => '成功';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';
}
