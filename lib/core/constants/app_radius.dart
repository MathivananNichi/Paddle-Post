import 'package:flutter/material.dart';

/// Centralised border radius constants and [BorderRadius] helpers for PaddlePost.
class AppRadius {
  const AppRadius._();

  // ---------------------------------------------------------------------------
  // Raw Radius Values
  // ---------------------------------------------------------------------------

  static const double r0 = 0.0;
  static const double r2 = 2.0;
  static const double r4 = 4.0;
  static const double r6 = 6.0;
  static const double r7 = 7.0;
  static const double r8 = 8.0;
  static const double r10 = 10.0;
  static const double r11 = 11.0;
  static const double r12 = 12.0;
  static const double r13 = 13.0;
  static const double r14 = 14.0;
  static const double r15 = 15.0;
  static const double r16 = 16.0;
  static const double r18 = 18.0;
  static const double r20 = 20.0;
  static const double r22 = 22.0;
  static const double r24 = 24.0;
  static const double r26 = 26.0;
  static const double r38 = 38.0;
  static const double r50 = 50.0;
  static const double rFull = 999.0;

  // ---------------------------------------------------------------------------
  // Radius Objects
  // ---------------------------------------------------------------------------

  static const Radius radius4 = Radius.circular(r4);
  static const Radius radius8 = Radius.circular(r8);
  static const Radius radius12 = Radius.circular(r12);
  static const Radius radius14 = Radius.circular(r14);
  static const Radius radius16 = Radius.circular(r16);
  static const Radius radius18 = Radius.circular(r18);
  static const Radius radius24 = Radius.circular(r24);
  static const Radius radius38 = Radius.circular(r38);
  static const Radius radiusFull = Radius.circular(rFull);

  // ---------------------------------------------------------------------------
  // All-Around BorderRadius Objects
  // ---------------------------------------------------------------------------

  static const BorderRadius all4 = BorderRadius.all(radius4);
  static const BorderRadius all7 = BorderRadius.all(Radius.circular(r7));
  static const BorderRadius all8 = BorderRadius.all(radius8);
  static const BorderRadius all10 = BorderRadius.all(Radius.circular(r10));
  static const BorderRadius all11 = BorderRadius.all(Radius.circular(r11));
  static const BorderRadius all12 = BorderRadius.all(radius12);
  static const BorderRadius all14 = BorderRadius.all(radius14);
  static const BorderRadius all16 = BorderRadius.all(radius16);
  static const BorderRadius all18 = BorderRadius.all(radius18);
  static const BorderRadius all20 = BorderRadius.all(Radius.circular(r20));
  static const BorderRadius all22 = BorderRadius.all(Radius.circular(r22));
  static const BorderRadius all24 = BorderRadius.all(radius24);
  static const BorderRadius all26 = BorderRadius.all(Radius.circular(r26));
  static const BorderRadius all38 = BorderRadius.all(radius38);
  static const BorderRadius all50 = BorderRadius.all(Radius.circular(r50));
  static const BorderRadius allFull = BorderRadius.all(radiusFull);

  // ---------------------------------------------------------------------------
  // Directional BorderRadius Objects
  // ---------------------------------------------------------------------------

  static const BorderRadius top16 = BorderRadius.vertical(top: radius16);
  static const BorderRadius top24 = BorderRadius.vertical(top: radius24);
  static const BorderRadius bottom16 = BorderRadius.vertical(bottom: radius16);
  static const BorderRadius bottom24 = BorderRadius.vertical(bottom: radius24);

  // ---------------------------------------------------------------------------
  // Component Presets
  // ---------------------------------------------------------------------------

  /// Rounded card border radius.
  static const BorderRadius card = all16;

  /// Large container / panel border radius.
  static const BorderRadius panel = all22;

  /// Standard button border radius.
  static const BorderRadius button = all14;

  /// Hero button border radius.
  static const BorderRadius heroButton = all18;

  /// Input field border radius.
  static const BorderRadius input = all14;

  /// Dialog modal border radius.
  static const BorderRadius dialog = all24;

  /// Small chip / badge border radius.
  static const BorderRadius badge = all12;

  /// Pill button / indicator radius.
  static const BorderRadius pill = allFull;
}
