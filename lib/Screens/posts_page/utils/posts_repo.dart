import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_application_1/rest_api_client/rest_api_client.dart';



class PostsRepository {

  Future<List<Post>?> fetchPosts(int postId ) async {
    final RestClient client = RestClient(Dio());
    try {
      final List<Post> data = await client.getUserPosts(postId.toString());
      return data;
    } catch (e) {
      return   null;
    }
  }
}