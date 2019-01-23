// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/src/stocks_app.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('renders correctly on first paint', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final store = Store<AppState>(appStateReducer,
      initialState: AppState.initial(),
      middleware: [
        ThunkMiddleware<AppState>()
      ]);
    await tester.pumpWidget(new StocksApp(store: store));

    var textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(2));

    var usernameField = tester.widget<TextField>(textFields.first);
    expect(usernameField.decoration.hintText, 'Username or email address');

    var passwordField = tester.widget<TextField>(textFields.last);
    expect(passwordField.decoration.hintText, 'Password');

    var loginButtonFinder = find.widgetWithText(FlatButton, 'Login');
    var loginButton = tester.widget<FlatButton>(loginButtonFinder);
    expect(loginButton.enabled, isTrue);
  });
}
