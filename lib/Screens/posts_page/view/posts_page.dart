import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/posts_page/bloc/posts_bloc.dart';
import 'package:flutter_application_1/screens/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final state =context.select((PostsBloc bloc)=> bloc.state);

    return 
       (state.status == PostsStatus.failure)
         ? Center(child: Text('failure'),)
         : 
       
      (state.status == PostsStatus.initial)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : 
              ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context,index){
                  return TilePost(index: index);
                }
    );
  } 
}

class TilePost extends StatelessWidget {
  final int index;
  const TilePost({Key? key,required this.index}) : super(key: key);

   Widget build(BuildContext context) {
    final posts = context.select((PostsBloc bloc)=> bloc.state.posts);
    final title = posts[index].title;
    final body = posts[index].body;
      return Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(Icons.message),
            title:   Text(title, style: TextStyle(color: Colors.black),),
            subtitle: Text(body),
            onTap: () {

            },
          ));
    }
    }