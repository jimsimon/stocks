import 'package:flutter/widgets.dart';
import 'package:mobile/src/stocks_app_state.dart';
import 'package:redux/redux.dart';

class StocksApp extends StatefulWidget {
  final Store store;

  const StocksApp({Key key, this.store}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StocksAppState(store);
}