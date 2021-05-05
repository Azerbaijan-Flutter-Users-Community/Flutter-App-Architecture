import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  AppThemes._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColorLight,
    primaryColorDark: AppColors.primaryColorDark,
    cardColor: AppColors.postItemBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor,
    primaryColorLight: AppColors.darkPrimaryColorLight,
    cardColor: AppColors.darkPostItemBackgroundColor,
    dividerColor: AppColors.postItemBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkPostItemBackgroundColor,
      selectedItemColor: AppColors.primaryColor,
      elevation: 8.0,
    ),
  );
}
