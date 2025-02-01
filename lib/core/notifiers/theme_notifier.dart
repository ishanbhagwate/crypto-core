// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeNotifier extends ChangeNotifier {
//   ThemeMode _themeMode = ThemeMode.system;

//   ThemeMode get themeMode => _themeMode;

//   ThemeNotifier() {
//     _loadThemeFromPrefs();
//   }

//   void setTheme(ThemeMode mode) async {
//     _themeMode = mode;
//     notifyListeners();
//     await _saveThemeToPrefs(mode);
//   }

//   Future<void> _loadThemeFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     final themeString = prefs.getString('themeMode') ?? 'system';
//     _themeMode = ThemeMode.values.firstWhere(
//       (e) => e.toString() == 'ThemeMode.$themeString',
//     );
//     notifyListeners();
//   }

//   Future<void> _saveThemeToPrefs(ThemeMode mode) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('themeMode', mode.toString().split('.').last);
//   }
// }
