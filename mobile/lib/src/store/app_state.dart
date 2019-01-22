import 'package:flutter/material.dart';
import 'package:mobile/src/store/accounts_state.dart';
import 'package:mobile/src/store/screen_state.dart';
import 'package:mobile/src/store/session_state.dart';
import 'package:redux/redux.dart';

class AppState {
  final ScreenState screens;
  final String currentRoute;
  final List<int> lockCode = [1, 2, 3, 4];
  final SessionState sessionState;
  final bool locked;
  final bool biometricAuthEnabled;
  final AccountsState accountsState;

  AppState({
    this.screens,
    this.currentRoute = '/',
    this.sessionState,
    this.locked = false,
    this.biometricAuthEnabled = false,
    this.accountsState
  });

  factory AppState.initial() =>
    new AppState(
      screens: ScreenState.initial(),
      accountsState: AccountsState(),
      sessionState: SessionState()
    );

  AppState copyWith({
    screens,
    currentRoute,
    sessionState,
    locked,
    biometricAuthEnabled,
    accountsState
  }) {
    return new AppState(
      screens: screens ?? this.screens,
      currentRoute: currentRoute ?? this.currentRoute,
      sessionState: sessionState ?? this.sessionState,
      locked: locked ?? this.locked,
      biometricAuthEnabled: biometricAuthEnabled ?? this.biometricAuthEnabled,
      accountsState: accountsState ?? this.accountsState
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
    screens: new TypedReducer(screenStateReducer)(
      state.screens, action),
    currentRoute: new TypedReducer(navigate)(
      state.currentRoute, action),
    sessionState: new TypedReducer(sessionStateReducer)(
      state.sessionState, action),
    locked: new TypedReducer(storeLocked)(state.locked, action),
    biometricAuthEnabled: new TypedReducer(storeBiometricAuthEnabled)(
      state.biometricAuthEnabled, action),
    accountsState: new TypedReducer(accountsStateReducer)(
      state.accountsState, action)
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