import 'package:flutter/material.dart';
import 'package:paddle_post/core/theme/paddle_post_theme_extension.dart';
import 'package:paddle_post/l10n/generated/app_localizations.dart';

/// Ergonomic shortcuts on [BuildContext] for things accessed constantly in the
/// UI layer. Keeps widget code terse and readable.
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Whether the active theme is in dark mode.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  PaddlePostColors get paddleColors =>
      theme.extension<PaddlePostColors>() ??
      (isDarkMode ? PaddlePostColors.dark : PaddlePostColors.light);

  /// Localized strings for the current locale.
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Shows a simple snackbar with [message].
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  EdgeInsets get safeArea => MediaQuery.of(this).padding;
}
