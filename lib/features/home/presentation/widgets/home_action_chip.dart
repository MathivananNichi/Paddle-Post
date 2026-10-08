import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';

/// Interactive action chip used in the Home top bar (e.g. Sound, Settings).
class HomeActionChip extends StatelessWidget {
  const HomeActionChip({
    required this.label,
    this.icon,
    this.onTap,
    this.isActive = false,
    super.key,
  });

  final String label;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final bgColor = isActive ? AppColors.darkPa.withValues(alpha: 0.16) : context.colors.surface;
    final borderColor = isActive
        ? AppColors.waveCenter.withValues(alpha: 0.6)
        : context.paddleColors.digit.withValues(alpha: 0.07);
    final textColor = isActive
        ? context.paddleColors.player1Accent
        : context.paddleColors.textSecondary;
    final iconColor = isActive
        ? context.paddleColors.player1Accent
        : context.paddleColors.textMuted;

    return HomeCardContainer(
      color: bgColor,
      borderColor: borderColor,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSize.s6,
        children: [
          if (icon != null)
            IconTheme(
              data: IconThemeData(color: iconColor, size: AppSize.s14),
              child: icon!,
            ),
          AppText(label, style: AppTextTheme.chipLabel.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
