import 'package:arkamaya_test/core/route/app_router.dart';
import 'package:arkamaya_test/data/models/user_response.dart';
import 'package:arkamaya_test/data/repositories/user_repository.dart';
import 'package:arkamaya_test/presentation/widgets/user_tile.dart';
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
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) =>
          UserBloc(userRepository: UserRepository())..add(GetAllUsers()),
      child: AutoTabsRouter.pageView(
          routes: const [
            UserListRoute(),
            NewUserRoute(),
            AboutRoute(),
          ],
          builder: (context, child, _) {
            final tabsRouter = AutoTabsRouter.of(context);
            var appBarTitle = "";
            switch (tabsRouter.activeIndex) {
              case 0:
                appBarTitle = "User List";
                break;
              case 1:
                appBarTitle = "Add User";
                break;
              case 2:
                appBarTitle = "About";
                break;
              default:
                "";
                break;
            }
            return Scaffold(
              appBar: AppBar(title: Text(appBarTitle)),
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: 'Users',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'New',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'About',
                  ),
                ],
              ),
            );
          }),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
