import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/posts_page/bloc/posts_bloc.dart';
import 'package:flutter_application_1/screens/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/screens/users_page/bloc/user_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
 

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Retrofit"),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<UsersBloc,UsersState>(
        builder: (context,state){
        if(state.status == BlocStatus.failure){
          return Center(child: Text('failure'),);
        }
        if(state.status == BlocStatus.initital){
          return Center(
             child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context,index){
            return TileUser(index: index);
          });
        }
      ),
      floatingActionButton: TextButton(child: Text('add users'),onPressed: (){ context.read<UsersBloc>().add(UsersFetched());},),
    );
  }
}

class TileUser extends StatelessWidget {
  final int index;
  const TileUser({Key? key,required this.index}) : super(key: key);

   Widget build(BuildContext context) {
    final users = context.select((UsersBloc bloc)=> bloc.state.users);
    final name = users[index].name;
    final username = users[index].username;
      return Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(Icons.person),
            title:   Text(name, style: TextStyle(color: Colors.black),),
            subtitle: Text(username),
            onTap: ()  {
             context.read<SingleUserBloc>().add(FetchUser(index));
             
            //  context.read<PostsBloc>().add(PostsFetched(index));
             
              Navigator.of(context).pushNamed('/tabs/user');
        
            },
          ));
    }
    }