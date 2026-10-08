import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Self-contained bouncing balls collision and recoil animation.
///
/// Features two glowing player balls (Player 1 Blue & Player 2 Orange) moving
/// inward simultaneously from opposite sides, colliding at the center line at 60%
/// of the timeline, and bouncing backward to rest with a specified [gap] (default 20px).
class BouncingBall extends StatefulWidget {
  const BouncingBall({
    super.key,
    this.duration = const Duration(milliseconds: 1600),
    this.ballSize = 25.0,
    this.gap = AppSize.s20,
    this.travelDistance = 160.0,
    this.showCourtBackground = true,
    this.onAnimationComplete,
    this.onChangeAnimation,
  });

  /// Duration of the full collision and bounce sequence.
  final Duration duration;

  /// Diameter of each glowing ball.
  final double ballSize;

  /// Gap between the two balls after bouncing back.
  final double gap;

  /// Inward travel distance for each ball before collision.
  final double travelDistance;

  /// Whether to render the split court background behind the balls.
  final bool showCourtBackground;

  /// Optional callback invoked when the animation finishes.
  final VoidCallback? onAnimationComplete;

  /// Callback invoked whenever the animation progress value changes.
  final ValueChanged<double>? onChangeAnimation;

  @override
  State<BouncingBall> createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall> with SingleTickerProviderStateMixin {
  static const double _collisionKeyframe = 0.6;
  static const double _bounceKeyframe = 0.4;

  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _fadeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 25,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 75),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      }
    });

    _controller.addListener(() {
      widget.onChangeAnimation?.call(_controller.value);
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final ballSize = widget.ballSize;
    // Total container height accommodates the glowing ball + its blur spread
    final containerHeight = ballSize + AppSize.s24;

    return SizedBox(
      height: containerHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final center = width / 2;

          // Symmetrical offsets from screen edges (shared by both left and right balls)
          final collisionOffset = center - ballSize;
          final startOffset = collisionOffset - widget.travelDistance;
          final restingOffset = collisionOffset - (widget.gap / 2);

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final ballOffset = _computeOffset(
                progress: _controller.value,
                start: startOffset,
                hit: collisionOffset,
                resting: restingOffset,
              );

              return SizedBox(
                width: width,
                height: containerHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // Left Player Ball (Blue) - positioned from left edge
                    Positioned(
                      left: ballOffset,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: _GlowingBall(
                          color: AppColors.darkPlayer1Glow,
                          glowColor: AppColors.darkPlayer1Glow,
                          size: ballSize,
                        ),
                      ),
                    ),

                    // Right Player Ball (Orange) - symmetrically positioned from right edge
                    Positioned(
                      right: ballOffset,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: _GlowingBall(
                          color: AppColors.darkPlayer2Glow,
                          glowColor: AppColors.darkPlayer2Glow,
                          size: ballSize,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Calculates the symmetrical horizontal offset across the two animation phases.
  double _computeOffset({
    required double progress,
    required double start,
    required double hit,
    required double resting,
  }) {
    if (progress <= _collisionKeyframe) {
      // Phase 1 (0% -> 60%): Inward travel to center impact
      final t = Curves.easeInCubic.transform(progress / _collisionKeyframe);
      return start + (hit - start) * t;
    } else {
      // Phase 2 (60% -> 100%): Recoil bounce back to resting position
      final t = Curves.easeOutCubic.transform((progress - _collisionKeyframe) / _bounceKeyframe);
      return hit + (resting - hit) * t;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// Individual glowing player ball widget with dynamic glow shadow.
class _GlowingBall extends StatelessWidget {
  const _GlowingBall({required this.color, required this.glowColor, required this.size});

  final Color color;
  final Color glowColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: AppDecoration.glowingBall(color: color, glowColor: glowColor),
    );
  }
}
