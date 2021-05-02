import 'package:architecture_example/presentation/router/app_route_delegate.dart';
import 'package:architecture_example/presentation/router/app_route_information_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/language/language_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'constants/app_themes.dart';
import 'constants/supported_locales.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LanguageCubit>().state;

    return MaterialApp.router(
      routerDelegate: AppRouteDelegate(),
      routeInformationParser: AppRouteInformationParser(),
      title: 'Placeholder Title',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
    );
  }
}
