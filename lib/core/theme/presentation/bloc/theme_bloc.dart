import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_theme_mode_use_case.dart';
import '../../domain/usecases/save_theme_mode_use_case.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeModeUseCase getThemeModeUseCase;
  final SaveThemeModeUseCase saveThemeModeUseCase;

  ThemeBloc({
    required this.getThemeModeUseCase,
    required this.saveThemeModeUseCase,
  }) : super(const ThemeState()) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final mode = await getThemeModeUseCase();
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    await saveThemeModeUseCase(event.mode);
    emit(state.copyWith(themeMode: event.mode));
  }

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final newMode = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await saveThemeModeUseCase(newMode);
    emit(state.copyWith(themeMode: newMode));
  }
}
