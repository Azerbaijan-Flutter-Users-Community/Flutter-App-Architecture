import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '../bloc/theme/theme_cubit.dart';
import 'values/app_themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    return MaterialApp(
      title: 'Placeholder Title',
      themeMode: themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page'),
      ),
      body: Center(
        child: Text(
          'Welcome To\nStarter Architecture Example',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: Switch(
        value: themeMode == ThemeMode.dark,
        onChanged: (value) {
          themeCubit.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
