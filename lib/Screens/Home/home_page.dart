import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Screens/Details/details_page.dart';
import 'package:flutter_application_1/Services/controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiController = Get.find<ApiController>();
    final listOfUsers = Get.find<ApiController>().listOfUserModel;

    Card _listTile(int index) {
      return Card(
          elevation: 5,
          child: ListTile(
            leading: (listOfUsers[index].avatarUrl != null)
                ? Image.network(listOfUsers[index].avatarUrl)
                : Icon(Icons.person),
            title: (listOfUsers[index].login != null)
                ? Text(listOfUsers[index].login)
                : Text(''),
            subtitle: Text(listOfUsers[index].id),
            onTap: () {
              apiController.fetchAllDataOfUser(id: listOfUsers[index].id);

              Get.offAll(() => DeatilsPage());
            },
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        backgroundColor: Colors.teal,
      ),
      body: Obx(
        () => listOfUsers.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listOfUsers.length,
                itemBuilder: (context, index) => _listTile(index),
              ),
      ),
    );
  }
}
