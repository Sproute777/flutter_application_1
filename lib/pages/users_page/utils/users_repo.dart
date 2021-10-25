import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/rest_api_client/rest_api_client.dart';



class UsersRepository {
Future<List<User>?> fetchUsers() async {
    final RestClient client = RestClient(Dio());
    try {
      final List<User> data = await client.getUsers();
      return data;
    } catch (e) {
      return  null;
    }
  }
}