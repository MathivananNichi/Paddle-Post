/// Centralised letter spacing constants for PaddlePost typography.
///
/// Avoid hardcoded letter spacing numbers by referencing [AppLetterSpacing].
class AppLetterSpacing {
  const AppLetterSpacing._();

  // ---------------------------------------------------------------------------
  // Numerical Scale
  // ---------------------------------------------------------------------------

  static const double tight = -0.5;
  static const double normal = 0.0;
  static const double s0_16 = 0.16;
  static const double s0_2 = 0.2;
  static const double s0_5 = 0.5;
  static const double s0_8 = 0.8;
  static const double s1_0 = 1.0;
  static const double s1_2 = 1.2;
  static const double s1_5 = 1.5;
  static const double s1_6 = 1.6;
  static const double s2_0 = 2.0;
  static const double s2_5 = 2.5;

  // ---------------------------------------------------------------------------
  // Semantic Scale Aliases
  // ---------------------------------------------------------------------------

  /// Standard letter spacing for uppercase setup and section tags (1.6).
  static const double overline = s1_6;

  /// Standard letter spacing for badge tags (1.2).
  static const double tag = s1_2;

  /// Brand logo title letter spacing (1.5).
  static const double brand = s1_5;

  /// Subtitle uppercase tracking (2.5).
  static const double subtitle = s2_5;
}
