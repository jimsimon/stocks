import 'package:flutter/material.dart';
import 'package:mobile/src/store/middleware/iex_client_middleware.dart';
import 'package:mobile/src/store/util/fsa.dart';
import 'package:redux/redux.dart';
import 'package:iex_trading_client/data_transfer_objects.dart';

class AppState {
  final ScreenState screens;
  final String currentRoute;
  final List<StockSymbol> symbols;

  AppState(
      {this.screens,
      this.currentRoute = '/',
      this.symbols = const <StockSymbol>[]});

  factory AppState.initial() => new AppState(
      symbols: [], screens: new ScreenState.initial());

  AppState copyWith(
      {screens, loading, count, currentRoute, symbols, symbolSearchTerm}) {
    return new AppState(
        screens: screens ?? this.screens,
        currentRoute: currentRoute ?? this.currentRoute,
        symbols: symbols ?? this.symbols);
  }
}

class ScreenState {
  final SearchScreenState search;

  ScreenState({this.search});

  factory ScreenState.initial() => new ScreenState(search: new SearchScreenState());
}

class SearchScreenState {
  final String searchTerm;

  SearchScreenState({this.searchTerm = ''});

  SearchScreenState copyWith({searchTerm}) {
    return new SearchScreenState(
      searchTerm: searchTerm ?? this.searchTerm
    );
  }
}

class Navigation {
  final BuildContext context;
  final String route;

  Navigation(this.context, this.route);
}

AppState appStateReducer(AppState state, action) {
  return new AppState(
    screens: new TypedReducer<ScreenState, dynamic>(screenStateReducer)(state.screens, action),
    currentRoute: new TypedReducer<String, NavigateAction>(navigate)(state.currentRoute, action),
    symbols: new TypedReducer<List<StockSymbol>, FetchSymbolsSuccessAction>(storeSymbols)(state.symbols, action)
  );
}

ScreenState screenStateReducer(ScreenState state, action) {
  return new ScreenState(
    search: new TypedReducer<SearchScreenState, dynamic>(searchScreenReducer)(state.search, action)
  );
}

SearchScreenState searchScreenReducer(SearchScreenState state, action) {
  return new SearchScreenState(
    searchTerm: new TypedReducer<String, SetSymbolSearchTermAction>(storeSymbolSearchTerm)(state.searchTerm, action)
  );
}

String navigate(String state, NavigateAction action) {
  Navigator.of(action.payload.context).pushNamed(action.payload.route);
  return action.payload.route;
}

List<StockSymbol> storeSymbols(List<StockSymbol> state, FetchSymbolsSuccessAction action) {
  return action.payload;
}

String storeSymbolSearchTerm(
    String state, SetSymbolSearchTermAction action) {
  return action.payload;
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
  FetchSymbolsAction()
      : super(new IexClientRequest<List<StockSymbol>>(
            (client) async => await client.getSymbols(),
            successAction: (List<StockSymbol> symbols) =>
                new FetchSymbolsSuccessAction(symbols)));
}

class FetchSymbolsSuccessAction extends FluxStandardAction<List<StockSymbol>> {
  FetchSymbolsSuccessAction(symbols) : super(payload: symbols);
}

List<StockSymbol> stockSymbolSearchSelector(AppState state) {
  var searchTerm = state.screens.search.searchTerm.toLowerCase();
  if (searchTerm == null || searchTerm.isEmpty) {
    return [];
  }
  return state.symbols
      .where((s) =>
          s.name.toLowerCase().startsWith(searchTerm) ||
          s.symbol.toLowerCase().startsWith(searchTerm))
      .toList();
}
