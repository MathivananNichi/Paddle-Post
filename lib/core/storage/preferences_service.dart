import 'package:flutter_base_project/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Wrapper around [SharedPreferences] for **non-sensitive** flags and settings
/// (onboarding state, theme choice, …). For tokens and other secrets use
/// `SecureStorageService` instead.
class PreferencesService {
  PreferencesService(this._prefs);

  final SharedPreferences _prefs;

  bool get isOnboardingComplete =>
      _prefs.getBool(StorageKeys.isOnboardingComplete) ?? false;

  Future<void> setOnboardingComplete(bool value) =>
      _prefs.setBool(StorageKeys.isOnboardingComplete, value);

  String? get themeMode => _prefs.getString(StorageKeys.themeMode);

  Future<void> setThemeMode(String value) =>
      _prefs.setString(StorageKeys.themeMode, value);
}
