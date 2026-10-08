import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/paddle_post/presentation/widgets/connect_step_card.dart';

/// The setup instructions panel showing dynamic steps and action buttons for PaddlePost connection.
class SetupInstructionsPanel extends StatelessWidget {
  const SetupInstructionsPanel({
    required this.step,
    this.deviceName = 'PaddlePost-4F2A',
    this.onFindPressed,
    this.onPlayPressed,
    super.key,
  });

  final SetupStep step;
  final String deviceName;
  final VoidCallback? onFindPressed;
  final VoidCallback? onPlayPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final s = context.adaptiveScale;
        final gap = AppPadding.p12 * s;

        return Padding(
          padding: EdgeInsets.only(
            left: AppPadding.p12,
            top: context.safeArea.top,
            right: AppPadding.p16,
            bottom: AppPadding.p20 * s,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                context.l10n.oneTimeSetup,
                style: AppTextTheme.tag.copyWith(color: context.paddleColors.brandA),
              ),
              SizedBox(height: gap),
              AppText(
                _title(context),
                style: AppTextTheme.heroTitle.copyWith(color: context.colors.onSurface),
              ),
              SizedBox(height: gap * 1.2),
              if (step == SetupStep.initial) ...[
                ConnectStepCard(count: '1', text: context.l10n.connectStep1),
                SizedBox(height: AppSize.s14 * s),
                ConnectStepCard(count: '2', text: context.l10n.connectStep2),
              ] else if (_subtitle(context) != null) ...[
                AppText(
                  _subtitle(context)!,
                  style: AppTextTheme.setupSubtitle.copyWith(color: context.paddleColors.textBody),
                ),
              ],
              const Spacer(),
              if (step == SetupStep.initial && onFindPressed != null)
                ShineButton(label: context.l10n.findMyPaddlePost, onPressed: onFindPressed)
              else if (step == SetupStep.paired && onPlayPressed != null)
                ShineButton(label: context.l10n.letsPlay, onPressed: onPlayPressed),
            ],
          ),
        );
      },
    );
  }

  String _title(BuildContext context) => switch (step) {
    SetupStep.initial => context.l10n.connectPaddlePostTitle,
    SetupStep.searching => context.l10n.lookingForYourModule,
    SetupStep.found => context.l10n.foundIt,
    SetupStep.pairing => context.l10n.pairing,
    SetupStep.paired => context.l10n.youreAllSet,
  };

  String? _subtitle(BuildContext context) => switch (step) {
    SetupStep.initial => null,
    SetupStep.searching => context.l10n.thisTakesAFewSeconds,
    SetupStep.found => context.l10n.tapModuleToPair,
    SetupStep.pairing => context.l10n.tapModuleToPair,
    SetupStep.paired => context.l10n.reconnectOnItsOwn(deviceName),
  };
}
