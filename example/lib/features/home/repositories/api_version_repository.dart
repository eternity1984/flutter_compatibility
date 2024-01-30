import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:example/features/home/models/api_version_response.dart';
import 'package:version/version.dart';

abstract class ApiVersionRepository {
  Future<Either<String, ApiVersionResponse>> fetch();
}

class ApiVersionRepositoryImplForTesting extends ApiVersionRepository {
  @override
  Future<Either<String, ApiVersionResponse>> fetch() async {
    var random = math.Random();
    int major = random.nextInt(3);
    int minor = random.nextInt(10);
    int patch = random.nextInt(2);

    return Right(ApiVersionResponse(version: Version(major, minor, patch)));
  }
}
