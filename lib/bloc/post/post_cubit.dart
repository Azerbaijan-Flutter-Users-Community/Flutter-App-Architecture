import 'dart:async';

import '../../contractors/base_post_repository.dart';
import '../../data/models/post.dart';
import '../data/data_cubit.dart';

export '../data/data_cubit.dart';
export '../../data/models/post.dart';

class PostCubit extends DataCubit<List<Post>> {
  PostCubit(this.postRepository);

  final BasePostRepository postRepository;

  @override
  FutureOr<List<Post>> loadData() => postRepository.getPosts();
}
