import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/stocks_app.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import 'package:mobile/src/store/app_state.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final store = Store<AppState>(appStateReducer,
    initialState: AppState.initial(),
    middleware: [
      ThunkMiddleware<AppState>()
    ]);

  final prefs = await SharedPreferences.getInstance();
  store.dispatch(
    SetBiometricAuthEnabled(prefs.getBool('biometricAuthEnabled') ?? false));

  runApp(StocksApp(store: store));
}



