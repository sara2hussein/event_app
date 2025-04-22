import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    focusColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.whiteColor,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: AppColors.whiteColor, width: 6),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.bold20Black,
      bodyLarge: AppStyles.bold20Black,
      bodyMedium: AppStyles.medium16Black,
      headlineSmall: AppStyles.medium16Primary,
      titleLarge: AppStyles.bold14Black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    focusColor: AppColors.primaryLight,

    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,

      showUnselectedLabels: true,
      selectedItemColor: AppColors.whiteColor,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: AppColors.whiteColor, width: 6),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
      headlineMedium: AppStyles.bold20Black,
      bodyLarge: AppStyles.bold20Primary,
      bodyMedium: AppStyles.medium16White,
      headlineSmall: AppStyles.medium16White,
      titleLarge: AppStyles.bold14White,
    ),
  );
}
