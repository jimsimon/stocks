import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/widgets/pin_entry.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

typedef void OnSuccess(BuildContext context);

class LockScreen extends StatelessWidget {
  final OnSuccess onSuccess;

  const LockScreen({Key key, this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LockScreenViewModel>(
        converter: (store) => new LockScreenViewModel(store),
        builder: (context, viewModel) {
          return new WillPopScope(
            onWillPop: onWillPop,
            child: new PinEntry(
                title: 'Enter PIN',
                pinSize: 4,
                onCodeEntered: (List<int> digits) {
                  for (var i = 0; i < digits.length; i++) {
                    if (digits[i] != viewModel.lockCode[i]) {
                      return false;
                    }
                  }
                  onSuccess(context);
                  return true;
                }),
          );
        });
  }

  Future<bool> onWillPop() async {
    return true;
  }
}

class LockScreenViewModel {
  final Store<AppState> store;

  LockScreenViewModel(this.store);

  get lockCode => store.state.lockCode;
}
