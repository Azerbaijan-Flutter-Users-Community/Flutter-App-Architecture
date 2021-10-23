import 'package:architecture_example/data/models/comment.dart';

import '../../locator.dart';
import '../contractors/base_comment_repository.dart';
import '../data_providers/comment_data_provider.dart';

class CommentRepository implements BaseCommentRepository {
  final _commentDataProvider = Locator.instance.get<CommentDataProvider>();

  @override
  Future<List<Comment>> getComments({required int postId}) =>
      _commentDataProvider.getComments(postId);
}
