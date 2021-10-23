import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/comment/comment_cubit.dart';
import '../../bloc/post/post_cubit.dart';
import '../../data/repositories/comment_repository.dart';
import '../../data/repositories/post_repository.dart';
import '../../utils/constants/routes.dart';
import '../pages/comments/comments_page.dart';
import '../pages/posts/posts_page.dart';
import '../pages/settings/settings_page.dart';

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
      case Routes.comments:
        final postId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (_) => CommentRepository(),
            child: BlocProvider(
              create: (context) => CommentCubit(
                context.read<CommentRepository>(),
              )..fetch(postId),
              child: CommentsPage(),
            ),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      default:
        throw UnimplementedError('Routes is not defined for ${settings.name}!');
    }
  }
}
