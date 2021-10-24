import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/comment_model.dart';
import 'package:flutter_application_1/screens/comments/utils/comment_repo.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsState()) {
    on<CommentsFetched>(_onCommentsFetched);
  }

final CommentRepository _repo = CommentRepository();

  Future<void> _onCommentsFetched(CommentsFetched event ,Emitter<CommentsState> emit) async{
         try{
           if(state.status == CommentStatus.initial){
          final List<Comment>? comments = await _repo.fetchComments(event.postId);
          if(comments != null){
          return emit(state.copyWith(
            status:CommentStatus.success,
            comments: comments
          ));}
       }
  
         if(state.status == CommentStatus.initial){
          final List<Comment>? comments = await _repo.fetchComments(event.postId);
          if(comments != null){
          return emit(state.copyWith(
            status:CommentStatus.success,
            comments: comments
          ));
          }}
     }
     catch(_){
       emit(state.copyWith(status: CommentStatus.failure));
     }  
  }
}
