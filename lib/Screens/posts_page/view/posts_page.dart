import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/comments/bloc/comments_bloc.dart';
import 'package:flutter_application_1/screens/posts_page/bloc/posts_bloc.dart';
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

class TilePost extends StatefulWidget {
  final int index;
 TilePost({Key? key,required this.index}) : super(key: key);
 

  @override
  _TilePostState createState() => _TilePostState();
}

class _TilePostState extends State<TilePost> {
  bool _customTileExpanded = false;


   Widget build(BuildContext context) {

        final comments = context.select((CommentsBloc bloc) => bloc.state.comments);
       List<Widget> listComment  = [];
        comments.forEach((element) {
          listComment.add( ListTile(title: Text(element.name),));
         });
       

    final posts = context.select((PostsBloc bloc)=> bloc.state.posts);
    final title = posts[widget.index].title;
    final body = posts[widget.index].body;
      return Card(
          elevation: 5,
          child: ExpansionTile(
             trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,),
             onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
            context.read<CommentsBloc>().add(CommentsFetched(posts[widget.index].id));
          },   
            leading: Icon(Icons.message),
            title:   Text(title, style: TextStyle(color: Colors.black),),
            subtitle: Text(body),
            // onTap: () {
          children: listComment,
          
            // },
          ));
    }
    }

  