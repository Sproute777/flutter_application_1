import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleUserPage extends StatelessWidget {
  const SingleUserPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final singleUser =context.select((SingleUserBloc bloc)=> bloc.state);

    return 
       (singleUser.status == UserStatus.failure)
         ? Center(child: Text('failure'),)
         : 
       
      (singleUser.status == UserStatus.initial)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : 
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _row('Name', singleUser.user.name),
                  _row('User name', singleUser.user.username),

                  _row('Email', singleUser.user.email),
                  _row('Phone', singleUser.user.phone),
                ],
    );
  }

  // Widget _image() {
  //   return Center(child: Icon(Icons.person));
  // }

  Widget _row(String heading, String data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Text("$heading : ", style: TextStyle(fontWeight: FontWeight.w500)),
            Text(data),
          ],
        ),
      ),
    );
  }
}
