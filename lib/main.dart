import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme/theme_cubit.dart';
import 'config/init.dart';
import 'presentation/app.dart';

void main() async {
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(ThemeMode.system),
        ),
      ],
      child: App(),
    ),
  );
}
