import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/screens/settings_screen/settings_screen_vm.dart';

final localAuth = new LocalAuthentication();

class SettingsScreenPresenter extends StatelessWidget {
  final SettingsScreenViewModel viewModel;

  const SettingsScreenPresenter({
    Key key,
    @required this.viewModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return SwitchListTile(
                  title: new Text('Enable Biometric Security'),
                  subtitle: new Text('Fingerprint or facial recognition'),
                  value: viewModel.biometricAuthEnabled,
                  onChanged: viewModel.onBiometricAuthenticationToggled,
                );
              } else {
                return SizedBox();
              }
            }
          ),
        ],
      ));
  }
}
