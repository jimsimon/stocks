import 'package:flutter/widgets.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/widgets/flutter_redux_lifecycle/flutter_redux_lifecycle.dart';
import 'package:redux/redux.dart';

class StocksAppViewModel implements StateChangeHandler {
  final Store<AppState> store;
  final BuildContext context;
  final GlobalKey<NavigatorState> navigatorKey;

  StocksAppViewModel(this.store, this.context, this.navigatorKey);

  get session => store.state.sessionState.session;

  get locked => store.state.locked;

  get biometricAuthEnabled => store.state.biometricAuthEnabled;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (session != null && !locked && biometricAuthEnabled) {
        store.dispatch(SetLockedAction(true));
        navigatorKey.currentState.pushNamed('/locked');
      }
    }
  }
}
