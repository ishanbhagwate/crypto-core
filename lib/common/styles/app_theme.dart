import 'package:crypto_core/common/styles/app_colors.dart';
import 'package:crypto_core/common/styles/app_text_style.dart';
import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light, useMaterial3: true,
  primaryColor: AppColors.primary,
  shadowColor: AppColors.blackAlpha100,
  iconTheme: IconThemeData(
    color: AppColors.black87,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surfaceLight,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onSurfaceLight,
    onError: AppColors.onError,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.white,
  ),
  textTheme: TextTheme(
    bodySmall: AppTextStyle.smallBlack,
    bodyMedium: AppTextStyle.mediumBlack,
    bodyLarge: AppTextStyle.largeBlack,
    titleSmall: AppTextStyle.smallBlackBold,
    titleMedium: AppTextStyle.mediumBlackBold,
    titleLarge: AppTextStyle.largeBlackBold,
    labelSmall: AppTextStyle.smallBlack,
    labelMedium: AppTextStyle.mediumBlack,
    labelLarge: AppTextStyle.largeBlack,
    headlineLarge: AppTextStyle.xLargeBlackBold,
    displayMedium: AppTextStyle.xxLargeBlackBold,
    displayLarge: AppTextStyle.xxxLargeBlackBold,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: AppTextStyle.smallBlack,
    errorStyle: AppTextStyle.smallBlack,
    floatingLabelStyle: AppTextStyle.smallBlack,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.black12,
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.black26,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.red600,
        width: 1,
      ),
    ),
    filled: true,
    fillColor: AppColors.onPrimary,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.black87,
        width: 0.5,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: AppTextStyle.mediumBlackBold,
    contentPadding: EdgeInsets.symmetric(horizontal: 15),
    controlAffinity: ListTileControlAffinity.trailing,
    dense: false,
  ),
  switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll(AppColors.black12),
      thumbColor: WidgetStatePropertyAll(AppColors.white),
      trackColor: WidgetStatePropertyAll(AppColors.black12),
      overlayColor: WidgetStatePropertyAll(AppColors.black12)),
  cardTheme: CardTheme(
    color: AppColors.primaryAlpha25,
    elevation: 0,
    shadowColor: AppColors.black26,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  dividerTheme: DividerThemeData(
    space: 0,
    thickness: 1,
    color: AppColors.black12,
  ),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(AppColors.primaryAlpha25),
    elevation: WidgetStatePropertyAll(0),
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    textStyle: WidgetStatePropertyAll(
      AppTextStyle.smallWhite,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.white),
      backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
      splashFactory: InkSplash.splashFactory,
      overlayColor: WidgetStatePropertyAll(AppColors.white10),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      textStyle: WidgetStatePropertyAll(AppTextStyle.mediumWhiteBold),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.button,
    textTheme: ButtonTextTheme.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight, 
  canvasColor: AppColors.scaffoldBackgroundLight,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.appBarBackground,
    titleTextStyle: AppTextStyle.largeWhiteBold,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.primaryAlpha18,
    selectedItemColor: AppColors.primaryAlpha30,
    unselectedItemColor: AppColors.black54,
    selectedIconTheme: IconThemeData(
      color: AppColors.black,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.black54,
    ),
    selectedLabelStyle: AppTextStyle.smallBlack,
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
  primaryColor: AppColors.primary,
  shadowColor: AppColors.white.withAlpha(80),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surfaceLight,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onSurfaceLight,
    onError: AppColors.onError,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.white,
  ),
  textTheme: TextTheme(
    bodySmall: AppTextStyle.smallWhite,
    bodyMedium: AppTextStyle.mediumWhite,
    bodyLarge: AppTextStyle.largeWhite,
    titleSmall: AppTextStyle.smallWhiteBold,
    titleMedium: AppTextStyle.mediumWhiteBold,
    titleLarge: AppTextStyle.largeWhiteBold,
    labelSmall: AppTextStyle.smallWhite,
    labelMedium: AppTextStyle.mediumWhite,
    labelLarge: AppTextStyle.largeWhite,
    headlineLarge: AppTextStyle.xLargeWhiteBold,
    displayMedium: AppTextStyle.xxLargeWhiteBold,
    displayLarge: AppTextStyle.xxxLargeWhiteBold,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: AppTextStyle.smallWhite,
    errorStyle: AppTextStyle.smallWhite,
    floatingLabelStyle: AppTextStyle.smallWhite,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.white10,
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.white24,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.red400,
        width: 1,
      ),
    ),
    filled: true,
    fillColor: AppColors.white.withAlpha(30),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: AppColors.white54,
        width: 0.5,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: AppTextStyle.mediumWhiteBold,
    contentPadding: EdgeInsets.symmetric(horizontal: 15),
    controlAffinity: ListTileControlAffinity.trailing,
    dense: false,
  ),
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStatePropertyAll(AppColors.white54),
    trackColor: WidgetStatePropertyAll(AppColors.white.withAlpha(35)),
    overlayColor: WidgetStatePropertyAll(AppColors.black12),
    thumbColor: WidgetStatePropertyAll(AppColors.white),
  ),
  cardTheme: CardTheme(
    color: AppColors.white.withAlpha(30),
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  dividerTheme: DividerThemeData(
    space: 0,
    thickness: 1,
    color: AppColors.white10,
  ),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(AppColors.white.withAlpha(30)),
    elevation: WidgetStatePropertyAll(0),
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    textStyle: WidgetStatePropertyAll(
      AppTextStyle.largeWhite,
    ),
  ),
   elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.white),
      backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
      splashFactory: InkSplash.splashFactory,
      overlayColor: WidgetStatePropertyAll(AppColors.white10),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      textStyle: WidgetStatePropertyAll(AppTextStyle.mediumWhiteBold),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  canvasColor: AppColors.canvasColorDark,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.appBarBackground,
    titleTextStyle: AppTextStyle.largeWhiteBold,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white.withAlpha(10),
    selectedItemColor: AppColors.white.withAlpha(20),
    unselectedItemColor: AppColors.white54,
    selectedLabelStyle: AppTextStyle.mediumWhite,
    selectedIconTheme: IconThemeData(
      color: AppColors.white,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.white54,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
