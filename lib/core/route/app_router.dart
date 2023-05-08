import 'package:arkamaya_test/presentation/screens/single_user_screen.dart';
import 'package:auto_route/auto_route.dart';

import '../../presentation/screens/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: SingleUserRoute.page)
  ];
}
