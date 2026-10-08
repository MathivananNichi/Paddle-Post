import 'package:flutter/material.dart';

/// 0.85x at <=320dp tall -> 1.25x at >=800dp tall, linear in between.
double fontScaleFor(double height) => 0.85 + ((height - 320) / 480).clamp(0.0, 1.0) * 0.40;

/// Wrap each screen root with this ONCE. Never nest it (the scale would compound).
class AdaptiveScale extends StatelessWidget {
  const AdaptiveScale({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, c) => _ScaleScope(scale: fontScaleFor(c.maxHeight), child: child),
  );
}

class _ScaleScope extends InheritedWidget {
  const _ScaleScope({required this.scale, required super.child});
  final double scale;

  @override
  bool updateShouldNotify(_ScaleScope old) => old.scale != scale;
}

extension AdaptiveScaleX on BuildContext {
  double get adaptiveScale => dependOnInheritedWidgetOfExactType<_ScaleScope>()?.scale ?? 1.0;
}
