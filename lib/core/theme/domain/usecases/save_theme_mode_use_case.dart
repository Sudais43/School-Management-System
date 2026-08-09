import 'package:flutter/material.dart';
import '../repositories/theme_repository.dart';

/// Use case to save selected ThemeMode
class SaveThemeModeUseCase {
  final ThemeRepository repository;

  const SaveThemeModeUseCase(this.repository);

  Future<void> call(ThemeMode mode) async {
    await repository.saveThemeMode(mode);
  }
}
