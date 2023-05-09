import 'package:arkamaya_test/presentation/screens/single_user_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/about_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/new_user_screen.dart';
import '../../presentation/screens/user_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeRoute.page, initial: true, children: [
          AutoRoute(page: UserListRoute.page, initial: true),
          AutoRoute(page: NewUserRoute.page),
          AutoRoute(page: AboutRoute.page),
        ]),
        AutoRoute(page: SingleUserRoute.page),
      ];
}
