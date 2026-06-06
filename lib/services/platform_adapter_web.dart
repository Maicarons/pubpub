import 'package:dio/dio.dart';
import 'package:dio_web_adapter/dio_web_adapter.dart';

/// Web 端适配器（使用 BrowserHttpClientAdapter）
HttpClientAdapter createHttpClientAdapter() {
  return BrowserHttpClientAdapter();
}
