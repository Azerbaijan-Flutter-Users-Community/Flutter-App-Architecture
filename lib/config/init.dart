import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc_observer.dart';
import '../bloc/theme/theme_cubit.dart';
import '../services/logging_service.dart';
import '../services/preferences_service.dart';
import 'config.dart';

class Starters {
  Starters({
    required this.themeCubit,
  });

  final ThemeCubit themeCubit;
}

Future<Starters> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Configurations.loggingEnabled) {
    LoggingService();
  }

  if (Configurations.blocObserverEnabled) {
    Bloc.observer = AppBlocObserver();
  }

  final prefService = await PreferencesService.instance;

  final themeMode = await prefService.themeMode;
  prefService.changeThemeMode(themeMode ?? ThemeMode.system);
  final themeCubit = ThemeCubit(themeMode ?? ThemeMode.system);

  return Starters(themeCubit: themeCubit);
}
