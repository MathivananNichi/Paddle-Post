import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/home_card_container.dart';

/// Last match summary card on the home screen.
class LastMatchCard extends StatelessWidget {
  const LastMatchCard({
    this.timeText = 'Today, 15:45',
    this.player1Score = '8',
    this.player2Score = '11',
    this.player1Name,
    this.player2Name,
    this.onAllMatchesTap,
    super.key,
  });

  final String timeText;
  final String player1Score;
  final String player2Score;
  final String? player1Name;
  final String? player2Name;
  final VoidCallback? onAllMatchesTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        final s = context.adaptiveScale;
        final p1 = player1Name ?? context.l10n.player1;
        final p2 = player2Name ?? context.l10n.player2;

        return HomeCardContainer(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p22 * s,
            vertical: AppPadding.p16 * s,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppText(
                    context.l10n.lastMatchTime(timeText),
                    style: AppTextTheme.tag.copyWith(color: context.paddleColors.textMuted),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _PlayerScoreItem(
                    title: p1,
                    playerScore: player1Score,
                    color: context.paddleColors.player1,
                  ),
                  _PlayerScoreItem(
                    title: p2,
                    playerScore: player2Score,
                    color: context.paddleColors.player2,
                  ),
                ],
              ),
              Divider(
                height: AppSize.s1,
                color: context.colors.outlineVariant.withValues(alpha: 0.15),
              ),
              InkWell(
                onTap: onAllMatchesTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      context.l10n.allMatches,
                      style: AppTextTheme.actionLink.copyWith(color: context.paddleColors.player1),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: context.paddleColors.player1,
                      size: AppSize.s18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PlayerScoreItem extends StatelessWidget {
  const _PlayerScoreItem({required this.title, required this.playerScore, required this.color});

  final String title;
  final String playerScore;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(title, style: AppTextTheme.playerSubLabel.copyWith(color: color)),
        AppText(
          playerScore,
          style: AppTextTheme.playerScore.copyWith(color: color.withValues(alpha: 0.8)),
        ),
      ],
    );
  }
}
