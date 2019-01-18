import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/screens/login_screen/login_screen.dart';
import 'package:mobile/src/screens/login_screen/login_screen_presenter.dart';
import 'package:mobile/src/screens/login_screen/login_screen_vm.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

final localAuth = new LocalAuthentication();
final storage = new FlutterSecureStorage();

class LoginScreenState extends State<LoginScreen> with AfterLayoutMixin<LoginScreen> {
  final Store<AppState> store;

  LoginScreenState({
    @required this.store
  });

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
        return LoginScreenPresenter(viewModel: viewModel);
      });
  }
}