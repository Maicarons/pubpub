// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDetail _$PackageDetailFromJson(Map<String, dynamic> json) =>
    PackageDetail(
      name: json['name'] as String,
      latest: json['latest'] == null
          ? null
          : PackageLatest.fromJson(json['latest'] as Map<String, dynamic>),
      versions: (json['versions'] as List<dynamic>?)
          ?.map((e) => PackageVersionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackageDetailToJson(PackageDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latest': instance.latest,
      'versions': instance.versions,
    };

PackageLatest _$PackageLatestFromJson(Map<String, dynamic> json) =>
    PackageLatest(
      version: json['version'] as String?,
      pubspec: json['pubspec'] == null
          ? null
          : PackagePubspec.fromJson(json['pubspec'] as Map<String, dynamic>),
      archiveUrl: json['archive_url'] as String?,
      published: json['published'] as String?,
    );

Map<String, dynamic> _$PackageLatestToJson(PackageLatest instance) =>
    <String, dynamic>{
      'version': instance.version,
      'pubspec': instance.pubspec,
      'archive_url': instance.archiveUrl,
      'published': instance.published,
    };

PackagePubspec _$PackagePubspecFromJson(Map<String, dynamic> json) =>
    PackagePubspec(
      name: json['name'] as String?,
      version: json['version'] as String?,
      description: json['description'] as String?,
      homepage: json['homepage'] as String?,
      repository: json['repository'] as String?,
      issueTracker: json['issue_tracker'] as String?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      environment: json['environment'] == null
          ? null
          : PackageEnvironment.fromJson(
              json['environment'] as Map<String, dynamic>,
            ),
      dependencies: json['dependencies'] as Map<String, dynamic>?,
      devDependencies: json['dev_dependencies'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PackagePubspecToJson(PackagePubspec instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'description': instance.description,
      'homepage': instance.homepage,
      'repository': instance.repository,
      'issue_tracker': instance.issueTracker,
      'topics': instance.topics,
      'environment': instance.environment,
      'dependencies': instance.dependencies,
      'dev_dependencies': instance.devDependencies,
    };

PackageEnvironment _$PackageEnvironmentFromJson(Map<String, dynamic> json) =>
    PackageEnvironment(
      sdk: json['sdk'] as String?,
      flutter: json['flutter'] as String?,
    );

Map<String, dynamic> _$PackageEnvironmentToJson(PackageEnvironment instance) =>
    <String, dynamic>{'sdk': instance.sdk, 'flutter': instance.flutter};

PackageVersionEntry _$PackageVersionEntryFromJson(Map<String, dynamic> json) =>
    PackageVersionEntry(
      version: json['version'] as String?,
      pubspec: json['pubspec'] == null
          ? null
          : PackagePubspec.fromJson(json['pubspec'] as Map<String, dynamic>),
      archiveUrl: json['archive_url'] as String?,
      published: json['published'] as String?,
    );

Map<String, dynamic> _$PackageVersionEntryToJson(
  PackageVersionEntry instance,
) => <String, dynamic>{
  'version': instance.version,
  'pubspec': instance.pubspec,
  'archive_url': instance.archiveUrl,
  'published': instance.published,
};
