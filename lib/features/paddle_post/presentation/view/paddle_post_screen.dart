import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

class PaddlePostScreen extends StatefulWidget {
  const PaddlePostScreen({super.key});

  @override
  State<PaddlePostScreen> createState() => _PaddlePostScreenState();
}

class _PaddlePostScreenState extends State<PaddlePostScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeAreaTop: false,
      body: Row(
        children: [
          Expanded(child: _leftWidget()),
          const VerticalDivider(),
          Expanded(child: _rightWidget()),
        ],
      ),
    );
  }

  Widget _leftWidget() {
    return LayoutBuilder(
      builder: (context, cons) {
        return FittedBox(
          child: Container(
            width: cons.maxWidth, // fixed width so text wraps the same on every phone
            padding: EdgeInsets.only(
              left: AppPadding.p12,
              top: context.safeArea.top,
              right: AppPadding.p16,
              bottom: AppPadding.p20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  context.l10n.oneTimeSetup,
                  style: TextStyle(
                    fontSize: AppFontSize.s11,
                    letterSpacing: AppLetterSpacing.s1_6,
                    fontWeight: FontWeight.w600,
                    color: context.colors.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p12, bottom: AppPadding.p16),
                  child: AppText(
                    context.l10n.connectPaddlePostTitle,
                    style: TextStyle(
                      fontSize: AppFontSize.s34,
                      letterSpacing: AppLetterSpacing.s0_2,
                      fontWeight: FontWeight.w700,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
                _ConnectStepsCard(count: '1', text: context.l10n.connectStep1),
                const SizedBox(height: AppSize.s14),
                _ConnectStepsCard(count: '2', text: context.l10n.connectStep2),
                const SizedBox(height: 40),
                ShineButton(label: context.l10n.findMyPaddlePost, onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _rightWidget() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomPaint(
          painter: SearchingCirclePainter(progress: _c),
          child: SizedBox(height: constraints.maxHeight, width: constraints.maxWidth),
        );
      },
    );
  }
}

class _ConnectStepsCard extends StatelessWidget {
  const _ConnectStepsCard({required this.count, required this.text});

  final String count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.s6,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colors.surface,
            border: Border.all(color: context.colors.outlineVariant),
          ),
          child: AppText(
            count,
            style: TextStyle(
              fontSize: AppFontSize.s11,
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
        ),
        Flexible(
          child: AppText(
            text,
            style: TextStyle(
              fontSize: AppFontSize.s14,
              fontWeight: FontWeight.w400,
              color: context.paddleColors.textBody,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchingCirclePainter extends CustomPainter {
  SearchingCirclePainter({required this.progress, this.spacing = 40}) : super(repaint: progress);

  final Animation<double> progress; // 0 → 1, repeating
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    if (!size.width.isFinite || !size.height.isFinite) return;

    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide / 2;
    final ringCount = (maxRadius / spacing).floor();
    if (ringCount < 1) return;

    // Wave position: moves from the center (0) to just past the last ring.
    final wave = progress.value * (ringCount + 1);

    for (var i = 1; i <= ringCount; i++) {
      // 1 when the wave is exactly on this ring, 0 when it is 1.5 rings away.
      final glow = (1 - (wave - i).abs() / 1.5).clamp(0.0, 1.0);
      final radius = spacing * i;

      // Base ring (always visible, faint)
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..color = AppColors.warning.withValues(alpha: 0.25 + 0.75 * glow),
      );

      // Glow layer (only while the wave is near)
      if (glow > 0) {
        canvas.drawCircle(
          center,
          radius,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 5
            ..color = AppColors.warning.withValues(alpha: 0.6 * glow)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
        );
      }
    }

    // Center dot with a soft glow
    canvas.drawCircle(
      center,
      14,
      Paint()
        ..color = AppColors.primary.withValues(alpha: 0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawCircle(center, 10, Paint()..color = AppColors.primary);
  }

  @override
  bool shouldRepaint(covariant SearchingCirclePainter old) => old.spacing != spacing;
}
