import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc_observer.dart';
import '../services/logging_service.dart';
import '../services/preferences_service.dart';
import 'config.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Configurations.loggingEnabled) {
    LoggingService();
  }

  if (Configurations.blocObserverEnabled) {
    Bloc.observer = AppBlocObserver();
  }

  await PreferencesService.init();
}
