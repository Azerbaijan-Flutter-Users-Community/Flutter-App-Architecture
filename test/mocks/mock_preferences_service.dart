import 'package:architecture_example/contractors/base_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockPreferencesService implements BasePreferencesService {
  final _values = <String, Object>{};

  @visibleForTesting
  @override
  Future<void> changeLocale(Locale locale) async {
    _values['locale'] = locale;
    SharedPreferences.setMockInitialValues(_values);
  }

  @visibleForTesting
  @override
  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _values['themeMode'] = themeMode.index;
    SharedPreferences.setMockInitialValues(_values);
  }

  @visibleForTesting
  @override
  Locale? get locale {
    final locale = _values['locale'];

    if (locale != null) {
      return locale as Locale;
    }

    return null;
  }

  @visibleForTesting
  @override
  ThemeMode? get themeMode {
    final themeMode = _values['themeMode'];

    if (themeMode != null) {
      return ThemeMode.values[themeMode as int];
    }

    return null;
  }
}
