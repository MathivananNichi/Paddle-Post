import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paddle_post/core/providers/core_providers.dart';
import 'package:paddle_post/core/storage/preferences_service.dart';
import 'package:paddle_post/core/theme/app_colors.dart';
import 'package:paddle_post/core/theme/app_theme.dart';
import 'package:paddle_post/core/theme/paddle_post_theme_extension.dart';
import 'package:paddle_post/core/theme/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('AppTheme', () {
    test('light theme has correct brightness and surface colors', () {
      final theme = AppTheme.light;

      expect(theme.brightness, Brightness.light);
      expect(theme.colorScheme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, AppColors.primary);
      expect(theme.scaffoldBackgroundColor, AppColors.lightBackground);
      expect(theme.colorScheme.surface, AppColors.lightSurface);
      expect(theme.colorScheme.onSurface, AppColors.lightText);
    });

    test('dark theme has correct brightness and surface colors', () {
      final theme = AppTheme.dark;

      expect(theme.brightness, Brightness.dark);
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, AppColors.player1Dark);
      expect(theme.scaffoldBackgroundColor, AppColors.darkBackground);
      expect(theme.colorScheme.surface, AppColors.darkSurface);
      expect(theme.colorScheme.onSurface, AppColors.darkText);
    });

    test('both themes register PaddlePostColors extension', () {
      final lightExt = AppTheme.light.extension<PaddlePostColors>();
      final darkExt = AppTheme.dark.extension<PaddlePostColors>();

      expect(lightExt, isNotNull);
      expect(darkExt, isNotNull);

      expect(lightExt!.player1, AppColors.primaryLight);
      expect(darkExt!.player1, AppColors.player1Dark);
      expect(lightExt.player2, AppColors.secondaryLight);
      expect(darkExt.player2, AppColors.player2Dark);
    });

    test('PaddlePostColors lerp interpolates correctly', () {
      final lerped = PaddlePostColors.light.lerp(PaddlePostColors.dark, 0.5);

      expect(lerped, isNotNull);
      expect(lerped.panelBackground, isNotNull);
      expect(lerped.player1, isNotNull);
      expect(lerped.player2, isNotNull);
    });

    test('PaddlePostColors copyWith updates values correctly', () {
      final custom = PaddlePostColors.dark.copyWith(player1: Colors.cyan);

      expect(custom.player1, Colors.cyan);
      expect(custom.player2, PaddlePostColors.dark.player2);
    });
  });

  group('ThemeController', () {
    late SharedPreferences prefs;
    late PreferencesService prefsService;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      prefsService = PreferencesService(prefs);
    });

    test('defaults to ThemeMode.system when no preference is saved', () {
      final container = ProviderContainer(
        overrides: [preferencesServiceProvider.overrideWithValue(prefsService)],
      );
      addTearDown(container.dispose);

      final mode = container.read(themeControllerProvider);
      expect(mode, ThemeMode.system);
    });

    test('loads stored theme preference on startup', () async {
      await prefs.setString('theme_mode', 'dark');

      final container = ProviderContainer(
        overrides: [preferencesServiceProvider.overrideWithValue(prefsService)],
      );
      addTearDown(container.dispose);

      final mode = container.read(themeControllerProvider);
      expect(mode, ThemeMode.dark);
    });

    test('setThemeMode updates state and persists choice', () async {
      final container = ProviderContainer(
        overrides: [preferencesServiceProvider.overrideWithValue(prefsService)],
      );
      addTearDown(container.dispose);

      await container.read(themeControllerProvider.notifier).setThemeMode(ThemeMode.light);

      expect(container.read(themeControllerProvider), ThemeMode.light);
      expect(prefs.getString('theme_mode'), 'light');
    });

    test('cycle traverses system -> light -> dark -> system', () async {
      final container = ProviderContainer(
        overrides: [preferencesServiceProvider.overrideWithValue(prefsService)],
      );
      addTearDown(container.dispose);

      expect(container.read(themeControllerProvider), ThemeMode.system);

      await container.read(themeControllerProvider.notifier).cycle();
      expect(container.read(themeControllerProvider), ThemeMode.light);

      await container.read(themeControllerProvider.notifier).cycle();
      expect(container.read(themeControllerProvider), ThemeMode.dark);

      await container.read(themeControllerProvider.notifier).cycle();
      expect(container.read(themeControllerProvider), ThemeMode.system);
    });
  });
}
