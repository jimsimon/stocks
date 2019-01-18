import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen_presenter.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen_vm.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

typedef void OnSuccess(BuildContext context);

class LockScreen extends StatefulWidget {
  final Store<AppState> store;

  LockScreen({
    @required this.store
  });

  @override
  LockScreenState createState() {
    return new LockScreenState(store: store);
  }
}

class LockScreenState extends State<LockScreen> with AfterLayoutMixin<LockScreen> {
  final Store<AppState> store;

  LockScreenState({
    @required this.store
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LockScreenViewModel>(
      converter: (store) => new LockScreenViewModel(store),
      builder: (context, viewModel) {
        return LockScreenPresenter(
          viewModel: viewModel
        );
      });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    showBiometricAuth(context);
  }

  void showBiometricAuth (BuildContext context) async {
    if (store.state.biometricAuthEnabled) {
      bool authenticated = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to unlock',
        stickyAuth: true);
      if (authenticated) {
        unlockApp(context);
      } else {
        showBiometricAuth(context);
      }
    }
  }

  void unlockApp(BuildContext context) {
    store.dispatch(SetLockedAction(false));
    Navigator.of(context).pop();
  }
}
