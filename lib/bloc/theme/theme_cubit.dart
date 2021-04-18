import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/preferences_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(ThemeMode themeMode) : super(themeMode);

  void changeTheme(ThemeMode themeMode) async {
    if (state == themeMode) {
      return;
    }

    final prefService = await PreferencesService.instance;
    prefService.changeThemeMode(themeMode);
    emit(themeMode);
  }
}
