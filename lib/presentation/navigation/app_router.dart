import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:tasklet/presentation/screens/auth/auth_view.dart';
import 'package:tasklet/presentation/screens/charts/charts_view.dart';
import 'package:tasklet/presentation/screens/chats/chat/chat_view.dart';
import 'package:tasklet/presentation/screens/chats/chats_view.dart';
import 'package:tasklet/presentation/screens/dashboards/dashboards_view.dart';
import 'package:tasklet/presentation/screens/dashboards/widgets/task_view.dart';
import 'package:tasklet/presentation/screens/home/home_view.dart';
import 'package:tasklet/presentation/screens/root/root_view.dart';
import 'package:tasklet/presentation/screens/settings/settings_view.dart';

import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'View,Route,Widget',
  transitionsBuilder: fadeInTransition,
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthView,
      name: 'AuthViewRoute',
      path: 'login',
    ),
    AutoRoute(
      page: RootView,
      path: '/',
      initial: true,
      guards: [AuthGuard],
      children: <AutoRoute>[
        AutoRoute(
          page: HomeView,
          initial: true,
          path: 'home',
        ),
        AutoRoute(
          page: DashboardsView,
          path: 'dashboard',
        ),
        AutoRoute(
          page: ChartsView,
          path: 'charts',
        ),
        AutoRoute(
          page: TaskView,
          path: 'tasks/:id'
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ChatsRouter',
          path: 'chats',
          children: [
            AutoRoute(
              page: ChatsView,
              initial: true,
              path: 'all',
            ),
            AutoRoute(
              page: ChatView,
              path: ':id',
            )
          ],
        ),
        AutoRoute(
          page: SettingsView,
          path: 'settings',
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}

Widget fadeInTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(
      opacity: animation,
      child: child,
    );
