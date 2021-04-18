import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';

import '../bloc/language/language_cubit.dart';
import '../bloc/theme/theme_cubit.dart';
import 'values/app_themes.dart';
import 'values/supported_locales.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LanguageCubit>().state;

    return MaterialApp(
      title: 'Placeholder Title',
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
      home: Navigator(
        pages: [
          MaterialPage(child: DemoPage()),
        ],
        onPopPage: (route, result) {
          if (route.didPop(result)) {
            return true;
          }

          return false;
        },
      ),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _log = Logger('Demo Page');

  @override
  void initState() {
    super.initState();
    _log.info('initState working...');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _log.fine('Successfully built :)');
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final themeMode = themeCubit.state;
    final languageCubit = context.watch<LanguageCubit>();
    final locale = languageCubit.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page'),
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.hi,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Theme:'),
              SizedBox(width: 10),
              Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeCubit.changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Language:'),
              SizedBox(width: 10),
              Switch(
                value: locale == Locale('az', 'AZ'),
                onChanged: (value) {
                  languageCubit.changeLocale(
                    value ? Locale('az', 'AZ') : Locale('en', 'US'),
                  );
                },
              )
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
