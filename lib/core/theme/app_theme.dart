import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceLight,
        background: AppColors.backgroundLight,
        onSurface: AppColors.textPrimaryLight,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.jost(
          fontSize: 85,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryLight,
        ),
        displayMedium: GoogleFonts.jost(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryLight,
        ),
        displaySmall: GoogleFonts.jost(
          fontSize: 35,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: GoogleFonts.jost(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        headlineSmall: GoogleFonts.jost(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: GoogleFonts.jost(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: GoogleFonts.jost(
          fontSize: 23,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: GoogleFonts.jost(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryLight,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceDark,
        background: AppColors.backgroundDark,
        onSurface: AppColors.textPrimaryDark,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.jost(
          fontSize: 85,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryDark,
        ),
        displayMedium: GoogleFonts.jost(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryDark,
        ),
        displaySmall: GoogleFonts.jost(
          fontSize: 35,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryDark,
        ),
        headlineMedium: GoogleFonts.jost(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        headlineSmall: GoogleFonts.jost(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        titleLarge: GoogleFonts.jost(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        bodyLarge: GoogleFonts.jost(
          fontSize: 23,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryDark,
        ),
        bodyMedium: GoogleFonts.jost(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimaryDark,
        ),
      ),
    );
  }
}