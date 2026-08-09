import 'package:flutter/material.dart';
import '../repositories/theme_repository.dart';

/// Use case to fetch the current ThemeMode
class GetThemeModeUseCase {
  final ThemeRepository repository;

  const GetThemeModeUseCase(this.repository);

  Future<ThemeMode> call() async {
    return await repository.getThemeMode();
  }
}
