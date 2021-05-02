import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post/post_cubit.dart';
import '../../constants/routes.dart';
import '../../data/repositories/post_repository.dart';
import '../pages/posts/posts_page.dart';
import '../pages/settings/settings_page.dart';

class AppRouteDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  final _pages = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _pages,
      onPopPage: (route, result) {
        if (route.didPop(result)) {
          return true;
        }

        return false;
      },
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case Routes.signIn:
            break;
          case Routes.posts:
            return MaterialPageRoute(
              builder: (_) => PostsPage(),
            );
          case Routes.settings:
            return MaterialPageRoute(
              builder: (_) => SettingsPage(),
            );
          default:
            throw UnimplementedError(
              'Route: ${routeSettings.name} is not defined!',
            );
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    return SynchronousFuture(configuration);
  }
}
