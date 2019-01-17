import 'package:flutter/material.dart';
import 'package:mobile/src/store/login_screen_state.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:mobile/src/store/screen_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tastyworks_api_client/clients/vm_client.dart';
import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:tastyworks_api_client/models/session.dart';
import 'package:tastyworks_api_client/services/session_service.dart';

class AppState {
  final ScreenState screens;
  final String currentRoute;
  final List<int> lockCode = [1, 2, 3, 4];
  final Session session;
  final bool locked;
  final bool biometricAuthEnabled;

  AppState({this.screens,
    this.currentRoute = '/',
    this.session,
    this.locked = false,
    this.biometricAuthEnabled = false
  });

  factory AppState.initial() =>
    new AppState(screens: new ScreenState.initial());

  AppState copyWith(
    {screens, currentRoute, session, locked, biometricAuthEnabled}) {
    return new AppState(
      screens: screens ?? this.screens,
      currentRoute: currentRoute ?? this.currentRoute,
      session: session ?? this.session,
      locked: locked ?? this.locked,
      biometricAuthEnabled: biometricAuthEnabled ?? this.biometricAuthEnabled
    );
  }
}

class Navigation {
  final BuildContext context;
  final String route;
  final bool replace;

  Navigation(this.context, this.route, {this.replace = false});
}

AppState appStateReducer(AppState state, action) {
  return new AppState(
    screens: new TypedReducer<ScreenState, dynamic>(screenStateReducer)(
      state.screens, action),
    currentRoute: new TypedReducer<String, NavigateAction>(navigate)(
      state.currentRoute, action),
    session: new TypedReducer<Session, SetSessionAction>(storeSession)(
      state.session, action),
    locked: new TypedReducer<bool, SetLockedAction>(storeLocked)(state.locked, action),
    biometricAuthEnabled: new TypedReducer<bool, SetBiometricAuthEnabled>(storeBiometricAuthEnabled)(state.biometricAuthEnabled, action)
  );
}

String navigate(String state, NavigateAction action) {
  var navigator = Navigator.of(action.navigation.context);
  if (!action.navigation.replace) {
    navigator.pushNamed(action.navigation.route);
  } else {
    navigator.pushReplacementNamed(action.navigation.route);
  }
  return action.navigation.route;
}

Session storeSession(Session state, SetSessionAction action) {
  return action.session;
}

bool storeLocked(bool state, SetLockedAction action) {
  return action.locked;
}

bool storeBiometricAuthEnabled(bool state, SetBiometricAuthEnabled action) {
  return action.enabled;
}

class NavigateAction {
  final Navigation navigation;

  NavigateAction(this.navigation);
}

class LoginAction implements ThunkAction<AppState> {
  final BuildContext context;
  final String usernameOrEmail;
  final String password;

  LoginAction(this.context, this.usernameOrEmail, this.password);
  
  void call(Store<AppState> store) async {
    var apiClient = VmClient();
    var sessionService = SessionService(apiClient);
    final storage = new FlutterSecureStorage();
    try {
      var session = await sessionService.createSession(usernameOrEmail, password);
      await sessionService.validateSession(session.sessionToken);
      await storage.write(key: 'usernameOrEmail', value: usernameOrEmail);
      await storage.write(key: 'password', value: password);
      store.dispatch(SetSessionAction(session));
      store.dispatch(NavigateAction(Navigation(context, '/home', replace: true)));
    } on ApiException catch (e) {
      await storage.delete(key: 'usernameOrEmail');
      await storage.delete(key: 'password');
      store.dispatch(SetLoginErrorAction(e?.response?.message));
    }
  }
}

class SetSessionAction {
  final Session session;

  SetSessionAction(this.session);
}

class SetLockedAction {
  final bool locked;

  SetLockedAction(this.locked);
}

class SetBiometricAuthEnabled {
  final bool enabled;

  SetBiometricAuthEnabled(this.enabled);
}

class StoreCredentialsAction {
  final String usernameOrEmail;
  final String password;

  StoreCredentialsAction(this.usernameOrEmail, this.password);
}

class DeleteCredentialsAction {}