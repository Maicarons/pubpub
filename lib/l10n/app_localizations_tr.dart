// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Çapraz platform Pub ayna tarayıcısı';

  @override
  String get navSearch => 'Ara';

  @override
  String get navFavorites => 'Favoriler';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get searchHint => 'Flutter/Dart paketleri ara...';

  @override
  String get searchFailed => 'Arama başarısız, ağınızı kontrol edin';

  @override
  String get searchEmpty => 'İhtiyacınız olan Flutter/Dart paketlerini arayın';

  @override
  String get searchNoResults => 'Paket bulunamadı';

  @override
  String get hotRecommend => 'Popüler öneriler';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get install => 'Yükle';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README yükleniyor...';

  @override
  String get about => 'Hakkında';

  @override
  String get topics => 'Konular';

  @override
  String get details => 'Ayrıntılar';

  @override
  String get language => 'Dil';

  @override
  String get selectLanguage => 'Dil seçin';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get checkUpdate => 'Güncellemeleri kontrol et';

  @override
  String get autoTranslate => 'Otomatik çeviri';

  @override
  String get autoTranslateDesc => 'OpenAI uyumlu API çevirisi';

  @override
  String get latestVersion => 'En son';

  @override
  String get publishDate => 'Yayınlanma';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Bağımlılıklar';

  @override
  String get links => 'Bağlantılar';

  @override
  String get homepage => 'Ana sayfa';

  @override
  String get repository => 'Depo';

  @override
  String get dependencies => 'Bağımlılıklar';

  @override
  String get noDependencies => 'Doğrudan bağımlılık yok';

  @override
  String get versionHistory => 'Sürüm geçmişi';

  @override
  String moreVersions(int count) {
    return '$count eski sürüm...';
  }

  @override
  String get latest => 'en son';

  @override
  String get copied => 'Kopyalandı';

  @override
  String get copiedToClipboard => 'Kod panoya kopyalandı';

  @override
  String get favoritesFolders => 'Klasörler';

  @override
  String get noFavorites => 'Henüz favori yok';

  @override
  String get noFavoritesHint =>
      'Favorilere eklemek için arama sonuçlarındaki kalp simgesine dokunun';

  @override
  String emptyFolder(String name) {
    return '\"$name\" favorisi yok';
  }

  @override
  String get createFolder => 'Yeni klasör';

  @override
  String get folderName => 'Klasör adı';

  @override
  String get create => 'Oluştur';

  @override
  String get rename => 'Yeniden adlandır';

  @override
  String get delete => 'Sil';

  @override
  String get renameFolder => 'Klasörü yeniden adlandır';

  @override
  String get deleteFolder => 'Klasörü sil';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" silinsin mi? İçindeki paketler kaldırılacak.';
  }

  @override
  String get cancel => 'İptal';

  @override
  String get confirm => 'Onayla';

  @override
  String get folderExists => 'Klasör zaten var';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" konumundan kaldırılsın mı?';
  }

  @override
  String get removeFavorite => 'Favorilerden kaldır';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" favorilerden kaldırılsın mı?';
  }

  @override
  String get addToOtherFolders => 'Diğer klasörlere ekle';

  @override
  String get selectFolder => 'Klasör seçin';

  @override
  String get createAndAdd => 'Oluştur ve ekle';

  @override
  String favoriteManaged(String folders) {
    return 'Kaydedildi: $folders';
  }

  @override
  String get cancelAllFavorites => 'Tümünden kaldır';

  @override
  String get pubMirror => 'Pub aynası';

  @override
  String get pubMirrorHint => 'Paket araması için yeni ayna kaynağına geç';

  @override
  String get githubMirror => 'GitHub aynası';

  @override
  String get githubRawMirror => 'GitHub Raw aynası';

  @override
  String get githubMirrorHint =>
      'Paket README almak için, Çin\'de ayna kullanımı önerilir';

  @override
  String get appearance => 'Görünüm';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get selectTheme => 'Tema seçin';

  @override
  String get themeColor => 'Tema rengi';

  @override
  String get data => 'Veri';

  @override
  String get clearCache => 'Önbelleği temizle';

  @override
  String get clearCacheSubtitle => 'Tüm API önbellek verilerini temizle';

  @override
  String get clearCacheTitle => 'Önbelleği temizle';

  @override
  String get clearCacheConfirm =>
      'Tüm API önbelleği temizlensin mi? Favoriler ve ayarlar silinmeyecek.';

  @override
  String get cacheCleared => 'Önbellek temizlendi';

  @override
  String get aboutPubPub => 'PubPub hakkında';

  @override
  String version(String version) {
    return 'Sürüm $version';
  }

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String get aboutDescription => 'Çapraz platform Pub ayna tarayıcısı';

  @override
  String get features => 'Özellikler';

  @override
  String get featureSearch => 'Paket arama';

  @override
  String get featureSearchDesc => 'Birden fazla Pub aynasında arama';

  @override
  String get featureDetail => 'Paket ayrıntıları';

  @override
  String get featureDetailDesc =>
      'Sürüm, bağımlılıklar, tam README görüntüleme';

  @override
  String get featureFavorites => 'Özel koleksiyonlar';

  @override
  String get featureFavoritesDesc =>
      'Düzenlemek için birden fazla klasör oluşturun';

  @override
  String get featureTheme => 'Tema özelleştirme';

  @override
  String get featureThemeDesc => '10 tema rengi + koyu mod';

  @override
  String get featureLayout => 'Duyarlı düzen';

  @override
  String get featureLayoutDesc => 'Mobil/masaüstü uyarlaması';

  @override
  String get techStack => 'Teknoloji yığını';

  @override
  String get linksTitle => 'Bağlantılar';

  @override
  String get githubRepo => 'GitHub deposu';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Resmi';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Lisans';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter ile ❤️ ile yapıldı';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get error => 'Hata';

  @override
  String get success => 'Başarılı';

  @override
  String get ok => 'Tamam';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayır';
}
