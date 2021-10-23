import 'dart:async';

import '../../data/contractors/base_post_repository.dart';
import '../../data/models/post.dart';
import '../data/data_cubit.dart';

export '../../data/models/post.dart';
export '../data/data_cubit.dart';

class PostCubit extends DataCubit<List<Post>> {
  PostCubit(this.postRepository);

  final BasePostRepository postRepository;

  @override
  FutureOr<List<Post>> loadData([int? id]) async {
    final posts = await postRepository.getPosts();

    return posts
        .map<Post>(
          (post) => post
            ..body = post.body.replaceAll(
              '\n',
              ' ',
            ),
        )
        .toList();
  }
}
