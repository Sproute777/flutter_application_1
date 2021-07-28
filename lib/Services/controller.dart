import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/Model/user_model.dart';

class ApiController extends GetxController {
  RxList listOfUserModel = [].obs;
  RxList singleUser = [].obs;

  Future<void> fetchAllUser() async {
    try {
      var _response = await get(Uri.parse("https://api.github.com/users"));
      var data = jsonDecode(_response.body);
      for (var json in data) {
        listOfUserModel.add(Persona.fromJson(json));
      }
    } on HandshakeException catch (e) {
      print(e);
    }
  }

  Future<void> fetchAllDataOfUser({required int id}) async {
    clearField();
    try {
      await _fetchUserPersonalData(id);
    } catch (e) {}
  }

  Future<void> _fetchUserPersonalData(int id) async {
    var _response = await get(Uri.parse("https://api.github.com/users/$id"));
    var data = jsonDecode(_response.body);
    singleUser.add(Persona.fromJson(data));
  }

  void clearField() {
    singleUser.clear();
  }
}
