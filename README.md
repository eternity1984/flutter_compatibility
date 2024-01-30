# flutter_compatibility

[![Pub](https://img.shields.io/pub/v/flutter_compatibility)](https://pub.dev/packages/flutter_compatibility)

These are useful if you have widgets that depend on the api version of backend.

## Installation 
Add dependency for package on your pubspec.yaml:

```
dependencies:
    version: <latest>
```

## Example

A widget is created only if the version specified in `CompatibleScope` satisfies the conditions of `CompatibleBuilder`.

If the `version` parameter of `CompatibleScope` is `null`, `CompatibleBuilder` will not create the widget.


```dart
import 'package:flutter_compatibility/compatibility.dart';
import 'package:version/version.dart';

void main() {
  runApp(
    CompatibleScope(
      version: Version(1, 0, 0),
      child: const MyApp(),
    )
  );
}
```

```dart
CompatibleBuilder(
  minVersion: Version(2, 0, 0),
  maxVersion: Version(3, 0, 0),
  includeMin: true,
  includeMax: false,
  builder: (context) {
    return const Text(">=2.0.0, <3.0.0");
  },
)
```


To update programmatically:

```dart
CompatibleScope.containerOf(context).update(Version(1, 2, 0));
```


## Contributing

Contributions are welcome!
I am not familiar with the dart programming language and need your help.