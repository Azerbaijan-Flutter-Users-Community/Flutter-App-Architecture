import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  AppThemes._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColorLight,
    primaryColorDark: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor,
    primaryColorLight: AppColors.darkPrimaryColorLight,
    scaffoldBackgroundColor: AppColors.darkScaffoldColor,
  );
}
