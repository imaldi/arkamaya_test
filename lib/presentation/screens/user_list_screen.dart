import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_managements/flutter_bloc/blocs/user/user_bloc.dart';
import '../widgets/user_tile.dart';

@RoutePage()
class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (c, s) {
        if (s is UserLoading) {
          return CircularProgressIndicator();
        }
        if (s is UserSuccessGetAll) {
          return Padding(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                  itemCount: s.userList.length,
                  itemBuilder: (bc, index) {
                    return UserTile(user: s.userList[index]);
                  })
              //   Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(s.userList.toString()),
              //     UserTile(user: s.userList.first)
              //   ],
              // ),
              );
        }
        return Center(
          child: Text("No User Found"),
        );
      },
    );
  }
}
