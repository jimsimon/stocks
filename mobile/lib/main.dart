import 'package:flutter/material.dart';
import 'package:mobile/src/screens/search_screen.dart';
import 'package:mobile/src/store/middleware/iex_client_middleware.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/screens/home_screen.dart';
import 'package:iex_trading_client/vm_client.dart';

final store =
    new Store<AppState>(
        appStateReducer,
        initialState: new AppState.initial(),
      middleware: [
        new IexClientMiddleware(new VmClient())
      ]
    );

void main() => runApp(new StocksApp(store: store));

class StocksApp extends StatelessWidget {
  final Store<AppState> store;

  const StocksApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
          title: 'Stocks App',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (_) => new HomeScreen(title: 'Stocks App'),
            '/search': (_) => new SearchScreen(store)
          }
        ));
  }
}
