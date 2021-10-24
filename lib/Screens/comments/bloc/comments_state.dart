part of 'comments_bloc.dart';

enum CommentStatus{initial, success , failure}

 class CommentsState extends Equatable {
  const CommentsState({
    this.status = CommentStatus.initial,
    this.comments = const <Comment>[]
  });
  final CommentStatus status;
  final List<Comment> comments;

  CommentsState copyWith({
    CommentStatus? status,
    List<Comment>? comments
  }){
    return CommentsState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
    );
  }


  @override
  List<Object> get props => [status, comments];
}


