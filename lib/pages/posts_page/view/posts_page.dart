import 'package:flutter/material.dart';
import '/pages/posts_page/bloc/posts_bloc.dart';
import '/pages/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
 
 @override
 void initState(){
   super.initState();
   final user = context.read<SingleUserBloc>().state.user;
   context.read<PostsBloc>().add(PostsFetched(user.id));
 }

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
 TilePost({Key? key,required this.index}) : super(key: key);


   Widget build(BuildContext context) {
    final posts = context.select((PostsBloc bloc)=> bloc.state.posts);
    final postId = posts[index].id;
    final title = posts[index].title;
    final body = posts[index].body;
      return Card(
          elevation: 5,
          child: ListTile(
             trailing: Icon(Icons.message),
           
            leading: Icon(Icons.message),
            title:   Text(title, style: TextStyle(color: Colors.black),),
            subtitle: Text(body),
            onTap: () {
              // context.read<CommentsBloc>().add(CommentsFetched(postId));
              Routemaster.of(context).push('/comments/$postId');
            },
          ));
    }
    }

  