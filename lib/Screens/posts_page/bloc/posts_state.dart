part of 'posts_bloc.dart';

enum PostsStatus {initial, success ,failure}

 class PostsState extends Equatable {
  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const <Post>[],
  });
  final PostsStatus status;
  final List<Post> posts;
  
PostsState copyWith({
  PostsStatus? status,
  List<Post>? posts
}){
  return PostsState(
    status: status ?? this.status,
    posts: posts ?? this.posts
  );
}

  @override
  List<Object> get props => [status,posts];
}

