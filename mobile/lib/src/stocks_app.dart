import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/stocks_app_vm.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/widgets/flutter_redux_lifecycle/flutter_redux_lifecycle.dart';
import 'package:redux/redux.dart';

class StocksApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final Store<AppState> store;
  final Router router;

  StocksApp({
    @required this.store,
    @required this.router
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, StocksAppViewModel>(
        converter: (store) => new StocksAppViewModel(store, context, navigatorKey),
        builder: (BuildContext context, StocksAppViewModel viewModel) {
          return AppLifecycleHelper<StocksAppViewModel>(
            vm: viewModel,
            child: MaterialApp(
              title: 'Stocks App',
              theme: ThemeData.dark(),
              navigatorKey: navigatorKey,
              onGenerateRoute: router.generator
            )
          );
        }
      )
    );
  }
}