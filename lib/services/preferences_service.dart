import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService._();

  static Completer<PreferencesService>? _completer;
  SharedPreferences? _sharedPreferences;

  static Future<PreferencesService> get instance async {
    if (_completer == null) {
      final completer = Completer<PreferencesService>();

      try {
        final instance = PreferencesService._();
        instance._sharedPreferences = await SharedPreferences.getInstance();
        completer.complete(instance);
      } on Exception catch (e) {
        completer.completeError(e);
        _completer = null;
        return completer.future;
      }

      _completer = completer;
    }

    return _completer!.future;
  }

  final _themeModeKey = 'themeMode';

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _sharedPreferences?.setInt(_themeModeKey, themeMode.index);
  }

  Future<ThemeMode?>? get themeMode async {
    final index = _sharedPreferences?.getInt(_themeModeKey);

    if (index != null) {
      return ThemeMode.values[index];
    }

    return null;
  }
}
