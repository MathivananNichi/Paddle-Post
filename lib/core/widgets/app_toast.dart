import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paddle_post/core/constants/constants.dart';
import 'package:paddle_post/core/theme/theme.dart';
import 'package:paddle_post/core/widgets/app_text.dart';

/// Toast notification utility matching the PaddlePost design system.
class AppToast {
  const AppToast._();

  /// Shows a success toast with a green checkmark capsule sliding down smoothly from the top.
  static void showSuccess(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    double topOffset = 0,
  }) {
    final fToast = FToast()..init(context);

    final toastWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: AppDecoration.toast(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: AppDecoration.circle(color: AppColors.success),
            child: const Icon(Icons.check, size: 14, color: Colors.white),
          ),
          const SizedBox(width: AppSize.s8),
          AppText(message, style: AppTextTheme.toast),
        ],
      ),
    );

    fToast.showToast(
      child: _SlideFromTopToast(child: toastWidget),
      positionedToastBuilder: (BuildContext context, Widget child, ToastGravity? gravity) {
        final safeTop = MediaQuery.paddingOf(context).top;
        return Positioned(
          top: safeTop + topOffset,
          left: 0,
          right: 0,
          child: Center(child: child),
        );
      },
      toastDuration: duration,
    );
  }
}

/// Smooth slide-and-fade animation widget from top.
class _SlideFromTopToast extends StatefulWidget {
  const _SlideFromTopToast({required this.child});

  final Widget child;

  @override
  State<_SlideFromTopToast> createState() => _SlideFromTopToastState();
}

class _SlideFromTopToastState extends State<_SlideFromTopToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
    );
  }
}
