import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// Card widget displaying discovered PaddlePost device info and connection actions.
class DeviceCard extends StatelessWidget {
  const DeviceCard({
    required this.deviceName,
    required this.step,
    this.signalText,
    this.batteryPercentage = '82%',
    this.onPair,
    this.onUnpair,
    super.key,
  });

  final String deviceName;
  final SetupStep step;
  final String? signalText;
  final String batteryPercentage;
  final VoidCallback? onPair;
  final VoidCallback? onUnpair;

  @override
  Widget build(BuildContext context) {
    final effectiveSignalText = signalText ?? context.l10n.signalStrongBattery(batteryPercentage);

    return Container(
      margin: const EdgeInsets.all(AppPadding.p12),
      padding: const EdgeInsets.all(AppPadding.p12),
      width: double.infinity,
      decoration: AppDecoration.deviceCard(color: context.colors.surface),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(deviceName, style: AppTextTheme.deviceCardTitle),
                AppText(
                  effectiveSignalText,
                  style: AppTextTheme.deviceCardSubtitle.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSize.s8),
          if (step == SetupStep.paired)
            CustomElevatedButton(
              onPressed: onUnpair,
              label: context.l10n.unpair,
              backGroundColor: AppColors.error,
            )
          else if (step == SetupStep.pairing)
            CustomElevatedButton(
              onPressed: null,
              label: context.l10n.pairing,
              backGroundColor: AppColors.primary,
            )
          else
            CustomElevatedButton(
              onPressed: onPair,
              label: context.l10n.pair,
              backGroundColor: AppColors.primary,
            ),
        ],
      ),
    );
  }
}
