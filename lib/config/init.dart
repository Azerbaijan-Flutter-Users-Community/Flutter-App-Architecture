import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc_observer.dart';
import '../data/data_providers/post_data_provider.dart';
import '../locator.dart';
import '../services/logging_service.dart';
import '../services/preferences_service.dart';
import 'config.dart';
import '../data/data_providers/comment_data_provider.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Configurations.loggingEnabled) {
    LoggingService();
  }

  if (Configurations.blocObserverEnabled) {
    Bloc.observer = AppBlocObserver();
  }

  await PreferencesService.init();
  await _initDataProviders();
}

Future<void> _initDataProviders() async {
  final locator = Locator.instance;
  final dio = Dio();

  locator.register<PostDataProvider>(PostDataProvider(dio));
  locator.register<CommentDataProvider>(CommentDataProvider(dio));
}
