import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen_vm.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry.dart';

typedef void OnSuccess(BuildContext context);

class LockScreenPresenter extends StatelessWidget {
  final LockScreenViewModel viewModel;

  const LockScreenPresenter({
    Key key,
    @required this.viewModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          viewModel.unlockApp(context);
          return true;
        }),
    );
  }

  Future<bool> onWillPop() async {
    SystemNavigator.pop();
    return false;
  }
}
