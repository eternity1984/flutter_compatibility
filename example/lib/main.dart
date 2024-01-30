import 'package:example/features/home/providers/api_version_providers.dart';
import 'package:example/features/home/repositories/api_version_repository.dart';
import 'package:example/features/home/screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compatibility/flutter_compatibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version/version.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        repoProvider.overrideWithValue(ApiVersionRepositoryImplForTesting())
      ],
      child: CompatibleScope(
        version: Version(1, 0, 0),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
