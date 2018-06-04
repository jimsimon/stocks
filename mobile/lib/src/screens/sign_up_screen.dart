import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/sign_up_screen_state.dart';
import 'package:mobile/src/widgets/pin_entry.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

typedef void OnSuccess(BuildContext context);

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginScreenViewModel>(
      converter: (store) => new LoginScreenViewModel(store),
      builder: (context, viewModel) {
        return new Material(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(hintText: 'Email'),
                  onChanged: viewModel.setEmailState,
                ),
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(hintText: 'Password'),
                  onChanged: viewModel.setPasswordState,
                ),
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(hintText: 'Confirm Password'),
                  onChanged: viewModel.setConfirmedPasswordState,
                ),
                new FlatButton(
                  onPressed: viewModel.passwordConfirmed ? viewModel.onSignUp : null,
                  child: new Text('Sign Up'),
                ),
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

  LoginScreenViewModel(this.store);

  setEmailState(email) {
    store.dispatch(new SetEmailAction(email));
  }

  setPasswordState(password) {
    store.dispatch(new SetPasswordAction(password));
  }

  setConfirmedPasswordState(password) {
    store.dispatch(new SetConfirmedPasswordAction(password));
  }

  bool get passwordConfirmed =>
    store.state.screens.signUp.password ==
      store.state.screens.signUp.confirmedPassword;

  onSignUp() {
    store.dispatch(new AuthenticateUserAction(
      store.state.screens.signUp.email,
      store.state.screens.signUp.password
    ));
  }
}
