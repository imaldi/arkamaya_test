// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutScreen(),
      );
    },
    UserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserListScreen(),
      );
    },
    NewUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewUserScreen(),
      );
    },
    SingleUserRoute.name: (routeData) {
      final args = routeData.argsAs<SingleUserRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleUserScreen(
          args.id,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutScreen]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserListScreen]
class UserListRoute extends PageRouteInfo<void> {
  const UserListRoute({List<PageRouteInfo>? children})
      : super(
          UserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewUserScreen]
class NewUserRoute extends PageRouteInfo<void> {
  const NewUserRoute({List<PageRouteInfo>? children})
      : super(
          NewUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleUserScreen]
class SingleUserRoute extends PageRouteInfo<SingleUserRouteArgs> {
  SingleUserRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SingleUserRoute.name,
          args: SingleUserRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleUserRoute';

  static const PageInfo<SingleUserRouteArgs> page =
      PageInfo<SingleUserRouteArgs>(name);
}

class SingleUserRouteArgs {
  const SingleUserRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'SingleUserRouteArgs{id: $id, key: $key}';
  }
}
