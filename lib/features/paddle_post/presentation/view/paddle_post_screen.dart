import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/paddle_post/presentation/widgets/widgets.dart';
import 'package:paddle_post/features/splash/presentation/widgets/splash_text_animation.dart';

/// Screen managing the multi-step search, discovery, pairing, and connection to PaddlePost.
class PaddlePostScreen extends StatefulWidget {
  const PaddlePostScreen({this.deviceName = 'PaddlePost-4F2A', super.key});

  /// Name of the target device, configurable from outside.
  final String deviceName;

  @override
  State<PaddlePostScreen> createState() => _PaddlePostScreenState();
}

class _PaddlePostScreenState extends State<PaddlePostScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _radarController;
  final GlobalKey<SplashTextAnimationState> _cardAnimKey = GlobalKey<SplashTextAnimationState>();

  SetupStep _step = SetupStep.initial;
  bool _glowFirstTime = false;
  Timer? _transitionTimer;

  @override
  void initState() {
    super.initState();
    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addListener(_handleRadarAnimationUpdate);
  }

  void _handleRadarAnimationUpdate() {
    if (_glowFirstTime && _radarController.value >= 0.2) {
      setState(() {
        _glowFirstTime = false;
      });
    }
  }

  void _startSearch() {
    _transitionTimer?.cancel();
    _radarController.repeat();
    setState(() {
      _step = SetupStep.searching;
      _glowFirstTime = true;
    });

    _transitionTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _step = SetupStep.found;
        _radarController
          ..stop()
          ..reset();
        Future<void>.delayed(const Duration(milliseconds: 500)).then((_) {
          _cardAnimKey.currentState?.play();
        });
      });
    });
  }

  void _startPairing() {
    _transitionTimer?.cancel();
    setState(() {
      _step = SetupStep.pairing;
    });

    _transitionTimer = Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      setState(() {
        _step = SetupStep.paired;
      });
      AppToast.showSuccess(context, message: context.l10n.pairedSuccessfully);
    });
  }

  void _unpair() {
    _transitionTimer?.cancel();
    _radarController
      ..stop()
      ..reset();
    setState(() {
      _step = SetupStep.initial;
      _glowFirstTime = false;
    });
  }

  void _goToHome() {
    context.goNamed(AppRoutes.homeName);
  }

  @override
  void dispose() {
    _transitionTimer?.cancel();
    _radarController
      ..removeListener(_handleRadarAnimationUpdate)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScale(
      child: AppScaffold(
        safeAreaTop: false,
        body: Row(
          children: [
            Expanded(
              child: SetupInstructionsPanel(
                step: _step,
                deviceName: widget.deviceName,
                onFindPressed: _startSearch,
                onPlayPressed: _goToHome,
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SearchingRadarWidget(
                    animation: _radarController,
                    glowFirstTime: _glowFirstTime,
                    isPaired: _step == SetupStep.paired,
                  ),
                  if (_step != SetupStep.initial && _step != SetupStep.searching)
                    Positioned(
                      child: SplashTextAnimation(
                        key: _cardAnimKey,
                        bottomOffset: 100,
                        children: [
                          DeviceCard(
                            deviceName: widget.deviceName,
                            step: _step,
                            onPair: _startPairing,
                            onUnpair: _unpair,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
