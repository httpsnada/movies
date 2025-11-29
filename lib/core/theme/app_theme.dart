import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0XFF121312);
  static const Color white = Color(0XFFFFFFFF);
  static const Color charcoal = Color(0XFF282A28);
  static const Color yellow = Color(0XFFF6BD00);
  static const Color red = Color(0XFFE82626);

  // gradient colors
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(primary: AppColors.primary),
    scaffoldBackgroundColor: AppColors.primary,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      foregroundColor: AppColors.yellow,
      titleTextStyle: TextStyle(
        color: AppColors.yellow,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.charcoal,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 3,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.charcoal,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      contentPadding: EdgeInsets.all(12),
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.yellow, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 1.5),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 1.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.yellow,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
    ),
  );
}
