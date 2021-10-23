part of 'singleuser_bloc.dart';

enum UserStatus{initial, success, failure}

 class SingleUserState extends Equatable {
 
  const SingleUserState({
    this.status = UserStatus.initial,
    this.user = User.empty,
  });
  final UserStatus status;
  final User user;

SingleUserState copyWith({
  UserStatus? status,
  User? user,
}){
  return SingleUserState(
    status: status ?? this.status,
    user: user ?? this.user
  );
}

  
  @override
  List<Object> get props => [status, user];
}


