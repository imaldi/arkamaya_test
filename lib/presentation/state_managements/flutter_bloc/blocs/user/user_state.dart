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
class UserSuccessGetAll extends UserState {
  final List<User> userList;
  const UserSuccessGetAll({required this.userList});
  @override
  List<Object> get props => [userList];
}
class UserFailedGetAll extends UserState {
  @override
  List<Object> get props => [];
}
