import 'package:mobile/src/store/search_screen_state.dart';
import 'package:mobile/src/store/login_screen_state.dart';
import 'package:redux/redux.dart';

class ScreenState {
  final SearchScreenState search;
  final LoginScreenState login;

  ScreenState({this.search, this.login});

  factory ScreenState.initial() =>
    new ScreenState(
      search: new SearchScreenState(),
      login: new LoginScreenState()
    );
}

ScreenState screenStateReducer(ScreenState state, action) {
  return new ScreenState(
    search: new TypedReducer<SearchScreenState, dynamic>(searchScreenReducer)(
      state.search, action),
    login: new TypedReducer<LoginScreenState, dynamic>(loginScreenReducer)(
      state.login, action)
  );
}