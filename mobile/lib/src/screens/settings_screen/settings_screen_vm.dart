import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAuth = new LocalAuthentication();

class SettingsScreenViewModel {
  final Store<AppState> store;
  final BuildContext context;

  SettingsScreenViewModel(this.store, this.context);

  get biometricsAvailable => localAuth.canCheckBiometrics;

  get biometricAuthEnabled => store.state.biometricAuthEnabled;

  onBiometricAuthenticationToggled(bool value) async {
    bool authenticated = false;
    try {
      authenticated = await localAuth
        .authenticateWithBiometrics(
        localizedReason: "Authenticate to confirm",
        stickyAuth: true);
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("biometricAuthEnabled", value);
      store.dispatch(SetBiometricAuthEnabled(value));
    }
  }
}
