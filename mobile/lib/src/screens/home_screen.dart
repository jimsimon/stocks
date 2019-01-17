import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
                automaticallyImplyLeading: false,
                title: new Text(title),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/settings');
                      })
                ],
              ),
              body: buildBody(context, viewModel),
              bottomNavigationBar: new BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home')
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.watch),
                    title: Text('Watchlist')
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    title: Text('Positions')
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    title: Text('Trade')
                  ),
                ],
                currentIndex: currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: viewModel.handleBottomNavigationTap
              ));
        });
  }

  Widget buildBody(BuildContext context, HomeScreenViewModel viewModel) {
    return buildEmptyState(context, viewModel);
  }

  Widget buildEmptyState(BuildContext context, HomeScreenViewModel viewModel) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child:
                new Text("Nothing here yet", textScaleFactor: 1.5),
            margin: EdgeInsets.only(bottom: 16.0),
          ),
        ],
      ),
    );
  }

  get currentIndex {
    return ['Home', 'Watchlist', 'Positions', 'Trade'].indexOf(title);
  }
}

class HomeScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  HomeScreenViewModel(this.store, this.context);

//  navigateToSearchSceen() {
//    store.dispatch(new NavigateAction(new Navigation(context, '/search')));
//  }

//  fetchStockData(int executionCount) {
//    store.dispatch(new FetchFavoritesDataAction(favoriteSymbols));
//  }

//  Map<String, StockSymbol> get favoriteSymbols => store.state.favoriteSymbols;
//
//  Map<String, StockData> get stockData => store.state.stockData;

  void handleBottomNavigationTap(int value) {
    var route;
    if (value == 0) {
      route = '/home';
    } else if (value == 1) {
      route = '/watchlist';
    } else if (value == 2) {
      route = '/positions';
    } else if (value == 3) {
      route = '/trade';
    }

    if (route != null) {
      store.dispatch(NavigateAction(Navigation(context, route)));
    }
  }
}
