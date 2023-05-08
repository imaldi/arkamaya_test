import 'package:arkamaya_test/core/route/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("List All User")),floatingActionButton: FloatingActionButton(onPressed: (){
      context.router.push(const SingleUserRoute());
    },
    child: Icon(Icons.list),
    ),);
  }
}
