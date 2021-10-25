part of 'user_bloc.dart';

enum BlocStatus {initital, success ,failure}

 class UsersState extends Equatable {
  const UsersState({
this.status = BlocStatus.initital,
this.users = const <User>[],
  });
final BlocStatus status;
final List<User> users;
  
  UsersState copyWith({
    BlocStatus? status,
    List<User>? users
  }){
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users
    );
  }
  
  @override
  List<Object> get props => [status, users];
}


