import 'package:flutter/material.dart';

import '../services/logging_service.dart';
import 'config.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Configurations.loggingEnabled) {
    LoggingService();
  }
}
