import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_status_dot.dart';

/// Status chip displaying the battery percentage with a status indicator.
class HomeBatteryChip extends StatelessWidget {
  const HomeBatteryChip({this.percentage = 82, this.onTap, super.key});

  final int percentage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HomeCardContainer(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSize.s8,
        children: [
          const HomeStatusDot(),
          AppText('$percentage%', style: AppTextTheme.chipLabel),
        ],
      ),
    );
  }
}
