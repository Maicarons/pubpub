import 'package:json_annotation/json_annotation.dart';

part 'package_search_result.g.dart';

/// 搜索结果数据模型
@JsonSerializable()
class PackageSearchResult {
  final List<PackageItem> packages;
  final String? next;

  PackageSearchResult({
    required this.packages,
    this.next,
  });

  factory PackageSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PackageSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$PackageSearchResultToJson(this);
}

/// 搜索结果中的单个包（API 只返回包名）
@JsonSerializable()
class PackageItem {
  final String package;

  PackageItem({required this.package});

  factory PackageItem.fromJson(Map<String, dynamic> json) =>
      _$PackageItemFromJson(json);

  Map<String, dynamic> toJson() => _$PackageItemToJson(this);
}
