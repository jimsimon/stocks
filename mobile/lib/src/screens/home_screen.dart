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
              title: new Text(title),
              actions: <Widget>[
                new IconButton(
                      icon: new Icon(Icons.search), onPressed: viewModel.navigateToSearchSceen)
              ],
            ),
            drawer: new Drawer(),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Child content',
                  )
                ],
              ),
            ),
          );
        });
  }
}

class HomeScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  HomeScreenViewModel(this.store, this.context);

  navigateToSearchSceen() {
    store.dispatch(new NavigateAction(new Navigation(context, '/search')));
  }
}
