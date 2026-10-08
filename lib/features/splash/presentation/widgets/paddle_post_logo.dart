import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Logo text combining the two PaddlePost brand accent colors.
class PaddlePostLogo extends StatelessWidget {
  const PaddlePostLogo({this.fontSize = 36.0, this.letterSpacing = 1.5, super.key});

  final double fontSize;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppTextTheme.logo(
      color: context.paddleColors.brandA,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );

    return RichText(
      text: TextSpan(
        text: 'PADDLE',
        style: baseStyle,
        children: [
          TextSpan(
            text: 'POST',
            style: baseStyle.copyWith(color: context.paddleColors.brandB),
          ),
        ],
      ),
    );
  }
}
