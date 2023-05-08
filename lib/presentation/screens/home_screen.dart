import 'package:arkamaya_test/core/route/app_router.dart';
import 'package:arkamaya_test/data/models/user_response.dart';
import 'package:arkamaya_test/data/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_managements/flutter_bloc/blocs/user/user_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository: UserRepository())..add(GetAllUsers()),
      child: Scaffold(
        appBar: AppBar(title: Text("List All User")),
        body: BlocBuilder<UserBloc,UserState>(builder: (c,s){
          if(s is UserLoading) {
            return CircularProgressIndicator();
          }
          if(s is UserSuccessGetAll) {
            return Center(child: Text(s.userList.toString()),);
          }
          return Center(child: Text("No User Found"),);
        },),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(const SingleUserRoute());
          },
          child: Icon(Icons.list),
        ),
      ),
    );
  }
}
