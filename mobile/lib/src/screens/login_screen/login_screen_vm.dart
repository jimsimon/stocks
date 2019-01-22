import 'package:flutter/material.dart';
import 'package:mobile/src/store/accounts_state.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/login_screen_state.dart';
import 'package:redux/redux.dart';

class LoginScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  LoginScreenViewModel(this.store, this.context);

  get errorMessage => store.state.screens.login.error;

  get biometricAuthEnabled => store.state.biometricAuthEnabled;

  handleUsernameOrEmailChange(String usernameOrEmail) {
    store.dispatch(SetUsernameOrEmailAction(usernameOrEmail));
  }

  handlePasswordChange(String password) {
    store.dispatch(SetPasswordAction(password));
  }

  handleLogin() async {
    var loginAction = LoginAction(
      context,
      store.state.screens.login.usernameOrEmail,
      store.state.screens.login.password
    );
    store.dispatch(loginAction);
    await loginAction.onComplete;

    var fetchAccountsAction = FetchAccountsAction(store.state.session);
    store.dispatch(fetchAccountsAction);
    await fetchAccountsAction.onComplete;

    store.dispatch(NavigateAction(Navigation(context, '/home', replace: true)));
  }

  void autoLogin(String usernameOrEmail, String password) {
    handleUsernameOrEmailChange(usernameOrEmail);
    handlePasswordChange(password);
    handleLogin();
  }
}
