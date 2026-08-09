import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_bloc.dart';
import '../bloc/theme_event.dart';
import '../bloc/theme_state.dart';

/// An IconButton widget that toggles between Light and Dark mode
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDark = state.isDarkMode ||
            (state.isSystemMode &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

        return IconButton(
          tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) => RotationTransition(
              turns: anim,
              child: ScaleTransition(scale: anim, child: child),
            ),
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey<bool>(isDark),
              color: isDark ? Colors.amber : Colors.indigo,
            ),
          ),
          onPressed: () {
            context.read<ThemeBloc>().add(const ToggleThemeEvent());
          },
        );
      },
    );
  }
}

/// Segmented Button widget for selecting Light, Dark, or System theme mode
class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SegmentedButton<ThemeMode>(
          segments: const [
            ButtonSegment<ThemeMode>(
              value: ThemeMode.light,
              label: Text('Light'),
              icon: Icon(Icons.light_mode_outlined),
            ),
            ButtonSegment<ThemeMode>(
              value: ThemeMode.dark,
              label: Text('Dark'),
              icon: Icon(Icons.dark_mode_outlined),
            ),
            ButtonSegment<ThemeMode>(
              value: ThemeMode.system,
              label: Text('System'),
              icon: Icon(Icons.brightness_auto_outlined),
            ),
          ],
          selected: {state.themeMode},
          onSelectionChanged: (Set<ThemeMode> newSelection) {
            if (newSelection.isNotEmpty) {
              context
                  .read<ThemeBloc>()
                  .add(ChangeThemeEvent(newSelection.first));
            }
          },
        );
      },
    );
  }
}
