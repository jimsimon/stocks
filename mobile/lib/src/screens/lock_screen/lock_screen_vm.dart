import 'package:flutter/widgets.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

class LockScreenViewModel {
  final Store<AppState> store;

  LockScreenViewModel(this.store);

  get lockCode => store.state.lockCode;

  void unlockApp(BuildContext context) {
    store.dispatch(SetLockedAction(false));
    Navigator.of(context).pop();
  }
}
