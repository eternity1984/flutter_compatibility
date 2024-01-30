import 'package:flutter/widgets.dart';
import 'package:version/version.dart';

final class CompatibleScope extends StatefulWidget {
  final Version? version;
  final Widget child;

  const CompatibleScope({
    super.key,
    required this.child,
    this.version,
  });

  static CompatibleScopeContainer containerOf(
    BuildContext context, {
    bool listen = true,
  }) {
    _UncontrolledScope? scope = listen
        ? context.dependOnInheritedWidgetOfExactType<_UncontrolledScope>()
        : context
            .getElementForInheritedWidgetOfExactType<_UncontrolledScope>()
            ?.widget as _UncontrolledScope;

    assert(scope != null, 'No CompatibleScope found with context: $context');
    return scope!.container;
  }

  @override
  State<CompatibleScope> createState() => _CompatibleScopeState();
}

class CompatibleScopeContainer {
  final _CompatibleScopeState _data;
  final Version? version;

  CompatibleScopeContainer._(this._data, {required this.version});

  void update(Version? version) => _data.update(version);
}

class _CompatibleScopeState extends State<CompatibleScope> {
  late CompatibleScopeContainer container;

  @override
  void initState() {
    super.initState();
    container = CompatibleScopeContainer._(this, version: widget.version);
  }

  void update(Version? version) {
    setState(() {
      container = CompatibleScopeContainer._(this, version: version);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _UncontrolledScope(container: container, child: widget.child);
  }
}

class _UncontrolledScope extends InheritedWidget {
  final CompatibleScopeContainer container;

  const _UncontrolledScope({required super.child, required this.container});

  @override
  bool updateShouldNotify(_UncontrolledScope oldWidget) {
    return container != oldWidget.container;
  }
}
