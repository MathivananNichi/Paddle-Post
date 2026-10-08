import 'package:flutter/material.dart';
import 'package:paddle_post/core/constants/app_padding.dart';
import 'package:paddle_post/core/constants/app_radius.dart';
import 'package:paddle_post/core/theme/app_colors.dart';
import 'package:paddle_post/core/theme/app_text_theme.dart';
import 'package:paddle_post/core/theme/paddle_post_theme_extension.dart';

/// Centralised Material 3 theme definitions for PaddlePost.
///
/// Build [ThemeData] here once and reference it from `MaterialApp` (see
/// `app.dart`). Widgets should pull values from the active `Theme`/`ColorScheme`
/// and `context.paddleColors` rather than hard-coding colors or text styles.
class AppTheme {
  const AppTheme._();

  /// Primary UI font family (Sora).
  static const String fontFamily = 'Sora';

  /// Scoreboard and numerical display font family (Saira Condensed).
  static const String scoreFontFamily = 'SairaCondensed';

  /// Light theme definition.
  static ThemeData get light => _buildTheme(Brightness.light);

  /// Dark theme definition.
  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    final colorScheme = isLight
        ? const ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.darkPa,
            // App main brand/action color is always blue
            onPrimary: Colors.white,
            primaryContainer: AppColors.lightPlayer1Accent,
            onPrimaryContainer: AppColors.lightPlayer1,
            secondary: AppColors.lightPb,
            onSecondary: Colors.white,
            secondaryContainer: AppColors.lightPlayer2Accent,
            onSecondaryContainer: AppColors.lightPlayer2,
            tertiary: AppColors.lightBrandA,
            onTertiary: Colors.white,
            error: AppColors.lightError,
            onError: Colors.white,
            surface: AppColors.lightSurface,
            onSurface: AppColors.lightText,
            onSurfaceVariant: AppColors.lightTextMuted,
            outline: AppColors.lightLine2,
            outlineVariant: AppColors.lightLine,
            shadow: Color(0x1A0F172A),
            scrim: AppColors.lightScrim,
            surfaceContainerLowest: AppColors.lightSurface,
            surfaceContainerLow: AppColors.lightSurfaceHighlight,
            surfaceContainer: AppColors.lightPanel,
            surfaceContainerHigh: AppColors.lightBackground,
            surfaceContainerHighest: Color(0xFFE2E8F0),
          )
        : const ColorScheme(
            brightness: Brightness.dark,
            primary: AppColors.darkPa,
            onPrimary: Color(0xFF002B75),
            primaryContainer: AppColors.darkPa,
            onPrimaryContainer: AppColors.darkPlayer1Accent,
            secondary: AppColors.darkPlayer2,
            onSecondary: Color(0xFF4E2600),
            secondaryContainer: AppColors.darkPb,
            onSecondaryContainer: AppColors.darkPlayer2Accent,
            tertiary: AppColors.darkPlayer1Glow,
            onTertiary: Colors.white,
            error: AppColors.darkError,
            onError: Color(0xFF450A0A),
            surface: AppColors.darkSurface,
            onSurface: AppColors.darkText,
            onSurfaceVariant: AppColors.darkTextMuted,
            outline: AppColors.darkLine2,
            outlineVariant: AppColors.darkLine,
            shadow: Colors.black,
            scrim: AppColors.darkScrim,
            surfaceContainerLowest: AppColors.darkBackground,
            surfaceContainerLow: AppColors.darkPanel,
            surfaceContainer: AppColors.darkSurface,
            surfaceContainerHigh: AppColors.darkSurfaceHighlight,
            surfaceContainerHighest: Color(0xFF222938),
          );

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isLight ? AppColors.lightBackground : AppColors.darkBackground,
      canvasColor: isLight ? AppColors.lightBackground : AppColors.darkBackground,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: isLight ? AppColors.lightBackground : AppColors.darkBackground,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 20),
      ),
      cardTheme: CardThemeData(
        color: isLight ? AppColors.lightSurface : AppColors.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: isLight ? AppColors.lightLine : AppColors.darkLine),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: isLight ? AppColors.lightDialog : AppColors.darkDialog,
        elevation: 12,
        shadowColor: isLight ? const Color(0x33000000) : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: isLight ? AppColors.lightLine2 : AppColors.darkLine2),
        ),
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        contentTextStyle: TextStyle(
          color: isLight ? AppColors.lightTextBody : AppColors.darkTextBody,
          fontSize: 13,
          height: 1.45,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: isLight ? AppColors.lightSurface : AppColors.darkSurface,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      dividerTheme: DividerThemeData(
        color: isLight ? AppColors.lightLine : AppColors.darkLine,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isLight ? AppColors.lightSurface : AppColors.darkSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: TextStyle(
          color: isLight ? AppColors.lightTextMuted : AppColors.darkTextMuted,
          fontSize: 14,
        ),
        labelStyle: TextStyle(
          color: isLight ? AppColors.lightTextSecondary : AppColors.darkTextSecondary,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: isLight ? AppColors.lightLine2 : AppColors.darkLine2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: isLight ? AppColors.lightLine2 : AppColors.darkLine2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: isLight ? AppColors.lightBrandA : AppColors.darkBrandA,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: isLight ? AppColors.lightError : AppColors.darkError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: isLight ? AppColors.lightError : AppColors.darkError,
            width: 1.5,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          backgroundColor: AppColors.darkPa,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,

          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p12),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.r12)),
          backgroundColor: isLight ? AppColors.lightSurface : AppColors.darkSurfaceHighlight,
          foregroundColor: Colors.white,

          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: AppTextTheme.fontFamily,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: isLight ? AppColors.lightLine2 : AppColors.darkLine2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: isLight ? AppColors.lightBrandA : AppColors.darkBrandA,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: colorScheme.onSurface),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return isLight ? AppColors.lightTextMuted : AppColors.darkTextMuted;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return isLight ? AppColors.lightBrandA : AppColors.darkBrandA;
          }
          return isLight ? const Color(0xFFCBD5E1) : const Color(0xFF2A3142);
        }),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isLight ? AppColors.lightText : AppColors.darkSurfaceHighlight,
        contentTextStyle: TextStyle(
          color: isLight ? Colors.white : AppColors.darkText,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: isLight ? AppTextTheme.light : AppTextTheme.dark,
      extensions: isLight ? const [PaddlePostColors.light] : const [PaddlePostColors.dark],
    );
  }
}
