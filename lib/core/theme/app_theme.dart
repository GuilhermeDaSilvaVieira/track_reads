import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_pallete.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData.light(useMaterial3: true).copyWith(
      // Color Scheme
      brightness: Brightness.light,
      primaryColor: AppPallete.lightPrimary,
      scaffoldBackgroundColor: AppPallete.lightBackground,

      // Text Theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppPallete.lightOnBackground,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppPallete.lightOnBackground,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          color: AppPallete.lightOnBackground,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppPallete.lightOnBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppPallete.lightOnBackground,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppPallete.lightPrimary,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppPallete.lightOnBackground,
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: AppPallete.transparent,
          systemNavigationBarColor: AppPallete.lightBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        color: AppPallete.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: AppPallete.lightPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Input Decoration Theme (for TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPallete.lightInputFill,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.lightOnBackground,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.lightPrimary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.lightOnBackground,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.lightOnBackground,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.lightPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          foregroundColor: AppPallete.lightBackground,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 2,
        color: AppPallete.lightCardBackground,
      ),

      // ListTile Theme
      listTileTheme: ListTileThemeData(
        tileColor: AppPallete.lightInputFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  // Dark theme (optional, can be used for dark mode)
  static ThemeData get dark {
    return ThemeData.dark(useMaterial3: true).copyWith(
      // Color Scheme
      brightness: Brightness.dark,
      primaryColor: AppPallete.darkPrimary,
      scaffoldBackgroundColor: AppPallete.darkBackground,

      // Text Theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppPallete.darkOnBackground,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppPallete.darkOnBackground,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          color: AppPallete.darkOnBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppPallete.darkOnBackground,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppPallete.darkPrimary,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppPallete.darkOnBackground,
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppPallete.transparent,
          systemNavigationBarColor: AppPallete.darkBackground,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        color: AppPallete.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: AppPallete.darkPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Input Decoration Theme (for TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPallete.darkInputFill,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.darkOnBackground,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.darkPrimary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.darkOnBackground,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.darkOnBackground,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.darkPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          foregroundColor: AppPallete.darkOnBackground,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 2,
        color: AppPallete.darkCardBackground,
      ),

      // ListTile Theme
      listTileTheme: ListTileThemeData(
        tileColor: AppPallete.darkInputFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
