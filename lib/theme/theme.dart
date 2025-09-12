import 'package:conversor_moedas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme lightTextTheme = GoogleFonts.interTextTheme(
  const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 48.0,
      color: primaryLight,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(fontSize: 16.0, color: primaryLight),
    bodySmall: TextStyle(fontSize: 12.0, color: primaryLight),
    bodyMedium: TextStyle(fontSize: 16.0, color: primaryLight),
  ),
);

final TextTheme darkTextTheme = GoogleFonts.interTextTheme(
  const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 48.0,
      color: primaryDark,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(fontSize: 16.0, color: primaryDark),
    bodySmall: TextStyle(fontSize: 12.0, color: primaryDark),
    bodyMedium: TextStyle(fontSize: 16.0, color: secondaryDark),
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
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        width: 1, // Border thickness
        color: primaryLight.withValues(
          alpha: 0.20,
        ), // Desired color for enabled state
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        width: 1, // Border thickness
        color: primaryLight.withValues(
          alpha: 0.40,
        ), // Desired color for enabled state
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryLight, // Background color of the button
      foregroundColor: primaryDark, // Text and icon color
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // Padding around the child
      shape: RoundedRectangleBorder(
        // Shape of the button
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        fontFamily:
            GoogleFonts.inter().fontFamily, // Style for the button's text
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryDark, // Background color of the button
      foregroundColor: primaryLight, // Text and icon color
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // Padding around the child
      shape: RoundedRectangleBorder(
        // Shape of the button
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        fontFamily:
            GoogleFonts.inter().fontFamily, // Style for the button's text
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryLight, // Text color
      backgroundColor: Colors.transparent, // Background color
      padding: EdgeInsets.symmetric(horizontal: 16), // Internal padding
      shape: RoundedRectangleBorder(
        // Button shape
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5, // Shadow elevation
    ),
  ),
  appBarTheme: AppBarThemeData(backgroundColor: primaryDark),
  navigationBarTheme: NavigationBarThemeData(backgroundColor: primaryDark),
);

final darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryLight,
    brightness: Brightness.dark,
  ),
  textTheme: darkTextTheme,
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        width: 1, // Border thickness
        color: primaryDark.withValues(
          alpha: 0.20,
        ), // Desired color for enabled state
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        width: 1, // Border thickness
        color: primaryDark.withValues(
          alpha: 0.40,
        ), // Desired color for enabled state
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryDark, // Background color of the button
      foregroundColor: primaryLight, // Text and icon color
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // Padding around the child
      shape: RoundedRectangleBorder(
        // Shape of the button
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        fontFamily:
            GoogleFonts.inter().fontFamily, // Style for the button's text
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryLight, // Background color of the button
      foregroundColor: primaryDark, // Text and icon color
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // Padding around the child
      shape: RoundedRectangleBorder(
        // Shape of the button
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        fontFamily:
            GoogleFonts.inter().fontFamily, // Style for the button's text
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryDark, // Text color
      backgroundColor: Colors.transparent, // Background color
      padding: EdgeInsets.symmetric(horizontal: 16), // Internal padding
      shape: RoundedRectangleBorder(
        // Button shape
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5, // Shadow elevation
    ),
  ),
  appBarTheme: AppBarThemeData(backgroundColor: primaryLight),
  navigationBarTheme: NavigationBarThemeData(backgroundColor: primaryLight),
);
