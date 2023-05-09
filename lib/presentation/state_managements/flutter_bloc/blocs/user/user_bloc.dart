import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models/user_response.dart';
import '../../../../../data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetAllUsers>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 3));
      var users = await userRepository.getAll();
      emit(UserSuccessGetAll(userList: users));
    });

    on<GetOneUser>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 3));
      var user = await userRepository.getOne(event.id);
      emit(UserSuccessGetOne(user: user));
    });

    on<CreateUser>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 3));
      var isSuccess = await userRepository.createUser(name: "name", job: "job");
      emit(const CreateUserSuccess());
    });
  }
}
