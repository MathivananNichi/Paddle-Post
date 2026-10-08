import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/splash/presentation/widgets/widgets.dart';

/// The initial splash screen displaying animated bouncing balls, logo reveal, and startup progress.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<SplashTextAnimationState> _textAnimKey = GlobalKey<SplashTextAnimationState>();
  final GlobalKey<SplashProgressIndicatorState> _progressKey =
      GlobalKey<SplashProgressIndicatorState>();

  bool _textAnimationStarted = false;
  bool _progressAnimationStarted = false;

  void _onBallAnimationProgress(double progress) {
    if (progress > 0.4 && !_textAnimationStarted) {
      _textAnimationStarted = true;
      _textAnimKey.currentState?.play();
    }
  }

  void _onTextAnimationProgress(double progress) {
    if (progress > 0.5 && !_progressAnimationStarted) {
      _progressAnimationStarted = true;
      _progressKey.currentState?.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return AppScaffold(
      safeAreaTop: false,
      body: Center(
        child: Stack(
          children: [
            // Background glow
            if (context.isDarkMode)
              Positioned.fill(child: Container(decoration: AppDecoration.splashBackgroundGlow)),

            Column(
              children: [
                SizedBox(height: screenSize.height * 0.32),
                BouncingBall(gap: 10, onChangeAnimation: _onBallAnimationProgress),
                const SizedBox(height: AppSize.s10),
                SplashTextAnimation(
                  key: _textAnimKey,
                  onChangeAnimation: _onTextAnimationProgress,
                  children: [
                    const PaddlePostLogo(),
                    AppText(context.l10n.scoringCompanion, style: AppTextTheme.splashSubtitle),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: screenSize.width * 0.35,
                  child: SplashProgressIndicator(
                    key: _progressKey,
                    onComplete: () {
                      if (mounted) {
                        context.goNamed(AppRoutes.paddlePostName);
                      }
                    },
                  ),
                ),
                SizedBox(height: screenSize.height * 0.08),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
