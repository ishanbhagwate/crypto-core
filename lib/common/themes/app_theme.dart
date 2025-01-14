import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF1E3A8A), // Deep Blue
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1E3A8A),
    secondary: Color(0xFF7C3AED),
    surface: Color(0xFFFFFFFF), // Pure White for cards
    error: Color(0xFFEF4444), // Crimson Red
    onPrimary: Color(0xFFFFFFFF), // Text on primary color
    onSecondary: Color(0xFFFFFFFF), // Black for text
    onSurface: Color(0xFF64748B), // Slate Gray for less prominent text
    onError: Color(0xFFFFFFFF),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF0F172A)), // Main text (Black)
    bodyMedium: TextStyle(color: Color(0xFF64748B)), // Subtext (Slate Gray)
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF7C3AED), // Electric Purple
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: const Color(0xFFF9FAFB), // Soft Off-White
  canvasColor: Color(0xFFF9FAFB),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffbf8964),
    titleTextStyle: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1E3A8A).withAlpha(15),
    selectedItemColor: Color(0xFF1E3A8A).withAlpha(25),
    unselectedItemColor: Colors.black54,
    selectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black54,
    ),
    selectedLabelStyle: GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1E3A8A), // Deep Blue
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF1E3A8A),
    secondary: Color(0xFF7C3AED),
    surface: Color(0xFF374151), // Slightly lighter gray for cards
    error: Color(0xFFEF4444), // Crimson Red
    onPrimary: Color(0xFFFFFFFF), // Text on primary color
    onSecondary: Color(0xFFFFFFFF), // Text on dark background
    onSurface: Color(0xFFD1D5DB), // Text on surfaces
    onError: Color(0xFFFFFFFF),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFFFFFFF)), // Main text (White)
    bodyMedium: TextStyle(color: Color(0xFFD1D5DB)), // Subtext (Light Gray)
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF7C3AED), // Electric Purple
    textTheme: ButtonTextTheme.primary,
  ),
  canvasColor: Color(0xff121212),
  scaffoldBackgroundColor: Color(0xff121212),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffbf8964),
    titleTextStyle: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white.withAlpha(10),
    selectedItemColor: Colors.white.withAlpha(20),
    unselectedItemColor: Colors.white54,
    selectedLabelStyle: GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    selectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.white54,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
