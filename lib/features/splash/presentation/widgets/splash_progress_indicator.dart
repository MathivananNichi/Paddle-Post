import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Progress bar and status text widget with built-in fade transition for the splash screen.
class SplashProgressIndicator extends StatefulWidget {
  const SplashProgressIndicator({
    super.key,
    this.label,
    this.duration = const Duration(seconds: 3),
    this.fadeDuration = const Duration(milliseconds: 500),
    this.onComplete,
  });

  /// Custom status text. Defaults to localized [context.l10n.startingUp] when null.
  final String? label;

  /// Duration for the progress bar to reach 100%.
  final Duration duration;

  /// Duration for the initial fade-in transition.
  final Duration fadeDuration;

  /// Optional callback invoked when the progress bar reaches 100%.
  final VoidCallback? onComplete;

  @override
  State<SplashProgressIndicator> createState() => SplashProgressIndicatorState();
}

class SplashProgressIndicatorState extends State<SplashProgressIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;
  late final AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(vsync: this, duration: widget.fadeDuration);
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    _progressController = AnimationController(vsync: this, duration: widget.duration);

    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _progressController.forward();
      }
    });

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  /// Plays the fade-in transition followed by the progress bar fill animation.
  void play() {
    if (!_fadeController.isAnimating && !_fadeController.isCompleted) {
      _fadeController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveLabel = widget.label ?? context.l10n.startingUp;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSize.s16,
        children: [
          AnimatedBuilder(
            animation: _progressController,
            builder: (context, _) {
              return LinearProgressIndicator(
                value: _progressController.value,
                minHeight: AppSize.s3,
                backgroundColor: context.paddleColors.surfaceHighlight,
                valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
              );
            },
          ),
          AppText(effectiveLabel, style: AppTextTheme.progressLabel),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _progressController.dispose();
    super.dispose();
  }
}
