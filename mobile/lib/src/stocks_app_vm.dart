import 'package:flutter/widgets.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

class StocksAppViewModel {
  final Store<AppState> store;
  final BuildContext context;

  StocksAppViewModel(this.store, this.context);

  get session => store.state.session;

  get locked => store.state.locked;
}
