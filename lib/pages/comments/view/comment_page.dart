import '/pages/posts_page/bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../bloc/comments_bloc.dart';

class CommentsPage extends StatefulWidget {
  int postId;
  CommentsPage({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  void initState() {
    super.initState();
    context.read<CommentsBloc>().add(CommentsFetched(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    final posts = context.read<PostsBloc>().state.posts;
    final post = posts.firstWhere((element) => element.id == widget.postId);
    return Scaffold(
        body: Column(
      children: [
        ListTile(
          title: Text(post.title),
          subtitle: Text(post.title),
        ),
        Expanded(
          child: BlocBuilder<CommentsBloc, CommentsState>(
            builder: (context, state) {
              return ListView.builder(
                  itemCount: state.comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.comments[index].name),
                      subtitle: Text(state.comments[index].body),
                    );
                  });
            },
          ),
        )
      ],
    ));
  }
}


