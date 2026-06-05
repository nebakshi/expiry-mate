import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// User's theme preference: system, light, or dark.
enum ThemePreference { system, light, dark }

/// Provides the current [ThemeMode] based on persisted user preference.
final themeModeProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>((ref) {
  return ThemeModeController();
});

/// Also exposes the raw preference for the settings UI toggle.
final themePreferenceProvider =
    StateNotifierProvider<ThemePreferenceController, ThemePreference>((ref) {
  return ThemePreferenceController(ref);
});

class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController() : super(ThemeMode.system) {
    _load();
  }

  static const _key = 'theme_mode';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    state = _fromString(raw);
  }

  Future<void> setMode(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }

  ThemeMode _fromString(String? value) => switch (value) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };
}

class ThemePreferenceController extends StateNotifier<ThemePreference> {
  ThemePreferenceController(this._ref) : super(ThemePreference.system) {
    _load();
  }

  final Ref _ref;
  static const _key = 'theme_mode';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    state = _fromString(raw);
  }

  Future<void> setPreference(ThemePreference pref) async {
    state = pref;
    final mode = switch (pref) {
      ThemePreference.light => ThemeMode.light,
      ThemePreference.dark => ThemeMode.dark,
      ThemePreference.system => ThemeMode.system,
    };
    await _ref.read(themeModeProvider.notifier).setMode(mode);
  }

  ThemePreference _fromString(String? value) => switch (value) {
        'light' => ThemePreference.light,
        'dark' => ThemePreference.dark,
        _ => ThemePreference.system,
      };
}
