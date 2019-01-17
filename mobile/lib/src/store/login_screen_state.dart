import 'package:redux/redux.dart';


class LoginScreenState {
  final String usernameOrEmail;
  final String password;
  final String error;

  LoginScreenState({this.usernameOrEmail = '', this.password = '', this.error});

  LoginScreenState copyWith({usernameOrEmail, password, error}) {
    return new LoginScreenState(
      usernameOrEmail: usernameOrEmail ?? this.usernameOrEmail,
      password: password ?? this.password,
      error: error ?? this.error
    );
  }
}

LoginScreenState loginScreenReducer(LoginScreenState state, action) {
  return new LoginScreenState(
    usernameOrEmail: new TypedReducer<String, SetUsernameOrEmailAction>(
      storeEmail)(state.usernameOrEmail, action),
    password: new TypedReducer<String, SetPasswordAction>(storePassword)(state.password, action),
    error: new TypedReducer<String, SetLoginErrorAction>(storeError)(state.error, action),
  );
}

class SetUsernameOrEmailAction {
  final String usernameOrEmail;

  SetUsernameOrEmailAction(this.usernameOrEmail);
}

class SetPasswordAction {
  final String password;

  SetPasswordAction(this.password);
}

class SetLoginErrorAction {
  final String errorMessage;

  SetLoginErrorAction(this.errorMessage);
}

String storeEmail(String state, SetUsernameOrEmailAction action) {
  return action.usernameOrEmail;
}

String storePassword(String state, SetPasswordAction action) {
  return action.password;
}

String storeError(String state, SetLoginErrorAction action) {
  return action.errorMessage;
}