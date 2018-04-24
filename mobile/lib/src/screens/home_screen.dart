import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iex_trading_client/data_transfer_objects.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeScreenViewModel>(
        converter: (store) => new HomeScreenViewModel(store, context),
        builder: (context, viewModel) {
          return new Scaffold(
              appBar: new AppBar(
                title: new Text(title),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.search),
                      onPressed: viewModel.navigateToSearchSceen)
                ],
              ),
              drawer: new Drawer(
                  child: new ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                    new UserAccountsDrawerHeader(
                      accountName: new Text('Jim Simon'),
                      accountEmail: new Text('jim.j.simon@gmail.com'),
                      currentAccountPicture: new CircleAvatar(),
                    ),
                    new ListTile(
                      leading: new Icon(Icons.settings),
                      title: new Text('Settings'),
                      onTap: () {
                        Navigator.of(context).pushNamed('/settings');
                      },
                    ),
                  ])),
              body: buildBody(context, viewModel));
        });
  }

  Widget buildBody(BuildContext context, HomeScreenViewModel viewModel) {
    if (viewModel.favoriteSymbols.isEmpty) {
      return buildEmptyState(context, viewModel);
    } else {
      return buildFavoritesList(context, viewModel);
    }
  }

  Widget buildEmptyState(BuildContext context, HomeScreenViewModel viewModel) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child:
                new Text("You have no favorite stocks!", textScaleFactor: 1.5),
            margin: EdgeInsets.only(bottom: 16.0),
          ),
          new RaisedButton.icon(
            label: new Text("Add Favorites"),
            onPressed: viewModel.navigateToSearchSceen,
            icon: new Icon(Icons.add),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryTextTheme.title.color,
          )
        ],
      ),
    );
  }

  Widget buildFavoritesList(
      BuildContext context, HomeScreenViewModel viewModel) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('Favorites'),
          new Card(
              child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.favoriteSymbols.length,
                  itemBuilder: (buildContext, index) {
                    var stockSymbol =
                        viewModel.favoriteSymbols.values.elementAt(index);
                    var stockData = viewModel.stockData[stockSymbol.symbol];
                    return new ListTile(
                        title: new Text(stockSymbol.symbol),
                        trailing: buildStockPrice(stockData));
                  }))
        ]);
  }

  Widget buildStockPrice(StockData stockData) {
    if (stockData != null) {
      return new Text('\$' + stockData.quote.latestPrice.toStringAsFixed(2));
    }
    return new CircularProgressIndicator();
  }
}

class HomeScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  HomeScreenViewModel(this.store, this.context);

  navigateToSearchSceen() {
    store.dispatch(new NavigateAction(new Navigation(context, '/search')));
  }

  fetchStockData(int executionCount) {
    store.dispatch(new FetchFavoritesDataAction(favoriteSymbols));
  }

  Map<String, StockSymbol> get favoriteSymbols => store.state.favoriteSymbols;

  Map<String, StockData> get stockData => store.state.stockData;
}
