import 'dart:async';

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
      converter: (store) => new LockScreenViewModel(store),
      builder: (context, viewModel) {
        return LockScreenPresenter(
          viewModel: viewModel
        );
      });
  }

  Future<bool> onWillPop() async {
    return false;
  }
}
