import 'package:dio/dio.dart';
import '/models/comment_model.dart';
import '/rest_api_client/rest_api_client.dart';

class CommentsRepository {


    Future<List<Comment>?> fetchComments(int postId ) async {
    final RestClient client = RestClient(Dio());
    try {
      final List<Comment> data = await client.getPostComment(postId.toString());
      return data;
    } catch (e) {
      return   null;
    }
  }
}