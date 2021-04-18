import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService._();

  static PreferencesService? _instance;
  SharedPreferences? _sharedPreferences;

  static PreferencesService get instance => _instance!;

  static Future<void> init() async {
    if (_instance == null) {
      try {
        _instance = PreferencesService._();
        _instance?._sharedPreferences = await SharedPreferences.getInstance();
      } on Exception catch (e) {
        // TODO: Something
      }
    }
  }

  final _themeModeKey = 'themeMode';

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _sharedPreferences?.setInt(_themeModeKey, themeMode.index);
  }

  ThemeMode? get themeMode {
    final index = _sharedPreferences?.getInt(_themeModeKey);

    if (index != null) {
      return ThemeMode.values[index];
    }

    return null;
  }
}
