import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/rest_api_client/rest_api_client.dart';



class SingleUserRepository {

  Future<User?> fetchUser(int id) async {
    final RestClient client = RestClient(Dio());
    try {
      final User data = await client.getUser(id.toString());
      return data;
    } catch (e) {
      return   null;
    }
  }
}