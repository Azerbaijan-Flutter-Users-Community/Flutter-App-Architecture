import 'package:architecture_example/bloc/theme/theme_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_preferences_service.dart';

void main() {
  group(
    'ThemeCubit without default [ThemeMode]',
    () {
      late ThemeCubit themeCubit;

      setUp(() async {
        themeCubit = ThemeCubit(MockPreferencesService());
      });

      blocTest<ThemeCubit, ThemeMode>(
        'default state is [ThemeMode.system]',
        build: () => themeCubit,
        expect: () => [],
        verify: (_) {
          expect(themeCubit.state, ThemeMode.system);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'changeTheme test',
        build: () => themeCubit,
        act: (cubit) => cubit.changeTheme(ThemeMode.dark),
        expect: () => [ThemeMode.dark],
        verify: (_) {
          expect(themeCubit.state, ThemeMode.dark);
        },
      );

      tearDown(() {
        themeCubit.close();
      });
    },
  );

  group(
    'ThemeCubit with default [ThemeMode]',
    () {
      late ThemeCubit themeCubit;

      setUp(() async {
        final mockPreferencesService = MockPreferencesService();
        mockPreferencesService.changeThemeMode(ThemeMode.light);
        themeCubit = ThemeCubit(mockPreferencesService);
      });

      blocTest<ThemeCubit, ThemeMode>(
        'default state is [ThemeMode.light]',
        build: () => themeCubit,
        expect: () => [],
        verify: (_) {
          expect(themeCubit.state, ThemeMode.light);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'changeTheme test',
        build: () => themeCubit,
        act: (_) => themeCubit.changeTheme(ThemeMode.dark),
        expect: () => [ThemeMode.dark],
      );

      tearDown(() {
        themeCubit.close();
      });
    },
  );
}
