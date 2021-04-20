import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc/language/language_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'config/init.dart';
import 'services/preferences_service.dart';

void main() async {
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(PreferencesService.instance),
        ),
        BlocProvider(
          create: (_) => LanguageCubit(PreferencesService.instance),
        ),
      ],
      child: App(),
    ),
  );
}
