import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';

/// Standard game dashboard card on the home screen.
class GameDashBoard extends StatelessWidget {
  const GameDashBoard({
    this.pointsToWin = '11',
    this.winBy = '+2',
    this.returnTime = '2',
    this.player1Name,
    this.player2Name,
    this.onStartGame,
    super.key,
  });

  final String pointsToWin;
  final String winBy;
  final String returnTime;
  final String? player1Name;
  final String? player2Name;
  final VoidCallback? onStartGame;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final s = context.adaptiveScale;
        final p1 = player1Name ?? context.l10n.player1;
        final p2 = player2Name ?? context.l10n.player2;

        return HomeCardContainer(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p22 * s,
            vertical: AppPadding.p24 * s,
          ),
          child: Column(
            spacing: AppSize.s6 * s,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: AppSize.s8,
                children: [
                  AppText(
                    context.l10n.standardGame,
                    style: AppTextTheme.tag.copyWith(color: context.paddleColors.textMuted),
                  ),
                  const Spacer(),
                  AppText(
                    p1,
                    style: AppTextTheme.playerLabel.copyWith(color: AppColors.player1Dark),
                  ),
                  AppText(
                    context.l10n.vs,
                    style: AppTextTheme.playerLabel.copyWith(color: context.paddleColors.textFaint),
                  ),
                  AppText(
                    p2,
                    style: AppTextTheme.playerLabel.copyWith(color: AppColors.player2Dark),
                  ),
                ],
              ),
              Row(
                spacing: constraints.maxWidth * 0.15,
                children: [
                  _GameMetricItem(title: pointsToWin, subTitle: context.l10n.pointsToWin, scale: s),
                  _GameMetricItem(title: winBy, subTitle: context.l10n.winBy, scale: s),
                  _GameMetricItem(
                    title: returnTime,
                    suffix: 's',
                    subTitle: context.l10n.toReturn,
                    scale: s,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ShineButton(label: context.l10n.startGame, onPressed: onStartGame ?? () {}),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GameMetricItem extends StatelessWidget {
  const _GameMetricItem({
    required this.title,
    required this.subTitle,
    required this.scale,
    this.suffix,
  });

  final String title;
  final String subTitle;
  final double scale;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(title, style: AppTextTheme.metricScore(fontSize: AppFontSize.s64 * scale)),
            if (suffix != null)
              AppText(suffix!, style: AppTextTheme.metricScore(fontSize: AppFontSize.s57 * scale)),
          ],
        ),
        AppText(
          subTitle,
          style: AppTextTheme.cardSubtitle.copyWith(
            fontSize: AppFontSize.s12 * scale,
            color: context.paddleColors.textMuted,
          ),
        ),
      ],
    );
  }
}
