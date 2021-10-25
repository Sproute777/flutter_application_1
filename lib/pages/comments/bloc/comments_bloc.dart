import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/comment_model.dart';
import '../comments_repo.dart';

part 'comments_event.dart';
part 'comments_state.dart';


class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsState()) {
    on<CommentsFetched>(_onCommentsFetched);
  }

final CommentsRepository _repo = CommentsRepository();

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
