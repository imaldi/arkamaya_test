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
      create: (context) => UserBloc(userRepository: UserRepository())..add(GetAllUsers()),
      child: Scaffold(
        appBar: AppBar(title: Text("List All User")),
        body: BlocBuilder<UserBloc,UserState>(builder: (c,s){
          if(s is UserLoading) {
            return CircularProgressIndicator();
          }
          if(s is UserSuccessGetAll) {
            return Padding(
              padding: EdgeInsets.all(16),
              child:
              ListView.builder(
                  itemCount: s.userList.length,
                  itemBuilder: (bc, index){
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
          return Center(child: Text("No User Found"),);
        },),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     context.router.push(const SingleUserRoute());
        //   },
        //   child: Icon(Icons.list),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new_rounded),
              label: 'Open Dialog',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            switch (index) {
              case 0:
              // only scroll to top when current index is selected.
                if (_selectedIndex == index) {
                  _homeController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                }
                break;
              case 1:
                context.router.push(const SingleUserRoute());
                // showModal(context);
                break;
            }
            setState(
                  () {
                _selectedIndex = index;
              },
            );
          },
        ),
      ),
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
