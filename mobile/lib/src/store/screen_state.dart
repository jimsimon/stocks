import 'package:mobile/src/store/search_screen_state.dart';
import 'package:mobile/src/store/sign_up_screen_state.dart';
import 'package:redux/redux.dart';

class ScreenState {
  final SearchScreenState search;
  final SignUpScreenState signUp;

  ScreenState({this.search, this.signUp});

  factory ScreenState.initial() =>
    new ScreenState(
      search: new SearchScreenState(),
      signUp: new SignUpScreenState()
    );
}

ScreenState screenStateReducer(ScreenState state, action) {
  return new ScreenState(
    search: new TypedReducer<SearchScreenState, dynamic>(searchScreenReducer)(
      state.search, action),
    signUp: new TypedReducer<SignUpScreenState, dynamic>(signUpScreenReducer)(
      state.signUp, action)
  );
}