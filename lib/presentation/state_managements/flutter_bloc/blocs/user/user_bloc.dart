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
      var futureResult = await userRepository.getAll();
      var newState = futureResult.fold(
          (l) => const UserFailedGetAll("There is an Error"),
          (r) => UserSuccessGetAll(userList: r));
      emit(newState);
    });

    on<GetOneUser>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 3));
      var futureResult = await userRepository.getOne(event.id);
      var newState = futureResult.fold(
          (l) => const UserFailedGetOne("There is an Error"),
          (r) => UserSuccessGetOne(userResponse: r));
      emit(newState);
    });

    on<CreateUser>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 3));
      var futureResult =
          await userRepository.createUser(name: "name", job: "job");
      var newState = futureResult.fold(
          (l) => const CreateUserFailed("There is an error"),
          (r) => const CreateUserSuccess());
      emit(newState);
    });
  }
}
