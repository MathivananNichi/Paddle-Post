import 'package:flutter/material.dart';

/// Simple custom elevated button for PaddlePost with built-in loading support.
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onPressed,
    super.key,
    this.child,
    this.label,
    this.icon,
    this.style,
    this.isLoading = false,
    this.loadingWidget,
    this.height,
    this.width,
  });

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// Custom child widget. If null, uses [label].
  final Widget? child;

  /// Text label displayed when [child] is not provided.
  final String? label;

  /// Optional leading icon widget.
  final Widget? icon;

  /// Custom button style.
  final ButtonStyle? style;

  /// Shows a loading indicator and disables user interaction when true.
  final bool isLoading;

  /// Optional custom loading widget. Defaults to a themed [CircularProgressIndicator].
  final Widget? loadingWidget;

  /// Optional explicit height constraint.
  final double? height;

  /// Optional explicit width constraint.
  final double? width;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (isLoading) {
      content =
          loadingWidget ??
          const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
    } else if (icon != null) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon!, const SizedBox(width: 8), child ?? Text(label ?? '')],
      );
    } else {
      content = child ?? Text(label ?? '');
    }

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: content,
    );

    if (height != null || width != null) {
      return SizedBox(width: width, height: height, child: button);
    }

    return button;
  }
}
