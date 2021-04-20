import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_preferences_service.dart';

void main() {
  late MockPreferencesService? mockPreferencesService;

  setUpAll(
    () {
      mockPreferencesService = MockPreferencesService();
    },
  );

  test(
    'default values are null',
    () {
      expect(mockPreferencesService!.themeMode, isNull);
      expect(mockPreferencesService!.locale, isNull);
    },
  );

  test(
    'themeMode insertion test',
    () {
      mockPreferencesService!.changeThemeMode(ThemeMode.dark);
      expect(mockPreferencesService!.themeMode, ThemeMode.dark);
      expect(mockPreferencesService!.locale, isNull);
    },
  );

  test(
    'locale insertion test',
    () {
      mockPreferencesService!.changeLocale(Locale('en', 'US'));
      expect(mockPreferencesService!.themeMode, ThemeMode.dark);
      expect(mockPreferencesService!.locale, Locale('en', 'US'));
    },
  );

  tearDownAll(
    () {
      mockPreferencesService = null;
    },
  );
}
