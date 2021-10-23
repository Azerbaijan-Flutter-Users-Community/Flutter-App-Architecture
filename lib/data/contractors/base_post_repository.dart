import '../../data/models/post.dart';

abstract class BasePostRepository {
  Future<List<Post>> getPosts();
}
