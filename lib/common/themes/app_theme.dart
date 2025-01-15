import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light, useMaterial3: true,
  primaryColor: const Color(0xFF00897B),
  shadowColor: Colors.black.withAlpha(100),
  iconTheme: IconThemeData(
    color: Colors.black87,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF00897B),
    secondary: Color(0xFF7C3AED),
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF64748B),
    onError: Color(0xFFFFFFFF),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.black.withAlpha(150),
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    displayLarge: GoogleFonts.montserrat(
      fontSize: 35,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.montserrat(
      color: Colors.black54,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    errorStyle: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: GoogleFonts.montserrat(
      color: Colors.black54,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.black26,
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.black26,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.red.shade600,
        width: 1,
      ),
    ),
    filled: true,
    fillColor: Color(0xFF00897B).withAlpha(15),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.black87,
        width: 0.5,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15),
    controlAffinity: ListTileControlAffinity.trailing,
    dense: false,
  ),
  switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll(Colors.black12),
      thumbColor: WidgetStatePropertyAll(Colors.white),
      trackColor: WidgetStatePropertyAll(Colors.black12),
      overlayColor: WidgetStatePropertyAll(Colors.black12)),
  cardTheme: CardTheme(
    color: Color(0xFF00897B).withAlpha(25),
    elevation: 0,
    shadowColor: Colors.black38,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  dividerTheme: DividerThemeData(
    space: 0,
    thickness: 1,
    color: Colors.black12,
  ),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(Color(0xFF00897B).withAlpha(25)),
    elevation: WidgetStatePropertyAll(0),
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    textStyle: WidgetStatePropertyAll(
      GoogleFonts.montserrat(
        fontSize: 15,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF7C3AED),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
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
    backgroundColor: Color(0xFF00897B).withAlpha(18),
    selectedItemColor: Color(0xFF00897B).withAlpha(30),
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
  useMaterial3: true,
  primaryColor: const Color(0xFF00897B),
  shadowColor: Colors.white.withAlpha(80),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF00897B),
    secondary: Color(0xFF7C3AED),
    surface: Color(0xFF374151),
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFFD1D5DB),
    onError: Color(0xFFFFFFFF),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.white,
  ),

  textTheme: TextTheme(
    bodySmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.white70,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 17,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    displayLarge: GoogleFonts.montserrat(
      fontSize: 35,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.montserrat(
      color: Colors.white38,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    errorStyle: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.white10,
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.white24,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.red.shade400,
        width: 1,
      ),
    ),
    filled: true,
    fillColor: Colors.white.withAlpha(30),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.white54,
        width: 0.5,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: GoogleFonts.montserrat(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15),
    controlAffinity: ListTileControlAffinity.trailing,
    dense: false,
  ),
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStatePropertyAll(Colors.white54),
    trackColor: WidgetStatePropertyAll(Colors.white.withAlpha(35)),
    overlayColor: WidgetStatePropertyAll(Colors.black12),
    thumbColor: WidgetStatePropertyAll(Colors.white),
  ),
  cardTheme: CardTheme(
    color: Colors.white.withAlpha(30),
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  dividerTheme: DividerThemeData(
    space: 0,
    thickness: 1,
    color: Colors.white10,
  ),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(Colors.white.withAlpha(30)),
    elevation: WidgetStatePropertyAll(0),
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    textStyle: WidgetStatePropertyAll(
      GoogleFonts.montserrat(
        fontSize: 15,
        color: Colors.white54,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
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
