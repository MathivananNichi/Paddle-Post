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

  // ---------------------------------------------------------------------------
  // Status, Chips & Badges
  // ---------------------------------------------------------------------------

  /// Status badge / card container decoration.
  static BoxDecoration statusCapsule({
    required Color color,
    Color? borderColor,
    BorderRadiusGeometry borderRadius = AppRadius.all16,
  }) {
    return BoxDecoration(
      color: color,
      border: borderColor != null ? Border.all(color: borderColor) : null,
      borderRadius: borderRadius,
    );
  }

  /// Status dot glowing indicator decoration.
  static BoxDecoration statusDot({
    required Color color,
    double blurRadius = 10.0,
    double spreadRadius = 1.0,
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      boxShadow: [BoxShadow(blurRadius: blurRadius, spreadRadius: spreadRadius, color: color)],
    );
  }

  /// Circular container decoration with optional border.
  static BoxDecoration circle({required Color color, Border? border}) {
    return BoxDecoration(shape: BoxShape.circle, color: color, border: border);
  }

  /// Device card container decoration with custom border.
  static BoxDecoration deviceCard({
    required Color color,
    Color borderColor = AppColors.deviceBorder,
    BorderRadiusGeometry borderRadius = AppRadius.all18,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor),
      borderRadius: borderRadius,
    );
  }

  /// Floating toast capsule decoration.
  static BoxDecoration toast({
    Color backgroundColor = AppColors.darkSurface,
    Color borderColor = AppColors.success,
    double borderWidth = 1.2,
    BorderRadiusGeometry borderRadius = AppRadius.pill,
    List<BoxShadow>? shadows,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: borderRadius,
      boxShadow:
          shadows ??
          [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
    );
  }

  /// Sweeping shine diagonal gradient decoration for animated shine buttons.
  static const BoxDecoration shineGradient = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0x00FFFFFF), Color(0x73FFFFFF), Color(0x00FFFFFF)]),
  );

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
