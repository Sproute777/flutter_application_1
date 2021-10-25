import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/models.dart';
import '../single_user_repo.dart';

part 'singleuser_event.dart';
part 'singleuser_state.dart';

class SingleUserBloc extends Bloc<SingleUserEvent, SingleUserState> {
  SingleUserBloc() : super(SingleUserState()) {
    on<FetchUser>(_onFetchUser);
    }
final SingleUserRepository _repo = SingleUserRepository();

    Future<void> _onFetchUser(FetchUser event, Emitter<SingleUserState> emit)async{
       try{
       if(state.status == UserStatus.initial){
          final User? user = await _repo.fetchUser(event.id);
          if(user != null){
          return emit(state.copyWith(
            status: UserStatus.success,
            user: user
          ));}
       }

          final User? user = await _repo.fetchUser(event.id);
          if(user != null){
          return emit(state.copyWith(
            status: UserStatus.success,
            user: user
          ));}
  
     }
     catch(_){
       emit(state.copyWith(status: UserStatus.failure));
     }
    }
}
