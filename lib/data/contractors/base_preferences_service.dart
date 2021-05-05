import 'package:flutter/material.dart';

abstract class BasePreferencesService {
  Future<void> changeThemeMode(ThemeMode themeMode);
  ThemeMode? get themeMode;
  Future<void> changeLocale(Locale locale);
  Locale? get locale;
}
