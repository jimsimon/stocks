import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/src/screens/login_screen/login_screen_state.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:local_auth/local_auth.dart';
import 'package:after_layout/after_layout.dart';

typedef void OnSuccess(BuildContext context);

final localAuth = new LocalAuthentication();
final storage = new FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  final Store<AppState> store;
  const LoginScreen({Key key, this.store}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState(store: store);
  }
}