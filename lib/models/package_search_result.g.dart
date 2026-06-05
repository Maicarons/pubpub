// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageSearchResult _$PackageSearchResultFromJson(Map<String, dynamic> json) =>
    PackageSearchResult(
      packages: (json['packages'] as List<dynamic>)
          .map((e) => PackageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PackageSearchResultToJson(
  PackageSearchResult instance,
) => <String, dynamic>{'packages': instance.packages, 'next': instance.next};

PackageItem _$PackageItemFromJson(Map<String, dynamic> json) =>
    PackageItem(package: json['package'] as String);

Map<String, dynamic> _$PackageItemToJson(PackageItem instance) =>
    <String, dynamic>{'package': instance.package};
