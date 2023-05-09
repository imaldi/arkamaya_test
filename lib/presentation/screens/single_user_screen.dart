import 'package:arkamaya_test/presentation/state_managements/flutter_bloc/blocs/user/user_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_response.dart';
import '../widgets/user_tile.dart';

@RoutePage()
class SingleUserScreen extends StatefulWidget {
  final int id;
  const SingleUserScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (bc, s) {
      if (s is UserLoading) {
        return CircularProgressIndicator();
      }
      if (s is UserSuccessGetOne) {
        return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                UserTile(
                  user: s.userResponse.data ?? const User(),
                ),
                const Divider(),
                const Text("Support"),
                Text("${s.userResponse.support}"),
              ],
            ));
      }
      return Center(
        child: Text("User Not Found"),
      );
    });
  }
}
