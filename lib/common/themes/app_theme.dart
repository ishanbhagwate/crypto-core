import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.light(
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade200,
    ),
  );

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
    // colorScheme: ColorScheme.dark(
    //   primary: Colors.grey.shade800,
    //   secondary: Colors.grey.shade700,
    // ),
  );
}
