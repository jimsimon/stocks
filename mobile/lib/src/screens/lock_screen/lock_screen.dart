import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen_presenter.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen_vm.dart';
import 'package:mobile/src/store/app_state.dart';

typedef void OnSuccess(BuildContext context);

class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LockScreenViewModel>(
      onInitialBuild: showBiometricAuth,
      converter: (store) => new LockScreenViewModel(store, context),
      builder: (context, viewModel) {
        return LockScreenPresenter(
          viewModel: viewModel
        );
      });
  }

  void showBiometricAuth (LockScreenViewModel viewModel) async {
    if (viewModel.biometricAuthEnabled) {
      bool authenticated = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to unlock',
        stickyAuth: true);
      if (authenticated) {
        viewModel.unlockApp();
      } else {
        showBiometricAuth(viewModel);
      }
    }
  }
}
