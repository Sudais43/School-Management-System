import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/core/theme/domain/repositories/theme_repository.dart';
import 'package:school_management_system/core/theme/domain/usecases/get_theme_mode_use_case.dart';
import 'package:school_management_system/core/theme/domain/usecases/save_theme_mode_use_case.dart';
import 'package:school_management_system/main.dart';

class FakeThemeRepository implements ThemeRepository {
  ThemeMode _mode = ThemeMode.system;

  @override
  Future<ThemeMode> getThemeMode() async => _mode;

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    _mode = mode;
  }
}

void main() {
  testWidgets('App renders Sign Up screen cleanly', (WidgetTester tester) async {
    final fakeRepository = FakeThemeRepository();
    final getThemeModeUseCase = GetThemeModeUseCase(fakeRepository);
    final saveThemeModeUseCase = SaveThemeModeUseCase(fakeRepository);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MyApp(
        getThemeModeUseCase: getThemeModeUseCase,
        saveThemeModeUseCase: saveThemeModeUseCase,
      ),
    );

    // Verify that Sign Up text is present.
    expect(find.text('Sign Up'), findsWidgets);
  });
}
