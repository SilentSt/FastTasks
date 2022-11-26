import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/presentation/app/app.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';

class RootViewModel extends BaseViewModel {
  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.doc_checkmark,
    CupertinoIcons.chart_bar_square,
    CupertinoIcons.chat_bubble,
    CupertinoIcons.settings,
  ];

  final List<PageRouteInfo> routes = const [
    HomeViewRoute(),
    DashboardsViewRoute(),
    ChartsViewRoute(),
    ChatsRouter(),
    SettingsViewRoute(),
  ];

  int selectedPage = 0;
  bool navbarVisible = true;

  Future<void> onReady() async {
    if(App.router.currentUrl.contains('home')){
      selectedPage = 0;
    }
    else if(App.router.currentUrl.contains('dashboard')){
      selectedPage = 1;
    }
    else if(App.router.currentUrl.contains('charts')){
      selectedPage = 2;
    }
    else if(App.router.currentUrl.contains('chats')){
      selectedPage = 3;
    }
    else if(App.router.currentUrl.contains('settings')){
      selectedPage = 4;
    }
    else if(App.router.currentUrl.contains('tasks')){
      selectedPage = 1;
    }
  }

  void hideNavbar() {
    navbarVisible = false;
    notifyListeners();
  }

  void showNavbar() {
    navbarVisible = true;
    notifyListeners();
  }

  void animateToPage(int index) {
    App.router.replace(routes[index]);
    selectedPage = index;
    notifyListeners();
  }
}
