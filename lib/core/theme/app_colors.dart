import 'package:flutter/material.dart';

/// Design tokens and color palette for PaddlePost derived from the prototype specification.
class AppColors {
  const AppColors._();

  // ---------------------------------------------------------------------------
  // Brand
  // ---------------------------------------------------------------------------
  static const Color darkBrandA = Color(0xFF8FB1FF);
  static const Color darkBrandB = Color(0xFFFFB27A);

  static const Color lightBrandA = Color(0xFF1D4ED8);
  static const Color lightBrandB = Color(0xFFC2410C);

  // ---------------------------------------------------------------------------
  // Player 1 (Blue in Dark Mode, Red in Light Mode)
  // ---------------------------------------------------------------------------
  static const Color darkPlayer1 = Color(0xFF8FB1FF); // --a: #8fb1ff
  static const Color darkPlayer1Accent = Color(0xFFCFDCFF); // --a2: #cfdcff
  static const Color darkPlayer1Soft = Color(0x382563EB); // --aSoft: rgba(37,99,235,0.22)
  static const Color darkPlayer1Glow = Color(0xFF3B7BFF); // --paGlow: #3b7bff
  static const Color darkPa = Color(0xFF2563EB); // --pa: #2563eb

  static const Color lightPlayer1 = Color(0xFFBE123C); // --a: #be123c
  static const Color lightPlayer1Accent = Color(0xFFBE123C); // --a2: #be123c
  static const Color lightPlayer1Soft = Color(0x1AE11D48); // --aSoft: rgba(225,29,72,0.1)
  static const Color lightPlayer1Glow = Color(0xFFFB3A64); // --paGlow: #fb3a64
  static const Color lightPa = Color(0xFFE11D48); // --pa: #e11d48

  // ---------------------------------------------------------------------------
  // Player 2 (Orange in Dark Mode, Green in Light Mode)
  // ---------------------------------------------------------------------------
  static const Color darkPlayer2 = Color(0xFFFFB27A); // --b: #ffb27a
  static const Color darkPlayer2Accent = Color(0xFFFFD9BD); // --b2: #ffd9bd
  static const Color darkPlayer2Soft = Color(0x38F97316); // --bSoft: rgba(249,115,22,0.22)
  static const Color darkPlayer2Glow = Color(0xFFFF7A1F); // --pbGlow: #ff7a1f
  static const Color darkPb = Color(0xFFF97316); // --pb: #f97316

  static const Color lightPlayer2 = Color(0xFF15803D); // --b: #15803d
  static const Color lightPlayer2Accent = Color(0xFF15803D); // --b2: #15803d
  static const Color lightPlayer2Soft = Color(0x1A16A34A); // --bSoft: rgba(22,163,74,0.1)
  static const Color lightPlayer2Glow = Color(0xFF22C55E); // --pbGlow: #22c55e
  static const Color lightPb = Color(0xFF16A34A); // --pb: #16a34a

  // ---------------------------------------------------------------------------
  // Backgrounds & Surfaces
  // ---------------------------------------------------------------------------
  static const Color darkBackground = Color(0xFF0A0D13); // --bg: #0a0d13
  static const Color darkSurface = Color(0xFF121722); // --surface: #121722
  static const Color darkSurfaceHighlight = Color(0xFF171D2B); // --surfaceH: #171d2b
  static const Color darkPanel = Color(0xFF0E121B); // --panel: #0e121b
  static const Color darkCenterCourt = Color(0xFF0C1017); // --center: #0c1017
  static const Color darkDialog = Color(0xFF141925); // --dialog: #141925

  static const Color lightBackground = Color(0xFFF4F6FA); // --bg: #f4f6fa
  static const Color lightSurface = Color(0xFFFFFFFF); // --surface: #ffffff
  static const Color lightSurfaceHighlight = Color(0xFFF6F8FC); // --surfaceH: #f6f8fc
  static const Color lightPanel = Color(0xFFEAEEF5); // --panel: #eaeef5
  static const Color lightCenterCourt = Color(0xFFFFFFFF); // --center: #ffffff
  static const Color lightDialog = Color(0xFFFFFFFF); // --dialog: #ffffff

  // ---------------------------------------------------------------------------
  // Lines
  // ---------------------------------------------------------------------------
  static const Color darkLine = Color(0x12FFFFFF); // --line: rgba(255,255,255,.07)
  static const Color darkLine2 = Color(0x21FFFFFF); // --line2: rgba(255,255,255,.13)

  static const Color lightLine = Color(0x140F172A); // --line: rgba(15,23,42,.08)
  static const Color lightLine2 = Color(0x260F172A); // --line2: rgba(15,23,42,.15)

  // ---------------------------------------------------------------------------
  // Text
  // ---------------------------------------------------------------------------
  static const Color darkText = Color(0xFFEEF2F8); // --text: #eef2f8
  static const Color darkTextSecondary = Color(0xFFC3CAD7); // --text2: #c3cad7
  static const Color darkTextMuted = Color(0xFF8E97A8); // --muted: #8e97a8
  static const Color darkTextFaint = Color(0xFF5D6576); // --faint: #5d6576
  static const Color darkTextBody = Color(0xFFAAB2C2); // --body: #aab2c2
  static const Color darkDigit = Color(0xFFFFFFFF); // --digit: #ffffff

  static const Color lightText = Color(0xFF0F172A); // --text: #0f172a
  static const Color lightTextSecondary = Color(0xFF334155); // --text2: #334155
  static const Color lightTextMuted = Color(0xFF5B6475); // --muted: #5b6475
  static const Color lightTextFaint = Color(0xFF8A93A3); // --faint: #8a93a3
  static const Color lightTextBody = Color(0xFF475569); // --body: #475569
  static const Color lightDigit = Color(0xFF0F172A); // --digit: #0f172a

  // ---------------------------------------------------------------------------
  // Scrim & Effects
  // ---------------------------------------------------------------------------
  static const Color darkScrim = Color(0xB805070B); // --scrim: rgba(5,7,11,.72)
  static const Color lightScrim = Color(0x590F172A); // --scrim: rgba(15,23,42,.35)

  static const Color textGlow = Color.fromRGBO(160, 190, 255, .45); // Used in digit shadows
  static const Color splashGlowStart = Color(0x66142FDF);
  static const Color splashGlowEnd = Color(0x000B1018);
  static const Color waveCenter = Color(0xFF6F9BFF);
  static const Color deviceBorder = Color.fromRGBO(255, 255, 255, 0.13);

  // ---------------------------------------------------------------------------
  // Status
  // ---------------------------------------------------------------------------
  static const Color success = Color(0xFF22C55E); // #22c55e
  static const Color darkWarning = Color(0xFFFBBF24); // --warn: #fbbf24
  static const Color lightWarning = Color(0xFFB45309); // --warn: #b45309
  static const Color darkError = Color(0xFFF87171); // --danger: #f87171
  static const Color lightError = Color(0xFFDC2626); // --danger: #dc2626
}
