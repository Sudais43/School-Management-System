import 'package:flutter/material.dart';

/// Domain interface defining Theme persistence contract
abstract class ThemeRepository {
  /// Fetches the currently saved ThemeMode
  Future<ThemeMode> getThemeMode();

  /// Persists the selected ThemeMode
  Future<void> saveThemeMode(ThemeMode mode);
}
