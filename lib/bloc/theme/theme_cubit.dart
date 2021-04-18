import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/preferences_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(ThemeMode initialThemeMode) : super(initialThemeMode) {
    emit(PreferencesService.instance.themeMode ?? initialThemeMode);
  }

  void changeTheme(ThemeMode themeMode) async {
    if (state == themeMode) {
      return;
    }

    await PreferencesService.instance.changeThemeMode(themeMode);
    emit(themeMode);
  }
}
