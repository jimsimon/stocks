import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAuth = new LocalAuthentication();

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
                style: Theme
                  .of(context)
                  .primaryTextTheme
                  .headline)),
            new FutureBuilder(
              future: viewModel.biometricsAvailable,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return ListTile(
                    title: new Text('Enable Biometric Security'),
                    subtitle: new Text('Fingerprint or facial recognition'),
                    trailing: new Switch(value: viewModel.biometricAuthEnabled, onChanged: viewModel.onBiometricAuthenticationToggled),
                  );
                } else {
                  return SizedBox();
                }
              }
            ),
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
