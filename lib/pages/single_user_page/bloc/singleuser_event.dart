part of 'singleuser_bloc.dart';

abstract class SingleUserEvent extends Equatable {
  const SingleUserEvent();

  @override
  List<Object> get props => [];
}

class FetchUser extends SingleUserEvent{
  const FetchUser(this.id);
  final int id;
}