import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLoaded(ThemeMode.light)) {
    on<ToggleTheme>(_toggleTheme);
  }

  void _toggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    final newTheme =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(ThemeLoaded(newTheme));
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return ThemeLoaded(json['isDarkMode'] ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'isDarkMode': state.themeMode == ThemeMode.dark};
  }
}
