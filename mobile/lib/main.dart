import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:mobile/src/screens/lock_screen.dart';
import 'package:mobile/src/screens/login_screen.dart';
import 'package:mobile/src/screens/settings_screen.dart';
import 'package:mobile/src/store/middleware/service_middleware.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/screens/home_screen.dart';
import 'package:tastyworks_api_client/clients/vm_client.dart';
import 'package:tastyworks_api_client/services/session_service.dart';
import 'package:fluro/fluro.dart';
import 'dart:async';

final ApiClient client = VmClient();

final store = Store<AppState>(appStateReducer,
  initialState: AppState.initial(),
  middleware: [
    ServiceMiddleware({
      ApiClient: client,
      SessionService: SessionService(client)
    }),
    ThunkMiddleware<AppState>()
  ]);

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
  store.dispatch(SetBiometricAuthEnabled(prefs.getBool('biometricAuthEnabled') ?? false));
  runApp(StocksApp(store: store));
}

class StocksAppState extends State<StocksApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  final Router router = Router();
  final Store<AppState> store;
  Timer timer;
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
      if (store.state.session != null && !store.state.locked) {
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
      handlerFunc: (context, params) => LockScreen(onSuccess: unlockApp)));
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

  void unlockApp(BuildContext context) {
    store.dispatch(SetLockedAction(false));
    Navigator.of(context).pop();
  }
}

class StocksApp extends StatefulWidget {
  final Store store;

  const StocksApp({Key key, this.store}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StocksAppState(store);
}

class StocksAppViewModel {
  final Store<AppState> store;
  final BuildContext context;

  StocksAppViewModel(this.store, this.context);

  get session => store.state.session;

  get locked => store.state.locked;
}
