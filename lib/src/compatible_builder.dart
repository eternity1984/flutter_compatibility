import 'package:flutter/widgets.dart';
import 'package:flutter_compatibility/flutter_compatibility.dart';
import 'package:version/version.dart';

class CompatibleBuilder extends StatelessWidget {
  final WidgetBuilder builder;
  final Version? minVersion;
  final Version? maxVersion;
  final bool includeMin;
  final bool includeMax;

  CompatibleBuilder({
    super.key,
    required this.builder,
    this.minVersion,
    this.maxVersion,
    this.includeMin = true,
    this.includeMax = true,
  }) {
    debugAssertIsValid();
  }

  @override
  Widget build(BuildContext context) {
    final version = CompatibleScope.containerOf(context).version;
    if (version == null) return const SizedBox.shrink();

    int a = minVersion?.compareTo(version) ?? -1;
    int b = maxVersion?.compareTo(version) ?? 1;

    if (((a < 0) || (includeMin && (a == 0))) &&
        ((0 < b) || (includeMax && (b == 0)))) {
      return builder(context);
    }
    return const SizedBox.shrink();
  }

  void debugAssertIsValid() {
    if ((minVersion == null) || (maxVersion == null)) return;
    assert(minVersion!.compareTo(maxVersion!) <= 0);
  }
}
