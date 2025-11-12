import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color Primary = Color(0xFFF6BD00);
  static const Color backgroundColor = Color(0xFF121312);
  static const Color Grey = Color(0xFF282A28);
  static const Color White = Color(0xFFFFFFFF);
}

class AppImages {
  static const String appIcon = 'assets/images/logo.png';
  static const String IconAr = 'assets/images/icon_ar.png';
  static const String IconEn = 'assets/images/icon_en.png';

  static const String avatar1 = 'assets/images/avatar1.png';
  static const String avatar2 = 'assets/images/avatar2.png';
  static const String avatar3 = 'assets/images/avatar3.png';
  static const String avatar4 = 'assets/images/avatar4.png';
  static const String avatar5 = 'assets/images/avatar5.png';
  static const String avatar6 = 'assets/images/avatar6.png';
  static const String avatar7 = 'assets/images/avatar7.png';
  static const String avatar8 = 'assets/images/avatar8.png';
  static const String avatar9 = 'assets/images/avatar9.png';
}

class AppIcons {
  static const String idIcon = 'assets/icons/Identification_.svg';
  static const String googleIcon = 'assets/icons/google_icon.svg';
}

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.Primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.Primary),
    ),
    colorScheme: ColorScheme.light(primary: AppColors.Primary),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.roboto(
        color: AppColors.Primary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: AppColors.Primary,
        foregroundColor: AppColors.backgroundColor,
        textStyle: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.Primary,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.black),
    ),
    /*
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.Primary,
    ),
*/
    scaffoldBackgroundColor: AppColors.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: AppColors.Grey, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: AppColors.Grey, width: 1.0),
      ),
      filled: true,
      fillColor: AppColors.Grey,
      labelStyle: GoogleFonts.roboto(
        color: AppColors.White,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      // Example: label text style
      hintStyle: GoogleFonts.roboto(
        color: AppColors.White,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      // Example: hint text style
      contentPadding: EdgeInsets.all(16.0),
    ),
  );
}
