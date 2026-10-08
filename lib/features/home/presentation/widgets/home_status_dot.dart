import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Glowing indicator dot used in status chips.
class HomeStatusDot extends StatelessWidget {
  const HomeStatusDot({this.color, this.size = 7.0, super.key});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: AppDecoration.statusDot(color: color ?? context.paddleColors.success),
    );
  }
}
