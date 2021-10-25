import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/post_model.dart';
import '../posts_repo.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsFetched>(_onPostsFetched);
  }

final PostsRepository _repo = PostsRepository();

  void _onPostsFetched(PostsFetched event, Emitter<PostsState> emit) async{
     try{
       if(state.status == PostsStatus.initial){
          final List<Post>? posts = await _repo.fetchPosts(event.userId);
          if(posts != null){
          return emit(state.copyWith(
            status: PostsStatus.success,
            posts: posts
          ));}
       }
  
         final List<Post>? posts = await _repo.fetchPosts(event.userId);
          if(posts != null){
          return emit(state.copyWith(
            status: PostsStatus.success,
            posts: posts
          ));}

     }
     catch(_){
       emit(state.copyWith(status: PostsStatus.failure));
     }
  } 
  }

