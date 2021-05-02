import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/language/language_cubit.dart';
import 'bloc/post/post_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'constants/app_themes.dart';
import 'constants/supported_locales.dart';
import 'data/repositories/post_repository.dart';
import 'presentation/pages/posts/posts_page.dart';
import 'presentation/router/router_controller.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LanguageCubit>().state;

    return MaterialApp(
      title: 'Placeholder Title',
      debugShowCheckedModeBanner: false,
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
          MaterialPage(
            child: RepositoryProvider(
              create: (_) => PostRepository(),
              child: BlocProvider(
                create: (ctx) => PostCubit(
                  ctx.read<PostRepository>(),
                )..fetch(),
                child: PostsPage(),
              ),
            ),
          ),
        ],
        onPopPage: (route, result) {
          if (route.didPop(result)) {
            return true;
          }

          return false;
        },
      ),
      onGenerateRoute: RouteController.onGenerateRoute,
    );
  }
}
