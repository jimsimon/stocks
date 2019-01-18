import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/src/screens/lock_screen/lock_screen_vm.dart';

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 100.0,
            )
          ]
        )
      )
    );
  }

  Future<bool> onWillPop() async {
    return false;
  }
}
