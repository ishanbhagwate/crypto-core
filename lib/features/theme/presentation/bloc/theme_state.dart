part of "theme_bloc.dart";

abstract class ThemeState {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);
}

class ThemeLoaded extends ThemeState {
  const ThemeLoaded(super.themeMode);
}
