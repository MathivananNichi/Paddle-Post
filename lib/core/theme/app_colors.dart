import 'package:flutter/material.dart';

/// Raw color palette for PaddlePost.
///
/// Contains constants for both Light and Dark themes, as well as brand and
/// player-specific accents. Widgets should consume these via [ThemeData]
/// and [PaddlePostColors] extension rather than referencing [AppColors] directly.
class AppColors {
  const AppColors._();

  // ---------------------------------------------------------------------------
  // Brand & Player Accents (Shared / Cross-theme)
  // ---------------------------------------------------------------------------

  /// Player 1 / Brand Primary Blue
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF1D4ED8);
  static const Color player1Dark = Color(0xFF8FB1FF);
  static const Color player1Glow = Color(0xFF3B7BFF);
  static const Color player1Tint = Color(0xFFCFDCFF);
  static const Color player1SoftDark = Color(0x382563EB); // rgba(37,99,235,0.22)
  static const Color player1SoftLight = Color(0x1F2563EB); // rgba(37,99,235,0.12)

  /// Player 2 / Brand Secondary Orange
  static const Color secondaryOrange = Color(0xFFF97316);
  static const Color secondaryLight = Color(0xFFC2410C);
  static const Color player2Dark = Color(0xFFFFB27A);
  static const Color player2Glow = Color(0xFFFF7A1F);
  static const Color player2Tint = Color(0xFFFFD9BD);
  static const Color player2SoftDark = Color(0x38F97316); // rgba(249,115,22,0.22)
  static const Color player2SoftLight = Color(0x1FEA580C); // rgba(234,88,12,0.12)

  /// Purple / Violet Accent
  static const Color secondaryPurple = Color(0xFF7C3AED);

  /// Status colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFDC2626);
  static const Color darkError = Color(0xFFF87171);

  // ---------------------------------------------------------------------------
  // Dark Theme Palette
  // ---------------------------------------------------------------------------

  static const Color darkBackground = Color(0xFF0A0D13);
  static const Color darkSurface = Color(0xFF121722);
  static const Color darkSurfaceHighlight = Color(0xFF171D2B);
  static const Color darkPanel = Color(0xFF0E121B);
  static const Color darkCenterCourt = Color(0xFF0C1017);
  static const Color darkDialog = Color(0xFF141925);

  static const Color darkLine = Color(0x12FFFFFF); // rgba(255,255,255,0.07)
  static const Color darkLine2 = Color(0x21FFFFFF); // rgba(255,255,255,0.13)

  static const Color darkText = Color(0xFFEEF2F8);
  static const Color darkTextSecondary = Color(0xFFC3CAD7);
  static const Color darkTextMuted = Color(0xFF8E97A8);
  static const Color darkTextFaint = Color(0xFF5D6576);
  static const Color darkTextBody = Color(0xFFAAB2C2);
  static const Color darkDigit = Color(0xFFFFFFFF);
  static const Color darkScrim = Color(0xB805070B);

  // ---------------------------------------------------------------------------
  // Light Theme Palette
  // ---------------------------------------------------------------------------

  static const Color lightBackground = Color(0xFFE8EAEE);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceHighlight = Color(0xFFF8FAFC);
  static const Color lightPanel = Color(0xFFF1F5F9);
  static const Color lightCenterCourt = Color(0xFFFFFFFF);
  static const Color lightDialog = Color(0xFFFFFFFF);

  static const Color lightLine = Color(0x140F172A); // rgba(15,23,42,0.08)
  static const Color lightLine2 = Color(0x240F172A); // rgba(15,23,42,0.14)

  static const Color lightText = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF334155);
  static const Color lightTextMuted = Color(0xFF64748B);
  static const Color lightTextFaint = Color(0xFF94A3B8);
  static const Color lightTextBody = Color(0xFF475569);
  static const Color lightDigit = Color(0xFF0F172A);
  static const Color lightScrim = Color(0x660F172A);
}
