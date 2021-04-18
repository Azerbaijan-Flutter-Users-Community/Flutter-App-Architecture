import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/init.dart';
import 'presentation/app.dart';

void main() async {
  await init().then((starters) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => starters.themeCubit,
          ),
        ],
        child: App(),
      ),
    );
  });
}
