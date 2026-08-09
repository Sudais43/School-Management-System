import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeMode> getCachedThemeMode();
  Future<void> cacheThemeMode(ThemeMode mode);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final Box box;
  static const String themeKey = 'app_theme_mode';

  ThemeLocalDataSourceImpl({required this.box});

  @override
  Future<ThemeMode> getCachedThemeMode() async {
    final String? themeStr = box.get(themeKey) as String?;
    switch (themeStr) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Future<void> cacheThemeMode(ThemeMode mode) async {
    await box.put(themeKey, mode.name);
  }
}
