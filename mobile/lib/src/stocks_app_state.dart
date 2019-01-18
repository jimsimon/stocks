import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/screens/home_screen/home_screen.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen.dart';
import 'package:mobile/src/screens/login_screen/login_screen.dart';
import 'package:mobile/src/screens/settings_screen/settings_screen.dart';
import 'package:mobile/src/stocks_app.dart';
import 'package:mobile/src/stocks_app_vm.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

class StocksAppState extends State<StocksApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  final Router router = Router();
  final Store<AppState> store;
  bool locked;

  StocksAppState(this.store) {
    setupRouter(router);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (store.state.session != null && !store.state.locked && store.state.biometricAuthEnabled) {
        store.dispatch(SetLockedAction(true));
        navigatorKey.currentState.pushNamed('/locked');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, StocksAppViewModel>(
        converter: (store) => new StocksAppViewModel(store, context),
        builder: (BuildContext context, StocksAppViewModel viewModel) {
          return MaterialApp(
            title: 'Stocks App',
            theme: ThemeData.dark(),
            navigatorKey: navigatorKey,
            onGenerateRoute: router.generator
          );
        }
      )
    );
  }

  setupRouter(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
      });
    router.define('/', handler: new Handler(
      handlerFunc: (context, params) => LoginScreen(store: store)));
    router.define('/locked', handler: new Handler(
      handlerFunc: (context, params) => LockScreen(store: store)));
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
}