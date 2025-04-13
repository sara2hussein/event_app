import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
    )
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
    )
  );
}
