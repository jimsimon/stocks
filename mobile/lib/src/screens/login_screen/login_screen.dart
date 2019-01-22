import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/screens/login_screen/login_screen_presenter.dart';
import 'package:mobile/src/screens/login_screen/login_screen_vm.dart';
import 'package:mobile/src/store/app_state.dart';

typedef void OnSuccess(BuildContext context);

final localAuth = new LocalAuthentication();
final storage = new FlutterSecureStorage();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginScreenViewModel>(
      onInitialBuild: showBiometricAuth,
      converter: (store) => LoginScreenViewModel(store, context),
      builder: (context, viewModel) {
        return LoginScreenPresenter(viewModel: viewModel);
      });
  }

  void showBiometricAuth(LoginScreenViewModel viewModel) async {
    final usernameOrEmail = await storage.read(key: 'usernameOrEmail');
    final password = await storage.read(key: 'password');
    if (viewModel.biometricAuthEnabled && usernameOrEmail != null && password != null) {
      bool authenticated = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        stickyAuth: true);
      if (authenticated) {
        viewModel.autoLogin(usernameOrEmail, password);
      }
    }
  }
}