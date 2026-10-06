import 'package:flutter/material.dart';
import 'package:paddle_post/core/theme/app_colors.dart';

/// Theme extension providing PaddlePost-specific design tokens.
///
/// Attached to [ThemeData.extensions] on both light and dark themes. Access via
/// `context.paddleColors` or `Theme.of(context).extension<PaddlePostColors>()`.
class PaddlePostColors extends ThemeExtension<PaddlePostColors> {
  const PaddlePostColors({
    required this.panelBackground,
    required this.surfaceHighlight,
    required this.centerCourt,
    required this.lineSubtle,
    required this.lineBorder,
    required this.textMuted,
    required this.textFaint,
    required this.textBody,
    required this.player1,
    required this.player1Accent,
    required this.player1Soft,
    required this.player1Glow,
    required this.player2,
    required this.player2Accent,
    required this.player2Soft,
    required this.player2Glow,
    required this.digit,
    required this.scrim,
    required this.dialog,
    required this.success,
    required this.warning,
    required this.danger,
  });

  final Color panelBackground;
  final Color surfaceHighlight;
  final Color centerCourt;
  final Color lineSubtle;
  final Color lineBorder;
  final Color textMuted;
  final Color textFaint;
  final Color textBody;
  final Color player1;
  final Color player1Accent;
  final Color player1Soft;
  final Color player1Glow;
  final Color player2;
  final Color player2Accent;
  final Color player2Soft;
  final Color player2Glow;
  final Color digit;
  final Color scrim;
  final Color dialog;
  final Color success;
  final Color warning;
  final Color danger;

  /// Dark theme token instance.
  static const dark = PaddlePostColors(
    panelBackground: AppColors.darkPanel,
    surfaceHighlight: AppColors.darkSurfaceHighlight,
    centerCourt: AppColors.darkCenterCourt,
    lineSubtle: AppColors.darkLine,
    lineBorder: AppColors.darkLine2,
    textMuted: AppColors.darkTextMuted,
    textFaint: AppColors.darkTextFaint,
    textBody: AppColors.darkTextBody,
    player1: AppColors.player1Dark,
    player1Accent: AppColors.player1Tint,
    player1Soft: AppColors.player1SoftDark,
    player1Glow: AppColors.player1Glow,
    player2: AppColors.player2Dark,
    player2Accent: AppColors.player2Tint,
    player2Soft: AppColors.player2SoftDark,
    player2Glow: AppColors.player2Glow,
    digit: AppColors.darkDigit,
    scrim: AppColors.darkScrim,
    dialog: AppColors.darkDialog,
    success: AppColors.success,
    warning: AppColors.warning,
    danger: AppColors.darkError,
  );

  /// Light theme token instance.
  static const light = PaddlePostColors(
    panelBackground: AppColors.lightPanel,
    surfaceHighlight: AppColors.lightSurfaceHighlight,
    centerCourt: AppColors.lightCenterCourt,
    lineSubtle: AppColors.lightLine,
    lineBorder: AppColors.lightLine2,
    textMuted: AppColors.lightTextMuted,
    textFaint: AppColors.lightTextFaint,
    textBody: AppColors.lightTextBody,
    player1: AppColors.primaryLight,
    player1Accent: AppColors.primary,
    player1Soft: AppColors.player1SoftLight,
    player1Glow: AppColors.player1Glow,
    player2: AppColors.secondaryLight,
    player2Accent: AppColors.secondaryOrange,
    player2Soft: AppColors.player2SoftLight,
    player2Glow: AppColors.player2Glow,
    digit: AppColors.lightDigit,
    scrim: AppColors.lightScrim,
    dialog: AppColors.lightDialog,
    success: AppColors.success,
    warning: AppColors.warning,
    danger: AppColors.error,
  );

  @override
  PaddlePostColors copyWith({
    Color? panelBackground,
    Color? surfaceHighlight,
    Color? centerCourt,
    Color? lineSubtle,
    Color? lineBorder,
    Color? textMuted,
    Color? textFaint,
    Color? textBody,
    Color? player1,
    Color? player1Accent,
    Color? player1Soft,
    Color? player1Glow,
    Color? player2,
    Color? player2Accent,
    Color? player2Soft,
    Color? player2Glow,
    Color? digit,
    Color? scrim,
    Color? dialog,
    Color? success,
    Color? warning,
    Color? danger,
  }) {
    return PaddlePostColors(
      panelBackground: panelBackground ?? this.panelBackground,
      surfaceHighlight: surfaceHighlight ?? this.surfaceHighlight,
      centerCourt: centerCourt ?? this.centerCourt,
      lineSubtle: lineSubtle ?? this.lineSubtle,
      lineBorder: lineBorder ?? this.lineBorder,
      textMuted: textMuted ?? this.textMuted,
      textFaint: textFaint ?? this.textFaint,
      textBody: textBody ?? this.textBody,
      player1: player1 ?? this.player1,
      player1Accent: player1Accent ?? this.player1Accent,
      player1Soft: player1Soft ?? this.player1Soft,
      player1Glow: player1Glow ?? this.player1Glow,
      player2: player2 ?? this.player2,
      player2Accent: player2Accent ?? this.player2Accent,
      player2Soft: player2Soft ?? this.player2Soft,
      player2Glow: player2Glow ?? this.player2Glow,
      digit: digit ?? this.digit,
      scrim: scrim ?? this.scrim,
      dialog: dialog ?? this.dialog,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
    );
  }

  @override
  PaddlePostColors lerp(ThemeExtension<PaddlePostColors>? other, double t) {
    if (other is! PaddlePostColors) return this;
    return PaddlePostColors(
      panelBackground: Color.lerp(panelBackground, other.panelBackground, t)!,
      surfaceHighlight: Color.lerp(surfaceHighlight, other.surfaceHighlight, t)!,
      centerCourt: Color.lerp(centerCourt, other.centerCourt, t)!,
      lineSubtle: Color.lerp(lineSubtle, other.lineSubtle, t)!,
      lineBorder: Color.lerp(lineBorder, other.lineBorder, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textFaint: Color.lerp(textFaint, other.textFaint, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      player1: Color.lerp(player1, other.player1, t)!,
      player1Accent: Color.lerp(player1Accent, other.player1Accent, t)!,
      player1Soft: Color.lerp(player1Soft, other.player1Soft, t)!,
      player1Glow: Color.lerp(player1Glow, other.player1Glow, t)!,
      player2: Color.lerp(player2, other.player2, t)!,
      player2Accent: Color.lerp(player2Accent, other.player2Accent, t)!,
      player2Soft: Color.lerp(player2Soft, other.player2Soft, t)!,
      player2Glow: Color.lerp(player2Glow, other.player2Glow, t)!,
      digit: Color.lerp(digit, other.digit, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      dialog: Color.lerp(dialog, other.dialog, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}
