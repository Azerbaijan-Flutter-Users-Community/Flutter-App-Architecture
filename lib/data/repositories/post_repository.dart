import 'package:architecture_example/data/models/post.dart';

import '../../contractors/base_post_repository.dart';
import '../../locator.dart';
import '../data_providers/post_data_provider.dart';

class PostRepository implements BasePostRepository {
  final _postDataProvider = Locator.instance.get<PostDataProvider>();

  @override
  Future<List<Post>> getPosts() => _postDataProvider.getPosts();
}
