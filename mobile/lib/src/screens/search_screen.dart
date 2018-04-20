import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'dart:async';

class SearchScreen extends StatelessWidget {
  SearchScreen(Store store) {
    store.dispatch(new FetchSymbolsAction());
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, SearchScreenViewModel>(
        converter: (store) {
      return new SearchScreenViewModel(store, context);
    }, builder: (context, SearchScreenViewModel viewModel) {
      return new WillPopScope(
          onWillPop: viewModel.onBackPressed,
          child: new Scaffold(
              appBar: new AppBar(
                  title: new TextField(
                      decoration:
                          new InputDecoration(hintText: 'Search stocks'),
                      onChanged: viewModel.onSearchTermChanged)),
              body: new ListView.builder(
                  itemCount: viewModel.stockSymbols.length,
                  itemBuilder: (buildContext, index) {
                    var stockSymbol = viewModel.stockSymbols[index];
                    return new ListTile(
                        title: new Text(stockSymbol.name),
                        subtitle: new Text(stockSymbol.symbol),
                        trailing: new IconButton(
                            icon: new Icon(Icons.add_circle_outline),
                            onPressed: () => {}));
                  })));
    });
  }
}

class SearchScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  SearchScreenViewModel(this.store, this.context);

  onSearchTermChanged(String searchTerm) {
    store.dispatch(new SetSymbolSearchTermAction(searchTerm));
  }

  Future<bool> onBackPressed() async {
    store.dispatch(new SetSymbolSearchTermAction(''));
    return true;
  }

  get searchTerm => store.state.symbolSearchTerm;

  get stockSymbols => stockSymbolSearchSelector(store.state);
}
