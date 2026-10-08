import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Animated searching radar wave visualizer.
class SearchingRadarWidget extends StatelessWidget {
  const SearchingRadarWidget({
    required this.animation,
    this.glowFirstTime = false,
    this.isPaired = false,
    this.dotColor,
    super.key,
  });

  final Animation<double> animation;
  final bool glowFirstTime;
  final bool isPaired;
  final Color? dotColor;

  @override
  Widget build(BuildContext context) {
    final effectiveDotColor = dotColor ?? (isPaired ? AppColors.success : AppColors.waveCenter);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return ClipRect(
              child: Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                color: context.colors.surfaceContainerLow,
                child: CustomPaint(
                  painter: SearchingCirclePainter(
                    progress: animation,
                    glowFirstTime: glowFirstTime,
                    dotColor: effectiveDotColor,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Custom painter rendering the radar pulse waves and concentric rings.
class SearchingCirclePainter extends CustomPainter {
  SearchingCirclePainter({
    required this.progress,
    this.spacing = 40,
    this.glowFirstTime = false,
    this.dotColor = AppColors.waveCenter,
  }) : super(repaint: progress);

  final Animation<double> progress;
  final double spacing;
  final bool glowFirstTime;
  final Color dotColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (!size.width.isFinite || !size.height.isFinite) return;

    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide / 2;
    final waveMaxRadius = size.longestSide / 2;
    final ringCount = (maxRadius / spacing).floor();
    const double waveRingRadius = 1;
    final waveRingCount = waveMaxRadius / waveRingRadius.floor();
    if (ringCount < 1) return;

    for (var i = 1; i <= ringCount; i++) {
      final radius = spacing * i;

      // Base ring (always visible, faint)
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..color = (i == ringCount && glowFirstTime) ? AppColors.primary : AppColors.darkRing,
      );
    }

    // Wave position: moves from the center (0) to just past the last ring.
    final wave = progress.value * (waveRingCount + 10);
    const waveInterval = Interval(0.8, 1, curve: Curves.easeOut);
    final radius = waveRingRadius * wave;
    final opacity = 1 - waveInterval.transform(progress.value);

    // Glowing animated wave ring
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.4
        ..color = (dotColor == AppColors.success ? AppColors.success : AppColors.primary)
            .withValues(alpha: opacity),
    );

    // Center dot with a soft glow
    canvas.drawCircle(
      center,
      15,
      Paint()
        ..color = dotColor
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 13),
    );
    canvas.drawCircle(center, 10, Paint()..color = dotColor);
  }

  @override
  bool shouldRepaint(covariant SearchingCirclePainter oldDelegate) =>
      oldDelegate.spacing != spacing ||
      oldDelegate.glowFirstTime != glowFirstTime ||
      oldDelegate.progress != progress ||
      oldDelegate.dotColor != dotColor;
}
