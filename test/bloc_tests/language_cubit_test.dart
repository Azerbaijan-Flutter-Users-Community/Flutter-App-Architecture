import 'package:architecture_example/bloc/language/language_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_preferences_service.dart';

void main() {
  group(
    'LanguageCubit without default [Locale]',
    () {
      late LanguageCubit languageCubit;

      setUp(() async {
        languageCubit = LanguageCubit(MockPreferencesService());
      });

      blocTest<LanguageCubit, Locale>(
        'default state is [ThemeMode.system]',
        build: () => languageCubit,
        expect: () => [],
        verify: (_) {
          expect(languageCubit.state, Locale('en', 'US'));
        },
      );

      blocTest<LanguageCubit, Locale>(
        'changeTheme test',
        build: () => languageCubit,
        act: (cubit) => cubit.changeLocale(Locale('az', 'AZ')),
        expect: () => [Locale('az', 'AZ')],
      );

      tearDown(() {
        languageCubit.close();
      });
    },
  );

  group(
    'ThemeCubit with default [ThemeMode]',
    () {
      late LanguageCubit languageCubit;

      setUp(() async {
        final mockPreferencesService = MockPreferencesService();
        mockPreferencesService.changeThemeMode(ThemeMode.light);
        languageCubit = LanguageCubit(mockPreferencesService);
      });

      blocTest<LanguageCubit, Locale>(
        'default state is [ThemeMode.light]',
        build: () => languageCubit,
        expect: () => [],
        verify: (_) {
          expect(languageCubit.state, Locale('en', 'US'));
        },
      );

      blocTest<LanguageCubit, Locale>(
        'changeTheme test',
        build: () => languageCubit,
        act: (_) => languageCubit.changeLocale(Locale('az', 'AZ')),
        expect: () => [Locale('az', 'AZ')],
      );

      tearDown(() {
        languageCubit.close();
      });
    },
  );
}
