import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/screens/home_screen/home_screen.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen.dart';
import 'package:mobile/src/screens/login_screen/login_screen.dart';
import 'package:mobile/src/screens/settings_screen/settings_screen.dart';
import 'package:mobile/src/stocks_app.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import 'package:mobile/src/store/app_state.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final store = Store<AppState>(appStateReducer,
    initialState: AppState.initial(),
    middleware: [
      ThunkMiddleware<AppState>()
    ]);

  final Router router = Router();
  setupRouter(router);

  final prefs = await SharedPreferences.getInstance();
  store.dispatch(
    SetBiometricAuthEnabled(prefs.getBool('biometricAuthEnabled') ?? false));

  runApp(StocksApp(store: store, router: router));
}

setupRouter(Router router) {
  router.notFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
  router.define('/', handler: new Handler(
    handlerFunc: (context, params) => LoginScreen()));
  router.define('/locked', handler: new Handler(
    handlerFunc: (context, params) => LockScreen()));
  router.define('/home', handler: new Handler(
    handlerFunc: (context, params) => HomeScreen(title: 'Home')));
  router.define('/positions', handler: Handler(
    handlerFunc: (context, params) => HomeScreen(title: 'Positions')));
  router.define('/trade', handler: Handler(
    handlerFunc: (context, params) => HomeScreen(title: 'Trade')));
  router.define('/watchlist', handler: Handler(
    handlerFunc: (context, params) => HomeScreen(title: 'Watchlist')));
  router.define('/settings',
    handler: Handler(handlerFunc: (context, params) => SettingsScreen()));
}



