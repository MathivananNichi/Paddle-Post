import 'package:flutter/material.dart';

/// Centralised padding constants and [EdgeInsets] presets for PaddlePost.
class AppPadding {
  const AppPadding._();

  // ---------------------------------------------------------------------------
  // Raw Values
  // ---------------------------------------------------------------------------

  static const double p0 = 0.0;
  static const double p2 = 2.0;
  static const double p3 = 3.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;
  static const double p7 = 7.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p22 = 22.0;
  static const double p24 = 24.0;
  static const double p26 = 26.0;
  static const double p32 = 32.0;
  static const double p36 = 36.0;
  static const double p40 = 40.0;
  static const double p48 = 48.0;
  static const double p60 = 60.0;

  // ---------------------------------------------------------------------------
  // All-Around EdgeInsets
  // ---------------------------------------------------------------------------

  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets all4 = EdgeInsets.all(p4);
  static const EdgeInsets all6 = EdgeInsets.all(p6);
  static const EdgeInsets all8 = EdgeInsets.all(p8);
  static const EdgeInsets all10 = EdgeInsets.all(p10);
  static const EdgeInsets all12 = EdgeInsets.all(p12);
  static const EdgeInsets all14 = EdgeInsets.all(p14);
  static const EdgeInsets all16 = EdgeInsets.all(p16);
  static const EdgeInsets all18 = EdgeInsets.all(p18);
  static const EdgeInsets all20 = EdgeInsets.all(p20);
  static const EdgeInsets all22 = EdgeInsets.all(p22);
  static const EdgeInsets all24 = EdgeInsets.all(p24);
  static const EdgeInsets all32 = EdgeInsets.all(p32);

  // ---------------------------------------------------------------------------
  // Symmetric Horizontal
  // ---------------------------------------------------------------------------

  static const EdgeInsets h4 = EdgeInsets.symmetric(horizontal: p4);
  static const EdgeInsets h8 = EdgeInsets.symmetric(horizontal: p8);
  static const EdgeInsets h10 = EdgeInsets.symmetric(horizontal: p10);
  static const EdgeInsets h12 = EdgeInsets.symmetric(horizontal: p12);
  static const EdgeInsets h14 = EdgeInsets.symmetric(horizontal: p14);
  static const EdgeInsets h16 = EdgeInsets.symmetric(horizontal: p16);
  static const EdgeInsets h20 = EdgeInsets.symmetric(horizontal: p20);
  static const EdgeInsets h22 = EdgeInsets.symmetric(horizontal: p22);
  static const EdgeInsets h24 = EdgeInsets.symmetric(horizontal: p24);
  static const EdgeInsets h32 = EdgeInsets.symmetric(horizontal: p32);
  static const EdgeInsets h40 = EdgeInsets.symmetric(horizontal: p40);
  static const EdgeInsets h60 = EdgeInsets.symmetric(horizontal: p60);

  // ---------------------------------------------------------------------------
  // Symmetric Vertical
  // ---------------------------------------------------------------------------

  static const EdgeInsets v2 = EdgeInsets.symmetric(vertical: p2);
  static const EdgeInsets v4 = EdgeInsets.symmetric(vertical: p4);
  static const EdgeInsets v6 = EdgeInsets.symmetric(vertical: p6);
  static const EdgeInsets v8 = EdgeInsets.symmetric(vertical: p8);
  static const EdgeInsets v10 = EdgeInsets.symmetric(vertical: p10);
  static const EdgeInsets v12 = EdgeInsets.symmetric(vertical: p12);
  static const EdgeInsets v14 = EdgeInsets.symmetric(vertical: p14);
  static const EdgeInsets v16 = EdgeInsets.symmetric(vertical: p16);
  static const EdgeInsets v20 = EdgeInsets.symmetric(vertical: p20);
  static const EdgeInsets v24 = EdgeInsets.symmetric(vertical: p24);

  // ---------------------------------------------------------------------------
  // Combined Asymmetric / Symmetric
  // ---------------------------------------------------------------------------

  static const EdgeInsets h10v8 = EdgeInsets.symmetric(horizontal: p10, vertical: p8);
  static const EdgeInsets h12v6 = EdgeInsets.symmetric(horizontal: p12, vertical: p6);
  static const EdgeInsets h14v8 = EdgeInsets.symmetric(horizontal: p14, vertical: p8);
  static const EdgeInsets h16v8 = EdgeInsets.symmetric(horizontal: p16, vertical: p8);
  static const EdgeInsets h16v14 = EdgeInsets.symmetric(horizontal: p16, vertical: p14);
  static const EdgeInsets h20v12 = EdgeInsets.symmetric(horizontal: p20, vertical: p12);
  static const EdgeInsets h22v20 = EdgeInsets.symmetric(horizontal: p22, vertical: p20);
  static const EdgeInsets h24v14 = EdgeInsets.symmetric(horizontal: p24, vertical: p14);
  static const EdgeInsets h24v16 = EdgeInsets.symmetric(horizontal: p24, vertical: p16);
  static const EdgeInsets h24v22 = EdgeInsets.symmetric(horizontal: p24, vertical: p22);

  // ---------------------------------------------------------------------------
  // Component Presets
  // ---------------------------------------------------------------------------

  /// Standard screen container padding.
  static const EdgeInsets screen = all24;

  /// Landscape companion app root frame padding.
  static const EdgeInsets screenLandscape = EdgeInsets.only(left: p60, right: p40, bottom: p24);

  /// Card container internal padding.
  static const EdgeInsets card = all16;

  /// Large panel internal padding.
  static const EdgeInsets panel = all20;

  /// Modal dialog padding.
  static const EdgeInsets dialog = all24;

  /// Standard button content padding.
  static const EdgeInsets button = h24v14;

  /// Hero CTA button padding.
  static const EdgeInsets buttonHero = EdgeInsets.symmetric(horizontal: p24, vertical: p18);

  /// Form input content padding.
  static const EdgeInsets input = h16v14;

  /// Small chip / badge padding.
  static const EdgeInsets badge = EdgeInsets.symmetric(horizontal: p10, vertical: p4);

  /// Scoreboard card padding.
  static const EdgeInsets scoreCard = EdgeInsets.symmetric(horizontal: p20, vertical: p14);
}
