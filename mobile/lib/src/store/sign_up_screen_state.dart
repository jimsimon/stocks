import 'package:redux/redux.dart';


class SignUpScreenState {
  final String email;
  final String password;
  final String confirmedPassword;

  SignUpScreenState({this.email = '', this.password = '', this.confirmedPassword = ''});

  SignUpScreenState copyWith({email, password, confirmedPassword}) {
    return new SignUpScreenState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword
    );
  }
}

SignUpScreenState signUpScreenReducer(SignUpScreenState state, action) {
  return new SignUpScreenState(
    email: new TypedReducer<String, SetEmailAction>(
      storeEmail)(state.email, action),
    password: new TypedReducer<String, SetPasswordAction>(storePassword)(state.password, action),
    confirmedPassword: new TypedReducer<String, SetPasswordAction>(storePassword)(state.confirmedPassword, action),
  );
}

class SetEmailAction {
  final String email;

  SetEmailAction(this.email);
}

class SetPasswordAction {
  final String password;

  SetPasswordAction(this.password);
}

class SetConfirmedPasswordAction {
  final String password;

  SetConfirmedPasswordAction(this.password);
}

String storeEmail(String state, SetEmailAction action) {
  return action.email;
}

String storePassword(String state, SetPasswordAction action) {
  return action.password;
}

String storeConfirmedPassword(String state, SetConfirmedPasswordAction action) {
  return action.password;
}