import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_status_dot.dart';

/// Status chip displaying the connected PaddlePost device name and connection indicator.
class HomeDeviceStatusChip extends StatelessWidget {
  const HomeDeviceStatusChip({
    this.deviceName = 'PaddlePost-4F2A',
    this.isConnected = true,
    this.onTap,
    super.key,
  });

  final String deviceName;
  final bool isConnected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HomeCardContainer(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSize.s8,
        children: [
          HomeStatusDot(color: isConnected ? AppColors.success : AppColors.error),
          AppText(deviceName, style: AppTextTheme.chipLabel),
        ],
      ),
    );
  }
}
