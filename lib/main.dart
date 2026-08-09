import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/data/datasources/theme_local_data_source.dart';
import 'core/theme/data/repositories/theme_repository_impl.dart';
import 'core/theme/domain/usecases/get_theme_mode_use_case.dart';
import 'core/theme/domain/usecases/save_theme_mode_use_case.dart';
import 'core/theme/presentation/bloc/theme_bloc.dart';
import 'core/theme/presentation/bloc/theme_event.dart';
import 'core/theme/presentation/bloc/theme_state.dart';
import 'feature/auth/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive storage
  await Hive.initFlutter();
  final themeBox = await Hive.openBox('settings_box');

  // Clean Architecture Dependency Injection Setup
  final localDataSource = ThemeLocalDataSourceImpl(box: themeBox);
  final themeRepository = ThemeRepositoryImpl(localDataSource: localDataSource);
  final getThemeModeUseCase = GetThemeModeUseCase(themeRepository);
  final saveThemeModeUseCase = SaveThemeModeUseCase(themeRepository);

  runApp(
    MyApp(
      getThemeModeUseCase: getThemeModeUseCase,
      saveThemeModeUseCase: saveThemeModeUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetThemeModeUseCase getThemeModeUseCase;
  final SaveThemeModeUseCase saveThemeModeUseCase;

  const MyApp({
    super.key,
    required this.getThemeModeUseCase,
    required this.saveThemeModeUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(
        getThemeModeUseCase: getThemeModeUseCase,
        saveThemeModeUseCase: saveThemeModeUseCase,
      )..add(const LoadThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'School Management System',
            theme: AppTheme.lightThemeData,
            darkTheme: AppTheme.darkThemeData,
            themeMode: state.themeMode,
            home: const SignUp(),
          );
        },
      ),
    );
  }
}