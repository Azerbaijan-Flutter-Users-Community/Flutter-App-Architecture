import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/post.dart';

part 'post_data_provider.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class PostDataProvider {
  factory PostDataProvider(Dio dio, {String baseUrl}) = _PostDataProvider;

  @GET('/posts')
  Future<List<Post>> getPosts();
}
