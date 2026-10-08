import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paddle_post/core/constants/constants.dart';
import 'package:paddle_post/core/theme/theme.dart';
import 'package:paddle_post/core/widgets/app_text.dart';

/// Glowing and shimmering call-to-action button matching the PaddlePost prototype.
///
/// Features a continuous expanding ambient pulse ring (`ppGlow`) and a sweeping
/// diagonal shine reflection (`ppShine`).
class ShineButton extends StatefulWidget {
  const ShineButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.color = AppColors.primary,
    this.height = 56.0,
    this.borderRadius = AppRadius.r18,
    this.isLoading = false,
    this.icon,
  });

  /// Button label text.
  final String label;

  /// Callback when the button is tapped.
  final VoidCallback? onPressed;

  /// Main background color.
  final Color color;

  /// Button height.
  final double height;

  /// Corner radius for the button and glow ring.
  final double borderRadius;

  /// Whether to show a loading spinner.
  final bool isLoading;

  /// Optional custom trailing icon. Defaults to arrow forward.
  final Widget? icon;

  @override
  State<ShineButton> createState() => _ShineButtonState();
}

class _ShineButtonState extends State<ShineButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _ringInterval = Interval(0.12, 0.92, curve: Curves.easeOut);
  static const _sweepInterval = Interval(0.22, 0.88, curve: Curves.easeInOut);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final r = _ringInterval.transform(_controller.value);
        final ringGrow = 14.0 * r;
        final ringAlpha = 0.35 * (1 - r) * (r * 10).clamp(0.0, 1.0);
        final sweep = _sweepInterval.transform(_controller.value);

        return GestureDetector(
          onTap: widget.isLoading ? null : widget.onPressed,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Expanding glow ring behind the button
              Positioned(
                left: -ringGrow,
                right: -ringGrow,
                top: -ringGrow,
                bottom: -ringGrow,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius + ringGrow),
                    color: widget.color.withValues(alpha: ringAlpha),
                  ),
                ),
              ),

              // Button body container with elevation shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.45),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Container(
                    height: widget.height,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: widget.color,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Sweeping diagonal shine light
                        if (!widget.isLoading)
                          LayoutBuilder(
                            builder: (context, box) {
                              final band = box.maxWidth * 0.28;
                              final x = lerpDouble(-band * 1.5, box.maxWidth + band, sweep)!;

                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: x,
                                    top: 0,
                                    bottom: 0,
                                    width: band,
                                    child: Transform(
                                      transform: Matrix4.skewX(-0.35),
                                      child: const DecoratedBox(
                                        decoration: AppDecoration.shineGradient,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                        // Foreground content: label and arrow or loading spinner
                        if (widget.isLoading)
                          const SizedBox.square(
                            dimension: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        else
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: AppText(
                                      widget.label,
                                      maxLines: 1,
                                      style: AppTextTheme.shineButton,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s8),
                              widget.icon ??
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
