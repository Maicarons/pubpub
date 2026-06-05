import 'package:json_annotation/json_annotation.dart';

part 'package_detail.g.dart';

/// 包详情数据模型（匹配实际 API 结构）
@JsonSerializable()
class PackageDetail {
  final String name;
  final PackageLatest? latest;
  final List<PackageVersionEntry>? versions;

  PackageDetail({
    required this.name,
    this.latest,
    this.versions,
  });

  /// 便捷访问
  String get latestVersion => latest?.version ?? '';
  String get description => latest?.pubspec?.description ?? '';
  String get homepage => latest?.pubspec?.homepage ?? '';
  String get repository => latest?.pubspec?.repository ?? '';
  List<String> get topics => latest?.pubspec?.topics ?? [];
  String get dartSdkConstraint => latest?.pubspec?.environment?.sdk ?? '';
  String? get flutterSdkConstraint => latest?.pubspec?.environment?.flutter;
  Map<String, String> get dependencies {
    final raw = latest?.pubspec?.dependencies;
    if (raw == null) return {};
    return raw.map((k, v) => MapEntry(k, _depToString(v)));
  }

  Map<String, String> get devDependencies {
    final raw = latest?.pubspec?.devDependencies;
    if (raw == null) return {};
    return raw.map((k, v) => MapEntry(k, _depToString(v)));
  }

  static String _depToString(dynamic v) {
    if (v is String) return v;
    if (v is Map) {
      if (v.containsKey('version')) return v['version'].toString();
      if (v.containsKey('git')) return 'git';
      if (v.containsKey('path')) return 'path';
      return v.toString();
    }
    return v.toString();
  }
  String get published => latest?.published ?? '';

  factory PackageDetail.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDetailToJson(this);
}

/// latest 字段
@JsonSerializable()
class PackageLatest {
  final String? version;
  final PackagePubspec? pubspec;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  final String? published;

  PackageLatest({this.version, this.pubspec, this.archiveUrl, this.published});

  factory PackageLatest.fromJson(Map<String, dynamic> json) =>
      _$PackageLatestFromJson(json);

  Map<String, dynamic> toJson() => _$PackageLatestToJson(this);
}

/// pubspec 字段
@JsonSerializable()
class PackagePubspec {
  final String? name;
  final String? version;
  final String? description;
  final String? homepage;
  final String? repository;
  @JsonKey(name: 'issue_tracker')
  final String? issueTracker;
  final List<String>? topics;
  final PackageEnvironment? environment;
  final Map<String, dynamic>? dependencies;
  @JsonKey(name: 'dev_dependencies')
  final Map<String, dynamic>? devDependencies;

  PackagePubspec({
    this.name,
    this.version,
    this.description,
    this.homepage,
    this.repository,
    this.issueTracker,
    this.topics,
    this.environment,
    this.dependencies,
    this.devDependencies,
  });

  factory PackagePubspec.fromJson(Map<String, dynamic> json) =>
      _$PackagePubspecFromJson(json);

  Map<String, dynamic> toJson() => _$PackagePubspecToJson(this);
}

/// environment 字段
@JsonSerializable()
class PackageEnvironment {
  final String? sdk;
  final String? flutter;

  PackageEnvironment({this.sdk, this.flutter});

  factory PackageEnvironment.fromJson(Map<String, dynamic> json) =>
      _$PackageEnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$PackageEnvironmentToJson(this);
}

/// versions 列表中的单个版本
@JsonSerializable()
class PackageVersionEntry {
  final String? version;
  final PackagePubspec? pubspec;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  final String? published;

  PackageVersionEntry({
    this.version,
    this.pubspec,
    this.archiveUrl,
    this.published,
  });

  factory PackageVersionEntry.fromJson(Map<String, dynamic> json) =>
      _$PackageVersionEntryFromJson(json);

  Map<String, dynamic> toJson() => _$PackageVersionEntryToJson(this);
}
