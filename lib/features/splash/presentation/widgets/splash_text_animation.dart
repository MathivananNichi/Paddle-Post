import 'package:flutter/material.dart';

/// Staggered animated container that slides up, scales, and fades in its child widgets.
class SplashTextAnimation extends StatefulWidget {
  const SplashTextAnimation({
    required this.children,
    super.key,
    this.delay = 0.15,
    this.duration = const Duration(milliseconds: 500),
    this.onAnimationComplete,
    this.onChangeAnimation,
    this.spacing = 10,
    this.bottomOffset = 30,
  });

  /// The list of widgets to animate sequentially.
  final List<Widget> children;

  /// Stagger delay between consecutive child animations.
  final double delay;
  final double bottomOffset;

  /// Stagger delay between consecutive child animations.
  final double spacing;

  /// Total duration of the animation sequence.
  final Duration duration;

  /// Optional callback invoked when the full animation finishes.
  final VoidCallback? onAnimationComplete;

  /// Callback invoked whenever the animation progress value changes.
  final ValueChanged<double>? onChangeAnimation;

  @override
  State<SplashTextAnimation> createState() => SplashTextAnimationState();
}

class SplashTextAnimationState extends State<SplashTextAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      }
    });

    _controller.addListener(() {
      widget.onChangeAnimation?.call(_controller.value);
    });
  }

  /// Triggers the forward animation playback.
  void play() {
    if (!_controller.isAnimating && !_controller.isCompleted) {
      _controller.forward(from: 0);
    }
  }

  /// Triggers the forward animation playback.
  void reset() {
    if (!_controller.isAnimating && !_controller.isCompleted) {
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.children.length;
    if (count == 0) return const SizedBox.shrink();

    final itemDuration = (1.0 - widget.delay * (count - 1)).clamp(0.1, 1.0);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: widget.spacing,
          children: List.generate(count, (index) {
            final double bottomOffset = widget.bottomOffset;

            final start = (index * widget.delay).clamp(0.0, 1.0);
            final end = (start + itemDuration).clamp(0.0, 1.0);

            final interval = Interval(start, end, curve: Curves.easeOut);
            final progress = interval.transform(_controller.value);

            final scaleCurve = Interval(start, end, curve: Curves.easeOut);
            final scale = 0.7 + (0.3 * scaleCurve.transform(_controller.value));
            final currentBottomOffset = bottomOffset * (1.0 - progress);

            return Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: progress,
                child: Transform.translate(
                  offset: Offset(0, currentBottomOffset),
                  child: widget.children[index],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
