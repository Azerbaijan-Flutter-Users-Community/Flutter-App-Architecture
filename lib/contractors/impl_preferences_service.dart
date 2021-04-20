import 'package:flutter/material.dart';

abstract class ImplPreferencesService {
  Future<void> changeThemeMode(ThemeMode themeMode);
  ThemeMode? get themeMode;
  Future<void> changeLocale(Locale locale);
  Locale? get locale;
}
