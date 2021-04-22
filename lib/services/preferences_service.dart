import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contractors/impl_preferences_service.dart';

class PreferencesService implements ImplPreferencesService {
  PreferencesService._();

  static PreferencesService? _instance;
  SharedPreferences? _sharedPreferences;

  static PreferencesService get instance => _instance!;

  static Future<void> init() async {
    if (_instance == null) {
      try {
        _instance = PreferencesService._();
        _instance?._sharedPreferences = await SharedPreferences.getInstance();
      } on Exception catch (_) {
        // TODO: Something
      }
    }
  }

  final _themeModeKey = 'themeMode';
  final _languageCodeKey = 'languageCode';
  final _countryCodeKey = 'countryCode';

  @override
  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _sharedPreferences?.setInt(_themeModeKey, themeMode.index);
  }

  @override
  ThemeMode? get themeMode {
    final index = _sharedPreferences?.getInt(_themeModeKey);

    if (index != null) {
      return ThemeMode.values[index];
    }

    return null;
  }

  @override
  Future<void> changeLocale(Locale locale) async {
    _sharedPreferences?.setString(_languageCodeKey, locale.languageCode);
    _sharedPreferences?.setString(_countryCodeKey, locale.countryCode ?? '');
  }

  @override
  Locale? get locale {
    final languageCode = _sharedPreferences?.getString(_languageCodeKey);
    final countryCode = _sharedPreferences?.getString(_countryCodeKey);

    if (languageCode != null) {
      late String? country;

      if (countryCode != null) {
        if (countryCode.isEmpty) {
          country = null;
        } else {
          country = countryCode;
        }
      }

      return Locale(languageCode, country);
    }

    return null;
  }
}
