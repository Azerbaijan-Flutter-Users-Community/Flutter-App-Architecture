import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../pages/posts/posts_page.dart';
import '../pages/settings/settings_page.dart';

class RouteController {
  RouteController._();

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.signIn:
        break;
      case Routes.home:
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
  }
}
