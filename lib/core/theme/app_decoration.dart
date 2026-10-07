import 'package:flutter/material.dart';
import 'package:paddle_post/core/constants/constants.dart';
import 'package:paddle_post/core/theme/app_colors.dart';

/// Centralised [BoxDecoration], [ShapeDecoration], and shadow helpers for PaddlePost.
///
/// Provides reusable decoration presets for court elements, cards, player balls,
/// badges, and glow effects.
class AppDecoration {
  const AppDecoration._();

  // ---------------------------------------------------------------------------
  // Glowing Balls & Neon Accents
  // ---------------------------------------------------------------------------

  /// Creates a circular glowing ball decoration with an outer shadow spread.
  static BoxDecoration glowingBall({
    required Color color,
    required Color glowColor,
    double blurRadius = 18.0,
    double spreadRadius = 4.0,
    double alpha = 0.75,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: glowColor.withValues(alpha: alpha),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
      ],
    );
  }

  /// Creates a list of glow [BoxShadow]s.
  static List<BoxShadow> glowShadow({
    required Color color,
    double blurRadius = 18.0,
    double spreadRadius = 4.0,
    double alpha = 0.75,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: alpha),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ];
  }

  // ---------------------------------------------------------------------------
  // Surface & Card Presets
  // ---------------------------------------------------------------------------

  /// Default rounded surface container decoration.
  static BoxDecoration card({
    Color color = AppColors.darkSurface,
    BorderRadiusGeometry borderRadius = AppRadius.card,
    Border? border,
    List<BoxShadow>? shadows,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadows,
    );
  }

  /// Dark panel container decoration with subtle line border.
  static BoxDecoration darkPanel({
    Color color = AppColors.darkPanel,
    BorderRadiusGeometry borderRadius = AppRadius.card,
    Color borderColor = AppColors.darkLine,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: Border.all(color: borderColor),
    );
  }

  /// Light panel container decoration with subtle line border.
  static BoxDecoration lightPanel({
    Color color = AppColors.lightPanel,
    BorderRadiusGeometry borderRadius = AppRadius.card,
    Color borderColor = AppColors.lightLine,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: Border.all(color: borderColor),
    );
  }

  /// Pill badge container decoration.
  static BoxDecoration badge({
    required Color color,
    BorderRadiusGeometry borderRadius = AppRadius.badge,
    Border? border,
  }) {
    return BoxDecoration(color: color, borderRadius: borderRadius, border: border);
  }

  // ---------------------------------------------------------------------------
  // Splash Presets
  // ---------------------------------------------------------------------------

  /// Radial gradient background glow for the splash screen.
  static const BoxDecoration splashBackgroundGlow = BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(0, -0.09),
      radius: 0.65,
      colors: [AppColors.splashGlowStart, AppColors.splashGlowEnd],
    ),
  );
}
