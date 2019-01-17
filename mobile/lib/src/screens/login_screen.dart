import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/login_screen_state.dart';
import 'package:redux/redux.dart';
import 'package:local_auth/local_auth.dart';
import 'package:after_layout/after_layout.dart';

typedef void OnSuccess(BuildContext context);

final localAuth = new LocalAuthentication();
final storage = new FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  final Store<AppState> store;
  const LoginScreen({Key key, this.store}) : super(key: key);

  @override
  LoginScreenState createState() {
    return new LoginScreenState(store);
  }
}

class LoginScreenState extends State<LoginScreen> with AfterLayoutMixin<LoginScreen> {
  final Store<AppState> store;

  LoginScreenState(this.store);

  @override
  void afterFirstLayout(BuildContext context) async {
    final usernameOrEmail = await storage.read(key: 'usernameOrEmail');
    final password = await storage.read(key: 'password');
    if (store.state.biometricAuthEnabled && usernameOrEmail != null && password != null) {
      bool authenticated = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        stickyAuth: true);
      if (authenticated) {
        store.dispatch(LoginAction(context, usernameOrEmail, password));
      }
    }
  }

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
                buildErrorMessage(viewModel, context),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Username or email address'),
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  autofocus: true,
                  onChanged: viewModel.handleUsernameOrEmailChange,
                ),
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(hintText: 'Password'),
                  onChanged: viewModel.handlePasswordChange,
                ),
                new FlatButton(
                  onPressed: viewModel.onLogin, child: new Text('Login')),
              ]..removeWhere((w) => w == null),
            ),
          ));
      });
  }

  Text buildErrorMessage(LoginScreenViewModel viewModel, BuildContext context) {
    if (viewModel.errorMessage == null) {
      return null;
    }

    return new Text(viewModel.errorMessage, style: TextStyle(color: Theme
                .of(context)
                .errorColor));
  }

  Future<bool> onWillPop() async {
    return true;
  }
}

class LoginScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  LoginScreenViewModel(this.store, this.context);

  get errorMessage => store.state.screens.login.error;

  handleUsernameOrEmailChange(String usernameOrEmail) {
    store.dispatch(SetUsernameOrEmailAction(usernameOrEmail));
  }

  handlePasswordChange(String password) {
    store.dispatch(SetPasswordAction(password));
  }

  onLogin() {
    store.dispatch(LoginAction(
      context,
      store.state.screens.login.usernameOrEmail,
      store.state.screens.login.password
    ));
  }
}
