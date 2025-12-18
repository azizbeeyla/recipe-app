import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import 'app_colors.dart';

class AppThemes {
  final lightTheme = ThemeData(
    // scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      error: Colors.red,
      onError: Colors.yellow,
      surface: AppColors.white,
      onSurface: AppColors.black,
      inversePrimary: AppColors.black,
      onInverseSurface: Colors.white,
    ),

    textTheme: TextTheme(
      bodyMedium: AppStyles.w500s15,
      bodyLarge: AppStyles.w600s14,
      bodySmall: AppStyles.w400s15,
      titleMedium: AppStyles.w400s13,
      titleLarge: AppStyles.w400s12,
      titleSmall: AppStyles.w300s11,
      displayMedium: AppStyles.w600s20,
      displayLarge: AppStyles.w600s25,
      displaySmall: AppStyles.w500s13,

    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.watermelonRed,
      ),
    ),
  );

  final darkTheme = ThemeData(
    // scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      error: Colors.red,
      onError: Colors.yellow,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.white,
      inversePrimary: AppColors.white,
      onInverseSurface: AppColors.backgroundColor,
    ),

    textTheme: TextTheme(
      bodyMedium: AppStyles.w500s15w,
      bodyLarge: AppStyles.w600s14w,
      bodySmall: AppStyles.w400s15w,
      titleMedium: AppStyles.w400s13w,
      titleLarge: AppStyles.w400s12w,
      titleSmall: AppStyles.w300s11w,
      displayMedium: AppStyles.w600s20w,
      displayLarge: AppStyles.w600s25w,
      displaySmall: AppStyles.w500s13w,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.watermelonRed,
      ),
    ),
  );
}
