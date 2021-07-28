import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_application_1/Screens/Home/home_page.dart';
import 'package:flutter_application_1/Services/controller.dart';

void main() {
  runApp(GitHubApp());
}

class GitHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ApiController()).fetchAllUser();
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
