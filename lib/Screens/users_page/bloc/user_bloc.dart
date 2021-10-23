import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Screens/users_page/utils/users_repo.dart';
import 'package:flutter_application_1/models/models.dart';


part 'user_event.dart';
part 'user_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState()) {
    on<UsersFetched>(_onFetchUsers);
  }

  final UsersRepository _repo = UsersRepository();


  Future<void> _onFetchUsers(UsersFetched event, Emitter<UsersState> emit)async{
     try{
       if(state.status == BlocStatus.initital){
          final List<User>? users = await _repo.fetchUsers();
          if(users != null){
          return emit(state.copyWith(
            status: BlocStatus.success,
            users: users
          ));}
       }
  
         final List<User>? users = await _repo.fetchUsers();
         if(users != null){
          return emit(state.copyWith(
            status: BlocStatus.success,
            users: users
          ));}

     }
     catch(_){
       emit(state.copyWith(status: BlocStatus.failure));
     }
  } 

}
