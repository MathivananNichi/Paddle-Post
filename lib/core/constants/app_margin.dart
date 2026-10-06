import 'package:flutter/material.dart';

/// Centralised margin constants and [EdgeInsets] presets for PaddlePost.
class AppMargin {
  const AppMargin._();

  // ---------------------------------------------------------------------------
  // Raw Values
  // ---------------------------------------------------------------------------

  static const double m0 = 0.0;
  static const double m2 = 2.0;
  static const double m4 = 4.0;
  static const double m6 = 6.0;
  static const double m8 = 8.0;
  static const double m10 = 10.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m20 = 20.0;
  static const double m24 = 24.0;
  static const double m32 = 32.0;

  // ---------------------------------------------------------------------------
  // All-Around EdgeInsets
  // ---------------------------------------------------------------------------

  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets all4 = EdgeInsets.all(m4);
  static const EdgeInsets all8 = EdgeInsets.all(m8);
  static const EdgeInsets all12 = EdgeInsets.all(m12);
  static const EdgeInsets all16 = EdgeInsets.all(m16);
  static const EdgeInsets all20 = EdgeInsets.all(m20);
  static const EdgeInsets all24 = EdgeInsets.all(m24);

  // ---------------------------------------------------------------------------
  // Symmetric Horizontal & Vertical
  // ---------------------------------------------------------------------------

  static const EdgeInsets h4 = EdgeInsets.symmetric(horizontal: m4);
  static const EdgeInsets h8 = EdgeInsets.symmetric(horizontal: m8);
  static const EdgeInsets h12 = EdgeInsets.symmetric(horizontal: m12);
  static const EdgeInsets h16 = EdgeInsets.symmetric(horizontal: m16);
  static const EdgeInsets h20 = EdgeInsets.symmetric(horizontal: m20);
  static const EdgeInsets h24 = EdgeInsets.symmetric(horizontal: m24);

  static const EdgeInsets v2 = EdgeInsets.symmetric(vertical: m2);
  static const EdgeInsets v4 = EdgeInsets.symmetric(vertical: m4);
  static const EdgeInsets v6 = EdgeInsets.symmetric(vertical: m6);
  static const EdgeInsets v8 = EdgeInsets.symmetric(vertical: m8);
  static const EdgeInsets v12 = EdgeInsets.symmetric(vertical: m12);
  static const EdgeInsets v16 = EdgeInsets.symmetric(vertical: m16);
  static const EdgeInsets v20 = EdgeInsets.symmetric(vertical: m20);
  static const EdgeInsets v24 = EdgeInsets.symmetric(vertical: m24);

  // ---------------------------------------------------------------------------
  // Directional Single-Side Margins
  // ---------------------------------------------------------------------------

  static const EdgeInsets top4 = EdgeInsets.only(top: m4);
  static const EdgeInsets top8 = EdgeInsets.only(top: m8);
  static const EdgeInsets top12 = EdgeInsets.only(top: m12);
  static const EdgeInsets top16 = EdgeInsets.only(top: m16);

  static const EdgeInsets bottom4 = EdgeInsets.only(bottom: m4);
  static const EdgeInsets bottom8 = EdgeInsets.only(bottom: m8);
  static const EdgeInsets bottom12 = EdgeInsets.only(bottom: m12);
  static const EdgeInsets bottom16 = EdgeInsets.only(bottom: m16);
  static const EdgeInsets bottom24 = EdgeInsets.only(bottom: m24);

  // ---------------------------------------------------------------------------
  // Component Presets
  // ---------------------------------------------------------------------------

  /// List item separation margin.
  static const EdgeInsets listItem = EdgeInsets.symmetric(horizontal: m16, vertical: m4);

  /// Section vertical margin.
  static const EdgeInsets section = EdgeInsets.only(bottom: m16);

  /// Card outer spacing.
  static const EdgeInsets card = EdgeInsets.symmetric(horizontal: m16, vertical: m8);
}
