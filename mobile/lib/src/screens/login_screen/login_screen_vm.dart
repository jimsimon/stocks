import 'package:flutter/material.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/login_screen_state.dart';
import 'package:redux/redux.dart';

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
