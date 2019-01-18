import 'package:flutter/widgets.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

class HomeScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  HomeScreenViewModel(this.store, this.context);

  void handleBottomNavigationTap(int value) {
    var route;
    if (value == 0) {
      route = '/home';
    } else if (value == 1) {
      route = '/watchlist';
    } else if (value == 2) {
      route = '/positions';
    } else if (value == 3) {
      route = '/trade';
    }

    if (route != null) {
      store.dispatch(NavigateAction(Navigation(context, route)));
    }
  }
}