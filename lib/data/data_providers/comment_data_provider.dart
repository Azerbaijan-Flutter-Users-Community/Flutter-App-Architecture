import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/comment.dart';

part 'comment_data_provider.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class CommentDataProvider {
  factory CommentDataProvider(Dio dio, {String baseUrl}) = _CommentDataProvider;

  @GET('/comments')
  Future<List<Comment>> getComments(@Query('postId') int postId);
}
