part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UserInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UsersState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UsersState {
  final List<UserEntity> users;

  UserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UserFailure extends UsersState {
  @override
  List<Object> get props => [];
}
