import 'package:flutter/material.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_data_source.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<ThemeMode> getThemeMode() async {
    return await localDataSource.getCachedThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    await localDataSource.cacheThemeMode(mode);
  }
}
