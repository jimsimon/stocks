import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/widgets/pin_entry.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

typedef void OnSuccess(BuildContext context);

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginScreenViewModel>(
        converter: (store) => new LoginScreenViewModel(store, context),
        builder: (context, viewModel) {
          return new Material(
              child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(hintText: 'Email'),
                ),
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(hintText: 'Password'),
                ),
                new Row(children: <Widget>[
                  new FlatButton(
                      onPressed: viewModel.onSignUp,
                      child: new Text('Sign Up')),
                  new FlatButton(
                      onPressed: viewModel.onLogin, child: new Text('Login')),
                ])
              ],
            ),
          ));
        });
  }

  Future<bool> onWillPop() async {
    return true;
  }
}

class LoginScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  LoginScreenViewModel(this.store, this.context);

  onLogin() {
    print('Login pressed');
  }

  onSignUp() {
    Navigator.of(context).pushNamed('/signUp');
  }
}
