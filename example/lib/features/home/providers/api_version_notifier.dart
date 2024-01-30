import 'package:example/features/home/providers/api_version_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version/version.dart';

class ApiVersionNotifier extends StateNotifier<Version?> {
  final Ref ref;

  ApiVersionNotifier(this.ref) : super(null);

  Future<void> fetch() async {
    final response = await ref.read(repoProvider).fetch();
    response.fold(
      (failure) => state = null,
      (data) => state = data.version,
    );
  }
}
