import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';

/// Custom game card on the home screen.
class CustomGameCard extends StatelessWidget {
  const CustomGameCard({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final s = context.adaptiveScale;

        return HomeCardContainer(
          onTap: onTap,
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p22 * s,
            vertical: AppPadding.p16 * s,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    context.l10n.customGame,
                    style: AppTextTheme.cardTitle.copyWith(
                      fontSize: AppFontSize.s17 * s,
                      color: context.colors.onSurface,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: context.paddleColors.textMuted,
                    size: AppSize.s18 * s,
                  ),
                ],
              ),
              AppText(
                context.l10n.customGameSubtitle,
                style: AppTextTheme.cardSubtitle.copyWith(
                  fontSize: AppFontSize.s12 * s,
                  color: context.paddleColors.textMuted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
