import 'package:flutter/material.dart';

import 'config/init.dart';
import 'presentation/app.dart';

void main() async {
  await init();
  runApp(App());
}
