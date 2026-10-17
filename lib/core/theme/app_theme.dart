import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backGroundGrey,
      contentPadding: EdgeInsets.all(10),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.grey,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.orangeLight, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.grey, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.white, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 2),
      ),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 40,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backGroundGrey,
      selectedItemColor: AppColors.orangeLight,
      unselectedItemColor: AppColors.grey,
      selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      selectedIconTheme: IconThemeData(size: 24),
    ),
  );
}
