import 'dart:async';

import '../../data/contractors/base_comment_repository.dart';
import '../../data/models/comment.dart';
import '../data/data_cubit.dart';

export '../data/data_cubit.dart';

class CommentCubit extends DataCubit<List<Comment>> {
  CommentCubit(this.baseCommentRepository);

  final BaseCommentRepository baseCommentRepository;

  @override
  FutureOr<List<Comment>> loadData([int? postId]) =>
      baseCommentRepository.getComments(postId: postId!);
}
