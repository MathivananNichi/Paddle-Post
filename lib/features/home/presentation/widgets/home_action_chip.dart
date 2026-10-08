import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';

/// Interactive action chip used in the Home top bar (e.g. Sound, Settings).
class HomeActionChip extends StatelessWidget {
  const HomeActionChip({required this.label, this.icon, this.onTap, super.key});

  final String label;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HomeCardContainer(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSize.s6,
        children: [
          ?icon,
          AppText(label, style: AppTextTheme.chipLabel),
        ],
      ),
    );
  }
}
