import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/screens/home_screen/home_screen_presenter.dart';
import 'package:mobile/src/screens/home_screen/home_screen_vm.dart';
import 'package:mobile/src/store/app_state.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeScreenViewModel>(
      onInitialBuild: handleInitialBuild,
      converter: (store) => HomeScreenViewModel(store, context),
      builder: (context, viewModel) {
        return HomeScreenPresenter(
          title: title,
          viewModel: viewModel,
        );
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

  void handleInitialBuild(HomeScreenViewModel viewModel) {
    viewModel.loadAccounts();
  }
}
