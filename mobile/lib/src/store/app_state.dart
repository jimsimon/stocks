import 'package:flutter/material.dart';
import 'package:mobile/src/store/middleware/iex_client_middleware.dart';
import 'package:mobile/src/store/screen_state.dart';
import 'package:redux/redux.dart';
import 'package:iex_trading_client/data_transfer_objects.dart';

class AppState {
  final ScreenState screens;
  final String currentRoute;
  final List<StockSymbol> symbols;
  final Map<String, StockSymbol> favoriteSymbols;
  final Map<String, StockData> stockData;
  final List<int> lockCode = [1,2,3,4];

  AppState(
      {this.screens,
      this.currentRoute = '/',
      this.symbols = const <StockSymbol>[],
      this.favoriteSymbols = const <String, StockSymbol>{},
      this.stockData = const <String, StockData>{}});

  factory AppState.initial() =>
      new AppState(symbols: [], screens: new ScreenState.initial());

  AppState copyWith(
      {screens, currentRoute, symbols, favoriteSymbols, stockData}) {
    return new AppState(
        screens: screens ?? this.screens,
        currentRoute: currentRoute ?? this.currentRoute,
        symbols: symbols ?? this.symbols,
        favoriteSymbols: favoriteSymbols ?? this.favoriteSymbols,
        stockData: stockData ?? this.stockData);
  }
}

class Navigation {
  final BuildContext context;
  final String route;

  Navigation(this.context, this.route);
}

AppState appStateReducer(AppState state, action) {
  return new AppState(
      screens: new TypedReducer<ScreenState, dynamic>(screenStateReducer)(
          state.screens, action),
      currentRoute: new TypedReducer<String, NavigateAction>(navigate)(
          state.currentRoute, action),
      symbols: new TypedReducer<List<StockSymbol>, FetchSymbolsSuccessAction>(
          storeSymbols)(state.symbols, action),
      favoriteSymbols: new TypedReducer<Map<String, StockSymbol>, ToggleFavoriteStockSymbol>(
        toggleFavorite)(state.favoriteSymbols, action),
      stockData: new TypedReducer<Map<String, StockData>,
              FetchFavoritesDataSuccessAction>(storeStockData)(
          state.stockData, action));
}

String navigate(String state, NavigateAction action) {
  Navigator.of(action.navigation.context).pushNamed(action.navigation.route);
  return action.navigation.route;
}

List<StockSymbol> storeSymbols(
    List<StockSymbol> state, FetchSymbolsSuccessAction action) {
  return action.symbols;
}

Map<String, StockData> storeStockData(
    Map<String, StockData> state, FetchFavoritesDataSuccessAction action) {
  return action.stockDataMap;
}

Map<String, StockSymbol> toggleFavorite(
    Map<String, StockSymbol> state, ToggleFavoriteStockSymbol action) {
  var newState = new Map<String, StockSymbol>.from(state);
  if (newState.containsKey(action.payload.symbol)) {
    newState.remove(action.payload.symbol);
  } else {
    newState[action.payload.symbol] = action.payload;
  }
  return newState;
}

class IncrementCounterAction {}

class NavigateAction {
  final Navigation navigation;

  NavigateAction(this.navigation);
}

class ToggleFavoriteStockSymbol {
  final StockSymbol payload;

  ToggleFavoriteStockSymbol(this.payload);
}

class FetchFavoritesDataAction
    extends IexClientRequestAction<Map<String, StockData>> {
  final Map<String, StockSymbol> favorites;

  FetchFavoritesDataAction(this.favorites);

  @override
  RequestFunction<Map<String, StockData>> get request =>
      (client) async => await client.getBatchStockData(favorites.keys.toList());

  @override
  get successAction => (Map<String, StockData> stockDataMap) =>
      new FetchFavoritesDataSuccessAction(stockDataMap);

  @override
  get errorAction => null;
}

class FetchFavoritesDataSuccessAction {
  final Map<String, StockData> stockDataMap;

  FetchFavoritesDataSuccessAction(this.stockDataMap);
}

class FetchSymbolsAction extends IexClientRequestAction<List<StockSymbol>> {
  @override
  RequestFunction<List<StockSymbol>> get request =>
      (client) async => await client.getSymbols();

  @override
  get successAction =>
      (List<StockSymbol> symbols) => new FetchSymbolsSuccessAction(symbols);

  @override
  get errorAction => null;
}

class FetchSymbolsSuccessAction {
  final List<StockSymbol> symbols;

  FetchSymbolsSuccessAction(this.symbols);
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
