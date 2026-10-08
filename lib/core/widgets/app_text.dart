import 'package:flutter/material.dart';
import 'package:paddle_post/core/adaptive/adaptive_scale.dart';

/// Lightweight custom text widget for PaddlePost.
///
/// Wraps Flutter's [Text] widget passing [style] and standard text configuration values.
/// Scales font size dynamically based on [AdaptiveScaleX.adaptiveScale].
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.semanticsLabel,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    final base = style ?? defaultStyle;
    final finalStyle = base.copyWith(fontSize: (base.fontSize ?? 14) * context.adaptiveScale);

    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }
}
