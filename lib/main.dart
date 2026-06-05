import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'common/cache_keys.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 Hive
  await Hive.initFlutter();

  // 打开盒子
  await Hive.openBox(CacheKeys.apiCacheBox);
  await Hive.openBox(CacheKeys.favoritesBox);
  await Hive.openBox(CacheKeys.settingsBox);

  runApp(const PubPubApp());
}
