import 'package:architecture_example/bloc/language/language_cubit.dart';
import 'package:architecture_example/bloc/theme/theme_cubit.dart';
import 'package:architecture_example/presentation/app.dart';
import 'package:architecture_example/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await PreferencesService.init();
  });

  testWidgets('Simple Test', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(ThemeMode.system),
          ),
          BlocProvider(
            create: (_) => LanguageCubit(Locale('en', 'US')),
          )
        ],
        child: App(),
      ),
    );
    await tester.pumpAndSettle();

    final appbarFinder = find.byType(AppBar);
    expect(appbarFinder, findsOneWidget);
  });
}
