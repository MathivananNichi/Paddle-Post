import 'package:flutter/material.dart';
import 'package:paddle_post/core/constants/app_font_size.dart';
import 'package:paddle_post/core/theme/app_colors.dart';

/// Centralised Typography and [TextTheme] definitions for PaddlePost.
///
/// Uses the primary font family [fontFamily] (`Sora`) for UI text and
/// [scoreFontFamily] (`SairaCondensed`) for scoreboard digits, counters, and
/// numerical displays. Font sizes are standardized via [AppFontSize].
class AppTextTheme {
  const AppTextTheme._();

  /// Primary UI font family.
  static const String fontFamily = 'Sora';

  /// Scoreboard / digits font family.
  static const String scoreFontFamily = 'SairaCondensed';

  /// Light theme [TextTheme] with light palette contrast.
  static TextTheme get light => _buildTextTheme(
    primaryText: AppColors.lightText,
    secondaryText: AppColors.lightTextSecondary,
    mutedText: AppColors.lightTextMuted,
  );

  /// Dark theme [TextTheme] with dark palette contrast.
  static TextTheme get dark => _buildTextTheme(
    primaryText: AppColors.darkText,
    secondaryText: AppColors.darkTextSecondary,
    mutedText: AppColors.darkTextMuted,
  );

  static TextTheme _buildTextTheme({
    required Color primaryText,
    required Color secondaryText,
    required Color mutedText,
  }) {
    return TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.displayLarge,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.25,
        color: primaryText,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.displayMedium,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: primaryText,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.displaySmall,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: primaryText,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.headlineLarge,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        color: primaryText,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.headlineMedium,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        color: primaryText,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.headlineSmall,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: primaryText,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.titleLarge,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: primaryText,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.titleMedium,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: primaryText,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.titleSmall,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: secondaryText,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.bodyLarge,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 1.5,
        color: primaryText,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.bodyMedium,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.45,
        color: secondaryText,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.bodySmall,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.4,
        color: mutedText,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.labelLarge,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        color: primaryText,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.labelMedium,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: secondaryText,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.labelSmall,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.16,
        color: mutedText,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Specialized Scoreboard Typography (Saira Condensed)
  // ---------------------------------------------------------------------------

  /// Hero score digit (full live game scoreboard screen).
  static TextStyle scoreHero({
    Color? color,
    double fontSize = AppFontSize.scoreHero,
    double height = 1.0,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontFamily: scoreFontFamily,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      height: height,
      letterSpacing: -0.01,
      color: color,
      shadows: shadows,
    );
  }

  /// Large numerical display (custom game points to win, standard game stats).
  static TextStyle scoreDisplay({
    Color? color,
    double fontSize = AppFontSize.scoreDisplay,
    double height = 0.9,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontFamily: scoreFontFamily,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      height: height,
      color: color,
      shadows: shadows,
    );
  }

  /// Compact match card score (match history list, summary cards).
  static TextStyle scoreCard({
    Color? color,
    double fontSize = AppFontSize.scoreCard,
    double height = 1.0,
  }) {
    return TextStyle(
      fontFamily: scoreFontFamily,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      height: height,
      color: color,
    );
  }

  /// Small scoreboard badge score.
  static TextStyle scoreBadge({
    Color? color,
    double fontSize = AppFontSize.scoreBadge,
    double height = 1.0,
  }) {
    return TextStyle(
      fontFamily: scoreFontFamily,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      height: height,
      color: color,
    );
  }

  /// Uppercase section header / tag label.
  static TextStyle uppercaseTag({
    Color? color,
    double fontSize = AppFontSize.tag,
    FontWeight fontWeight = FontWeight.w600,
    double letterSpacing = 0.16,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      color: color,
    );
  }
}
