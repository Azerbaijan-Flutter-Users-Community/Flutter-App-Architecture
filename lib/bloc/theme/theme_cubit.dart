import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contractors/impl_preferences_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this.preferencesService) : super(ThemeMode.system) {
    emit(preferencesService.themeMode ?? ThemeMode.system);
  }

  ImplPreferencesService preferencesService;

  void changeTheme(ThemeMode themeMode) async {
    if (state == themeMode) {
      return;
    }

    await preferencesService.changeThemeMode(themeMode);
    emit(themeMode);
  }
}
