import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/screens/lock_screen.dart';
import 'package:mobile/src/widgets/pin_entry.dart';
import 'package:mobile/src/screens/search_screen.dart';
import 'package:mobile/src/screens/settings_screen.dart';
import 'package:mobile/src/store/middleware/iex_client_middleware.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/screens/home_screen.dart';
import 'package:iex_trading_client/vm_client.dart';
import 'dart:async';

final store = new Store<AppState>(appStateReducer,
    initialState: new AppState.initial(),
    middleware: [new IexClientMiddleware(new VmClient())]);

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(new StocksApp(store: store));
}

class StocksAppState extends State<StocksApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  final Store<AppState> store;
  Timer timer;
  bool locked;

  StocksAppState(this.store);

  @override
  void initState() {
    super.initState();
    locked = false;
    WidgetsBinding.instance.addObserver(this);
    createTimer();
  }

  @override
  void dispose() {
    destroyTimer();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      destroyTimer();
    } else if (state == AppLifecycleState.resumed) {
      if (!locked) {
        navigatorKey.currentState.pushNamed('/lock_screen');
        setState(() {
          locked = true;
        });
      }
      createTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
            title: 'Stocks App',
            theme: new ThemeData.dark(),
            navigatorKey: navigatorKey,
            routes: {
              '/': (_) => new HomeScreen(title: 'Stocks App'),
              '/search': (_) => new SearchScreen(store),
              '/settings': (_) => new SettingsScreen(),
              '/lock_screen': (context) => new LockScreen(onSuccess: unlockApp(context))
            }));
  }

  Function unlockApp(BuildContext context) {
    return () {
      setState(() {
        locked = false;
      });
      Navigator.of(context).pop();
    };
  }

  void createTimer() {
    if (timer == null) {
      timer = new Timer.periodic(new Duration(seconds: 3), (Timer timer) {
        if (store.state.favoriteSymbols.isNotEmpty) {
          store.dispatch(
              new FetchFavoritesDataAction(store.state.favoriteSymbols));
        }
      });
    }
  }

  void destroyTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }
}

class StocksApp extends StatefulWidget {
  final Store store;

  const StocksApp({Key key, this.store}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new StocksAppState(store);
}
