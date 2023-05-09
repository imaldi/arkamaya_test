part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetAllUsers extends UserEvent {
  @override
  List<Object?> get props => [];
}

class GetOneUser extends UserEvent {
  final int id;
  const GetOneUser(this.id);
  @override
  List<Object?> get props => [id];
}

class CreateUser extends UserEvent {
  final String nama;
  final String job;
  const CreateUser({required this.nama, required this.job});
  @override
  List<Object?> get props => [nama, job];
}
