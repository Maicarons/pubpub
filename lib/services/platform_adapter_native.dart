import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// Native 平台适配器（使用 IO HttpClientAdapter）
HttpClientAdapter createHttpClientAdapter() {
  return IOHttpClientAdapter();
}
