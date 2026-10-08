import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';

/// A card row showing a numbered badge and a step description for device connection.
class ConnectStepCard extends StatelessWidget {
  const ConnectStepCard({required this.count, required this.text, super.key});

  final String count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6, vertical: AppPadding.p2),
          decoration: AppDecoration.circle(
            color: context.colors.surface,
            border: Border.all(color: context.colors.outlineVariant),
          ),
          child: AppText(
            count,
            style: AppTextTheme.stepNumber.copyWith(color: context.colors.onSurface),
          ),
        ),
        const SizedBox(width: AppSize.s8),
        Expanded(
          child: AppText(
            text,
            style: AppTextTheme.instructionStep.copyWith(color: context.paddleColors.textBody),
          ),
        ),
      ],
    );
  }
}
