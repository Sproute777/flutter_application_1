part of 'user_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}


class UsersFetched extends UsersEvent{}