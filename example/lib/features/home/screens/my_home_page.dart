import 'package:example/features/home/providers/api_version_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version/version.dart';

import 'package:flutter_compatibility/flutter_compatibility.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const VersionButton(),
            Text("apiVersion: ${CompatibleScope.containerOf(context).version}"),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: Column(
                children: [
                  CompatibleBuilder(
                    minVersion: Version(1, 0, 0),
                    includeMax: false,
                    builder: (context) {
                      return const Text(">=1.0.0");
                    },
                  ),
                  CompatibleBuilder(
                    maxVersion: Version(1, 2, 5),
                    builder: (context) {
                      return const Text("<=1.2.5");
                    },
                  ),
                  CompatibleBuilder(
                    minVersion: Version(1, 2, 5),
                    includeMin: false,
                    builder: (context) {
                      return const Text(">1.2.5");
                    },
                  ),
                  CompatibleBuilder(
                    minVersion: Version(1, 2, 0),
                    maxVersion: Version(1, 5, 0),
                    includeMax: false,
                    builder: (context) {
                      return const Text(">=1.2.0, <1.5.0");
                    },
                  ),
                  CompatibleBuilder(
                    minVersion: Version(1, 2, 0),
                    maxVersion: Version(1, 5, 0),
                    builder: (context) {
                      return const Text(">=1.2.0, <=1.5.0");
                    },
                  ),
                  CompatibleBuilder(
                    minVersion: Version(2, 0, 0),
                    maxVersion: Version(3, 0, 0),
                    includeMax: false,
                    includeMin: false,
                    builder: (context) {
                      return const Text(">2.0.0, <3.0.0");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VersionButton extends ConsumerWidget {
  const VersionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          ref.read(apiVersionProvider.notifier).fetch();
        },
        child: const Text("fetch apiVersion"),
      ),
    );
  }
}
