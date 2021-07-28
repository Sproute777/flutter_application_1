import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Services/controller.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final singleUser = Get.find<ApiController>().singleUser;

    return Obx(
      () => singleUser.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Row(children: <Widget>[
              _image(singleUser[0].avatarUrl),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _row('Name', singleUser[0].name),
                  _row('Company', singleUser[0].company),
                  _row('Location', singleUser[0].location),
                  _row('Email', singleUser[0].email),
                  _row('Bio', singleUser[0].bio),
                  _row('Twitter name', singleUser[0].twitterUsername),
                  _row('Email', singleUser[0].email),
                  _row('created_at', singleUser[0].createdAt),
                  _row('updated_at', singleUser[0].updatedAt),
                ],
              ),
            ]),
    );
  }

  Widget _image(String data) {
    return (data != null)
        ? Image.network(
            data,
            height: 200,
            width: 200,
          )
        : Icon(Icons.person);
  }

  Widget _row(String heading, String data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Text("$heading : ", style: TextStyle(fontWeight: FontWeight.w500)),
            (data != null) ? Text(data) : Text(''),
          ],
        ),
      ),
    );
  }
}
