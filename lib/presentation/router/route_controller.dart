import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post/post_cubit.dart';
import '../../constants/routes.dart';
import '../../data/repositories/post_repository.dart';
import '../pages/settings/settings_page.dart';
import '../pages/posts/posts_page.dart';

class RouteController {
  RouteController._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.posts:
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (_) => PostRepository(),
            child: BlocProvider(
              create: (context) => PostCubit(
                context.read<PostRepository>(),
              )..fetch(),
              child: PostsPage(),
            ),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      default:
        throw UnimplementedError();
    }
  }
}
