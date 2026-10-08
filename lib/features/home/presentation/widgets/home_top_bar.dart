import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_action_chip.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_battery_chip.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_device_status_chip.dart';
import 'package:paddle_post/features/splash/presentation/widgets/widgets.dart';

/// Top bar for the Home screen containing the logo and status/action chips.
class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    this.deviceName = 'PaddlePost-4F2A',
    this.isConnected = true,
    this.batteryPercentage = 82,
    this.isSoundOn = true,
    this.onDeviceTap,
    this.onBatteryTap,
    this.onSoundToggle,
    this.onSettingsTap,
    super.key,
  });

  final String deviceName;
  final bool isConnected;
  final int batteryPercentage;
  final bool isSoundOn;
  final VoidCallback? onDeviceTap;
  final VoidCallback? onBatteryTap;
  final VoidCallback? onSoundToggle;
  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.s8,
      children: [
        const PaddlePostLogo(fontSize: AppFontSize.s18),
        const Spacer(),
        HomeDeviceStatusChip(deviceName: deviceName, isConnected: isConnected, onTap: onDeviceTap),
        HomeBatteryChip(percentage: batteryPercentage, onTap: onBatteryTap),
        HomeActionChip(
          label: isSoundOn ? context.l10n.soundOn : context.l10n.soundOff,
          onTap: onSoundToggle,
        ),
        HomeActionChip(label: context.l10n.settings, onTap: onSettingsTap),
      ],
    );
  }
}
