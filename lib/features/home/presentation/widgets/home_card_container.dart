import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Reusable capsule container for status items and action chips on the Home screen.
class HomeCardContainer extends StatelessWidget {
  const HomeCardContainer({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: AppPadding.p14, vertical: AppPadding.p8),
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      decoration: AppDecoration.statusCapsule(
        color: context.colors.surface,
        borderColor: context.paddleColors.digit.withValues(alpha: 0.07),
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(onTap: onTap, borderRadius: AppRadius.all16, child: content);
    }

    return content;
  }
}
