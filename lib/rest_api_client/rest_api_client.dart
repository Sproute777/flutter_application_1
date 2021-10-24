import 'package:dio/dio.dart' hide Headers;
import '/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/users")
  Future<List<User>> getUsers();

  @GET("/users/{id}")
  Future<User> getUser(@Path("id") String id);

  @GET("/users/{id}/posts")
  Future<List<Post>> getUserPosts(@Path("id") String id);

  @GET("/comments")
  Future<List<Comment>> getPostComment(@Query("PostId") String postId);
  
}
