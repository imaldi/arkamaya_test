import 'package:arkamaya_test/core/resources/consts/sizes.dart';
import 'package:arkamaya_test/presentation/state_managements/flutter_bloc/blocs/user/user_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_response.dart';
import '../../data/repositories/user_repository.dart';
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
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository: UserRepository())
        ..add(GetOneUser(widget.id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Detail"),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<UserBloc, UserState>(builder: (bc, s) {
            if (s is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (s is UserSuccessGetOne) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      UserTile(
                        user: s.userResponse.data ?? const User(),
                      ),
                      const Divider(),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Support",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: sizeBig),
                        ),
                      ),
                      Text("${s.userResponse.support?.text}"),
                    ],
                  ));
            }
            return const Center(
              child: Text("User Not Found"),
            );
          }),
        ),
      ),
    );
  }
}
