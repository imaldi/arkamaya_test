part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class CreateUserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserSuccessGetAll extends UserState {
  final List<User> userList;
  const UserSuccessGetAll({required this.userList});
  @override
  List<Object> get props => [userList];
}

class UserFailedGetAll extends UserState {
  final String errorMessage;
  const UserFailedGetAll(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class UserSuccessGetOne extends UserState {
  final SingleUserResponse userResponse;
  const UserSuccessGetOne({required this.userResponse});
  @override
  List<Object> get props => [userResponse];
}

class UserFailedGetOne extends UserState {
  final String errorMessage;
  const UserFailedGetOne(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class CreateUserSuccess extends UserState {
  final CreateUserResponse createUserResponse;
  const CreateUserSuccess(this.createUserResponse);
  @override
  List<Object> get props => [createUserResponse];
}

class CreateUserFailed extends UserState {
  final String errorMessage;
  const CreateUserFailed(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
