import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/language/language_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'presentation/router/route_controller.dart';
import 'utils/constants/app_themes.dart';
import 'utils/constants/supported_locales.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LanguageCubit>().state;

    return MaterialApp(
      title: 'Placeholder Title',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      locale: locale,
      supportedLocales: supportedLocales,
      home: SplashPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      onGenerateRoute: RouteController.onGenerateRoute,
    );
  }
}
