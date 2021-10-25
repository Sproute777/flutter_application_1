import 'package:flutter/material.dart';
import '/pages/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import '../bloc/user_bloc.dart';


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
             
             Routemaster.of(context).push('/tab-bar/user');
            },
          ));
    }
    }