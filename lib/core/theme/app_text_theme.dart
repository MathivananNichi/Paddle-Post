import 'package:flutter/material.dart';
import 'package:paddle_post/core/constants/app_font_size.dart';
import 'package:paddle_post/core/constants/app_letter_spacing.dart';
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

  // ---------------------------------------------------------------------------
  // Component & Common Typography Presets
  // ---------------------------------------------------------------------------

  /// Overline uppercase setup tag style (e.g. 'ONE-TIME SETUP').
  static const TextStyle tag = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s11,
    letterSpacing: AppLetterSpacing.s1_6,
    fontWeight: FontWeight.w600,
    // Note: color should be set dynamically via Theme in the widget.
  );

  /// Screen headline title (e.g. "Let's connect your PaddlePost.").
  static const TextStyle heroTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s34,
    letterSpacing: AppLetterSpacing.s0_2,
    fontWeight: FontWeight.w700,
  );

  /// Status badge & chip label style (e.g. 'PaddlePost-4F2A', '82%', 'Sound on', 'Settings').
  static const TextStyle chipLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s12,
    fontWeight: FontWeight.w500,
    // Note: color should be set dynamically via Theme in the widget.
  );

  /// Step count circle number text style.
  static const TextStyle stepNumber = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s11,
    fontWeight: FontWeight.w700,
  );

  /// Instruction step and body text style.
  static const TextStyle instructionStep = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s14,
    fontWeight: FontWeight.w400,
    height: 1.15,
  );

  /// Setup screen description/subtitle text style.
  static const TextStyle setupSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  /// Device card title text style (e.g. 'PaddlePost-4F2A').
  static const TextStyle deviceCardTitle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSize.s16,
  );

  /// Device card subtitle / signal text style (e.g. 'Signal strong · Battery 82%').
  static const TextStyle deviceCardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSize.s12,
  );

  /// Toast message text style.
  static const TextStyle toast = TextStyle(
    fontFamily: fontFamily,
    color: Colors.white,
    fontSize: AppFontSize.s14,
    fontWeight: FontWeight.w600,
  );

  /// Primary button label text style in ShineButton.
  static const TextStyle shineButton = TextStyle(
    fontFamily: fontFamily,
    color: Colors.white,
    fontSize: AppFontSize.s19,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
  );

  /// Splash screen subtitle / tagline style (e.g. 'Scoring Companion').
  static const TextStyle splashSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s12,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.5,
    // Note: color should be set dynamically via Theme in the widget.
  );

  /// Splash startup progress indicator label style (e.g. 'Starting Up').
  static const TextStyle progressLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    // Note: color should be set dynamically via Theme in the widget.
  );

  /// Player tag / label style in match header and cards.
  static const TextStyle playerLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s12,
    fontWeight: FontWeight.w600,
  );

  /// Player name subtext in last match card.
  static const TextStyle playerSubLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s12,
    fontWeight: FontWeight.w500,
  );

  /// Compact scoreboard score display style.
  static const TextStyle playerScore = TextStyle(
    fontFamily: scoreFontFamily,
    fontSize: AppFontSize.s34,
    height: 1.05,
    fontWeight: FontWeight.w700,
  );

  /// Card primary title (e.g. 'Custom game').
  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s17,
    fontWeight: FontWeight.w700,
  );

  /// Card secondary body description (e.g. 'Shorter game or your own names', 'points to win').
  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s12,
    fontWeight: FontWeight.w400,
  );

  /// Action link label style (e.g. 'All matches').
  static const TextStyle actionLink = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.s12,
    fontWeight: FontWeight.w600,
  );

  /// Large dashboard metric score display (e.g. '11', '+2', '2s').
  static TextStyle metricScore({
    double fontSize = AppFontSize.s64,
    List<Shadow> shadows = const [Shadow(color: AppColors.textGlow, blurRadius: 22)],
  }) {
    return TextStyle(
      fontFamily: scoreFontFamily,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      height: 1.0,
      shadows: shadows,
    );
  }

  /// Logo brand text style.
  static TextStyle logo({
    Color? color,
    double fontSize = AppFontSize.s36,
    double letterSpacing = 1.5,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}
