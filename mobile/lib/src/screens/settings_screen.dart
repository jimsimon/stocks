import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, SettingsScreenViewModel>(
        converter: (store) {
      return new SettingsScreenViewModel(store, context);
    }, builder: (context, SettingsScreenViewModel viewModel) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Settings'),
          ),
          body: new ListView(
            children: <Widget>[
              new ListTile(
                  title: new Text('Security',
                      style: Theme.of(context).primaryTextTheme.headline)),
              new ListTile(
                title: new Text('Enable PIN'),
                trailing: new Switch(value: false, onChanged: (value) {}),
              ),
              new ListTile(
                title: new Text('Set PIN'),
                enabled: false,
              ),
            ],
          ));
    });
  }
}

class SettingsScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  SettingsScreenViewModel(this.store, this.context);
}
