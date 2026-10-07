import 'package:flutter/material.dart';

/// Design tokens and color palette for PaddlePost derived from the prototype specification.
class AppColors {
  const AppColors._();

  // ---------------------------------------------------------------------------
  // Brand & Player Accents (From HTML Prototype)
  // ---------------------------------------------------------------------------

  /// Brand logo blue (--brandA / --a: #8fb1ff)
  static const Color paddleColor1 = Color(0xFF8FB1FF);

  /// Brand logo orange (--brandB / --b: #ffb27a)
  static const Color paddleColor2 = Color(0xFFFFB27A);

  /// Subtitle muted gray (--muted: #8e97a8)
  static const Color paddleSubTitle = Color(0xFF8E97A8);

  /// Splash screen background radial glow
  static const Color splashGlowStart = Color(0x66142FDF);
  static const Color splashGlowEnd = Color(0x000B1018);

  /// Player 1 (Blue / --pa: #2563eb, --a: #8fb1ff, --a2: #cfdcff, --paGlow: #3b7bff)
  static const Color primary = Color(0xFF2563EB);

  static const Color primaryLight = Color(0xFF1D4ED8);
  static const Color player1Dark = Color(0xFF8FB1FF);
  static const Color player1Glow = Color(0xFF3B7BFF);
  static const Color player1Tint = Color(0xFFCFDCFF);
  static const Color player1SoftDark = Color(0x382563EB); // rgba(37,99,235,0.22)
  static const Color player1SoftLight = Color(0x1F2563EB); // rgba(37,99,235,0.12)
  static const Color player1RadialDark = Color(0x292563EB); // rgba(37,99,235,0.16)
  static const Color player1LineDark = Color(0x802563EB); // rgba(37,99,235,0.5)

  /// Player 2 (Orange / --pb: #f97316, --b: #ffb27a, --b2: #ffd9bd, --pbGlow: #ff7a1f)
  static const Color secondaryOrange = Color(0xFFF97316);
  static const Color secondaryLight = Color(0xFFC2410C);
  static const Color player2Dark = Color(0xFFFFB27A);
  static const Color player2Glow = Color(0xFFFF7A1F);
  static const Color player2Tint = Color(0xFFFFD9BD);
  static const Color player2SoftDark = Color(0x38F97316); // rgba(249,115,22,0.22)
  static const Color player2SoftLight = Color(0x1FEA580C); // rgba(234,88,12,0.12)
  static const Color player2RadialDark = Color(0x29F97316); // rgba(249,115,22,0.16)
  static const Color player2LineDark = Color(0x80F97316); // rgba(249,115,22,0.5)

  /// Status & Utility Colors (From HTML Prototype)
  static const Color success = Color(0xFF22C55E); // #22c55e
  static const Color warning = Color(0xFFFBBF24); // --warn: #fbbf24
  static const Color error = Color(0xFFDC2626);
  static const Color darkError = Color(0xFFF87171); // --danger: #f87171

  // ---------------------------------------------------------------------------
  // Dark Theme Palette (Exact CSS variables from HTML Prototype)
  // ---------------------------------------------------------------------------

  static const Color darkBackground = Color(0xFF0A0D13); // --bg: #0a0d13
  static const Color darkSurface = Color(0xFF121722); // --surface: #121722
  static const Color darkSurfaceHighlight = Color(0xFF171D2B); // --surfaceH: #171d2b
  static const Color darkPanel = Color(0xFF0E121B); // --panel: #0e121b
  static const Color darkCenterCourt = Color(0xFF0C1017); // --center: #0c1017
  static const Color darkDialog = Color(0xFF141925); // --dialog: #141925

  static const Color darkLine = Color(0x12FFFFFF); // --line: rgba(255,255,255,.07)
  static const Color darkLine2 = Color(0x21FFFFFF); // --line2: rgba(255,255,255,.13)

  static const Color darkText = Color(0xFFEEF2F8); // --text: #eef2f8
  static const Color darkTextSecondary = Color(0xFFC3CAD7); // --text2: #c3cad7
  static const Color darkTextMuted = Color(0xFF8E97A8); // --muted: #8e97a8
  static const Color darkTextFaint = Color(0xFF5D6576); // --faint: #5d6576
  static const Color darkTextBody = Color(0xFFAAB2C2); // --body: #aab2c2
  static const Color darkDigit = Color(0xFFFFFFFF); // --digit: #ffffff
  static const Color darkScrim = Color(0xB805070B); // --scrim: rgba(5,7,11,.72)
  static const Color darkRing = Color(0x2E8FB1FF); // --ring: rgba(143,177,255,.18)

  // ---------------------------------------------------------------------------
  // Light Theme Palette (Clean counterpart)
  // ---------------------------------------------------------------------------

  static const Color lightBackground = Color(0xFFE8EAEE); // Matches prototype host background
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
