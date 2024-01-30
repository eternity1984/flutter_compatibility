// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:version/version.dart';

class ApiVersionResponse {
  final Version version;

  ApiVersionResponse({
    required this.version,
  });

  ApiVersionResponse copyWith({
    Version? version,
  }) {
    return ApiVersionResponse(
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version.toString(),
    };
  }

  factory ApiVersionResponse.fromMap(Map<String, dynamic> map) {
    return ApiVersionResponse(
      version: Version.parse(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiVersionResponse.fromJson(String source) =>
      ApiVersionResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiVersion(version: $version)';

  @override
  bool operator ==(covariant ApiVersionResponse other) {
    if (identical(this, other)) return true;

    return other.version == version;
  }

  @override
  int get hashCode => version.hashCode;
}
