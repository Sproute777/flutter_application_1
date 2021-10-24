import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/comment_model.dart';
import 'package:flutter_application_1/rest_api_client/rest_api_client.dart';

class CommentRepository {


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