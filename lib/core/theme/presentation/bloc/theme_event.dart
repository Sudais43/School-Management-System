import 'package:flutter/material.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

/// Event triggered to load initial persisted theme mode from local storage
class LoadThemeEvent extends ThemeEvent {
  const LoadThemeEvent();
}

/// Event triggered when user selects a specific ThemeMode (Light, Dark, or System)
class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode mode;

  const ChangeThemeEvent(this.mode);
}

/// Event triggered when user quickly toggles between Light and Dark mode
class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}
