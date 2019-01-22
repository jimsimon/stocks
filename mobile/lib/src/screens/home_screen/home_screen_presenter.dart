import 'package:flutter/material.dart';
import 'package:mobile/src/screens/home_screen/home_screen_vm.dart';
import 'package:mobile/src/widgets/accounts_dropdown_button/accounts_dropdown_button.dart';

class HomeScreenPresenter extends StatelessWidget {
  final HomeScreenViewModel viewModel;
  final String title;

  HomeScreenPresenter({
    Key key,
    @required this.title,
    @required this.viewModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: AccountsDropdownButton(),
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