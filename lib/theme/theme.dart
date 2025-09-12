import 'package:conversor_moedas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme lightTextTheme = GoogleFonts.interTextTheme(
  const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
      color: primaryDark,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: primaryDark,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: primaryDark,
    )
  ),
);

final TextTheme darkTextTheme = GoogleFonts.interTextTheme(
  const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 48.0,
      color: primaryDark,
      fontWeight: FontWeight.w700
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: primaryDark,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: primaryDark,
    )
  ),
);

final lightThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryDark,
    brightness: Brightness.light,
  ),
  textTheme: lightTextTheme,
  appBarTheme: AppBarThemeData(
    backgroundColor: primaryDark
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: primaryDark
  )
);

final darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryLight,
    brightness: Brightness.dark,
  ),
  textTheme: darkTextTheme,
  appBarTheme: AppBarThemeData(
    backgroundColor: primaryLight,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: primaryLight,
  )
);