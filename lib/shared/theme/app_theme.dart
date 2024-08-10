import 'package:flutter/material.dart';
import 'package:maibrain/shared/res/values/app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData darkTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: "Play",
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.secondary,
          elevation: 0,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.tertiary,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.primary,
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 18, // Size for smaller display text
            fontWeight: FontWeight.normal,
            fontFamily: "Play",
            color:
                AppColors.onPrimary, // Suitable for reading on all backgrounds
            letterSpacing: 0.4,
          ),
          displayMedium: TextStyle(
            fontSize: 20, // Medium display size
            fontWeight: FontWeight.w600,
            fontFamily: "Play",
            color: AppColors.onPrimary,
            letterSpacing: 0.4,
          ),
          displayLarge: TextStyle(
            fontSize: 24, // Large display size
            fontWeight: FontWeight.w500,
            fontFamily: "Play",
            color: AppColors.onPrimary,
            letterSpacing: 0.4,
          ),

          // Body Texts: Typically used for the main content
          bodySmall: TextStyle(
            fontSize: 14, // Small body text size
            fontFamily: "Play",
            fontWeight: FontWeight.normal,
            color: AppColors.onPrimary,
            letterSpacing: 0.2,
          ),
          bodyMedium: TextStyle(
            fontSize: 16, // Regular body text size
            fontWeight: FontWeight.normal,
            fontFamily: "Play",
            color: AppColors.onPrimary,
            letterSpacing: 0.2,
          ),
          bodyLarge: TextStyle(
            fontSize: 18, // Large body text size
            fontFamily: "Play",
            fontWeight: FontWeight.normal,
            color: AppColors.onPrimary,
            letterSpacing: 0.2,
          ),
        ),
      );
}
