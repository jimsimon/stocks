import 'package:flutter/material.dart';
import 'package:mobile/src/store/middleware/iex_client_middleware.dart';
import 'package:mobile/src/store/util/fsa.dart';
import 'package:redux/redux.dart';
import 'package:iex_trading_client/data_transfer_objects.dart';

class AppState {
  final bool loading;
  final int count;
  final String currentRoute;
  final List<StockSymbol> symbols;
  final String symbolSearchTerm;

  AppState({
    this.loading = false,
    this.count = 0,
    this.currentRoute = '/',
    this.symbols = const <StockSymbol>[],
    this.symbolSearchTerm = ''
  });

  factory AppState.initial() => new AppState(loading: true, symbols: []);

  AppState copyWith({
    loading,
    count,
    currentRoute,
    symbols,
    symbolSearchTerm
  }) {
    return new AppState(
      loading: loading ?? this.loading,
      count: count ?? this.count,
      currentRoute: currentRoute ?? this.currentRoute,
      symbols: symbols ?? this.symbols,
      symbolSearchTerm: symbolSearchTerm ?? this.symbolSearchTerm
    );
  }
}

class Navigation {
  final BuildContext context;
  final String route;

  Navigation(this.context, this.route);
}

final appStateReducer = combineReducers<AppState>([
  new TypedReducer<AppState, IncrementCounterAction>(incrementCount),
  new TypedReducer<AppState, NavigateAction>(navigate),
  new TypedReducer<AppState, FetchSymbolsSuccessAction>(storeSymbols),
  new TypedReducer<AppState, SetSymbolSearchTermAction>(storeSymbolSearchTerm)
]);

AppState incrementCount(AppState state, IncrementCounterAction action) {
  return state.copyWith(count: state.count + 1);
}

AppState navigate(AppState state, NavigateAction action) {
  Navigator.of(action.payload.context).pushNamed(action.payload.route);
  return state.copyWith(currentRoute: action.payload.route);
}

AppState storeSymbols(AppState state, FetchSymbolsSuccessAction action) {
  return state.copyWith(symbols: action.payload);
}

AppState storeSymbolSearchTerm(AppState state, SetSymbolSearchTermAction action) {
  return state.copyWith(symbolSearchTerm: action.payload);
}

class IncrementCounterAction extends FluxStandardAction {
  IncrementCounterAction() : super();
}

class NavigateAction extends FluxStandardAction<Navigation> {
  NavigateAction(Navigation payload) : super(payload: payload);
}

class SetSymbolSearchTermAction extends FluxStandardAction<String> {
  SetSymbolSearchTermAction(String payload) : super(payload: payload);
}

class FetchSymbolsAction extends IexClientRequestAction {
  FetchSymbolsAction() : super(new IexClientRequest<List<StockSymbol>>(
      (client) async => await client.getSymbols(),
      successAction: (List<StockSymbol> symbols) => new FetchSymbolsSuccessAction(symbols)
    )
  );
}

class FetchSymbolsSuccessAction extends FluxStandardAction<List<StockSymbol>> {
  FetchSymbolsSuccessAction(symbols) : super(payload: symbols);
}

List<StockSymbol> stockSymbolSearchSelector(AppState state) {
  var searchTerm = state.symbolSearchTerm.toLowerCase();
  if (searchTerm == null || searchTerm.isEmpty) {
    return [];
  }
  return state.symbols.where((s) => s.name.toLowerCase().startsWith(searchTerm) || s.symbol.toLowerCase().startsWith(searchTerm)).toList();
}