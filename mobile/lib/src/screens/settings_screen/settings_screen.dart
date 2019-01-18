import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/screens/settings_screen/settings_screen_presenter.dart';
import 'package:mobile/src/screens/settings_screen/settings_screen_vm.dart';
import 'package:mobile/src/store/app_state.dart';

final localAuth = new LocalAuthentication();

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, SettingsScreenViewModel>(
      converter: (store) {
        return new SettingsScreenViewModel(store, context);
      }, builder: (context, SettingsScreenViewModel viewModel) {
      return SettingsScreenPresenter(viewModel: viewModel);
    });
  }
}
