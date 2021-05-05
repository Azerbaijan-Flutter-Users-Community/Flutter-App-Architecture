import '../../data/models/comment.dart';

abstract class BaseCommentRepository {
  Future<List<Comment>> getComments({required int postId});
}
