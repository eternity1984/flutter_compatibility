import 'package:example/features/home/providers/api_version_notifier.dart';
import 'package:example/features/home/repositories/api_version_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version/version.dart';

final repoProvider = Provider<ApiVersionRepository>((_) {
  throw UnimplementedError();
});

final apiVersionProvider = StateNotifierProvider<ApiVersionNotifier, Version?>(
  (ref) => ApiVersionNotifier(ref),
);
