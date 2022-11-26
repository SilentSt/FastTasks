// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AuthView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RootViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RootView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardsViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DashboardsView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChartsViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ChartsView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TaskViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TaskViewRouteArgs>(
          orElse: () => TaskViewRouteArgs(id: pathParams.getString('id')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: TaskView(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ChatsView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatViewRouteArgs>(
          orElse: () => ChatViewRouteArgs(id: pathParams.getString('id')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ChatView(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthViewRoute.name,
          path: 'login',
        ),
        RouteConfig(
          RootViewRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: RootViewRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeViewRoute.name,
              path: 'home',
              parent: RootViewRoute.name,
            ),
            RouteConfig(
              DashboardsViewRoute.name,
              path: 'dashboard',
              parent: RootViewRoute.name,
            ),
            RouteConfig(
              ChartsViewRoute.name,
              path: 'charts',
              parent: RootViewRoute.name,
            ),
            RouteConfig(
              TaskViewRoute.name,
              path: 'tasks/:id',
              parent: RootViewRoute.name,
            ),
            RouteConfig(
              ChatsRouter.name,
              path: 'chats',
              parent: RootViewRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ChatsRouter.name,
                  redirectTo: 'all',
                  fullMatch: true,
                ),
                RouteConfig(
                  ChatsViewRoute.name,
                  path: 'all',
                  parent: ChatsRouter.name,
                ),
                RouteConfig(
                  ChatViewRoute.name,
                  path: ':id',
                  parent: ChatsRouter.name,
                ),
              ],
            ),
            RouteConfig(
              SettingsViewRoute.name,
              path: 'settings',
              parent: RootViewRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [AuthView]
class AuthViewRoute extends PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: 'login',
        );

  static const String name = 'AuthViewRoute';
}

/// generated route for
/// [RootView]
class RootViewRoute extends PageRouteInfo<void> {
  const RootViewRoute({List<PageRouteInfo>? children})
      : super(
          RootViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootViewRoute';
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [DashboardsView]
class DashboardsViewRoute extends PageRouteInfo<void> {
  const DashboardsViewRoute()
      : super(
          DashboardsViewRoute.name,
          path: 'dashboard',
        );

  static const String name = 'DashboardsViewRoute';
}

/// generated route for
/// [ChartsView]
class ChartsViewRoute extends PageRouteInfo<void> {
  const ChartsViewRoute()
      : super(
          ChartsViewRoute.name,
          path: 'charts',
        );

  static const String name = 'ChartsViewRoute';
}

/// generated route for
/// [TaskView]
class TaskViewRoute extends PageRouteInfo<TaskViewRouteArgs> {
  TaskViewRoute({
    Key? key,
    required String id,
  }) : super(
          TaskViewRoute.name,
          path: 'tasks/:id',
          args: TaskViewRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'TaskViewRoute';
}

class TaskViewRouteArgs {
  const TaskViewRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'TaskViewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class ChatsRouter extends PageRouteInfo<void> {
  const ChatsRouter({List<PageRouteInfo>? children})
      : super(
          ChatsRouter.name,
          path: 'chats',
          initialChildren: children,
        );

  static const String name = 'ChatsRouter';
}

/// generated route for
/// [SettingsView]
class SettingsViewRoute extends PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(
          SettingsViewRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsViewRoute';
}

/// generated route for
/// [ChatsView]
class ChatsViewRoute extends PageRouteInfo<void> {
  const ChatsViewRoute()
      : super(
          ChatsViewRoute.name,
          path: 'all',
        );

  static const String name = 'ChatsViewRoute';
}

/// generated route for
/// [ChatView]
class ChatViewRoute extends PageRouteInfo<ChatViewRouteArgs> {
  ChatViewRoute({
    Key? key,
    required String id,
  }) : super(
          ChatViewRoute.name,
          path: ':id',
          args: ChatViewRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'ChatViewRoute';
}

class ChatViewRouteArgs {
  const ChatViewRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'ChatViewRouteArgs{key: $key, id: $id}';
  }
}
