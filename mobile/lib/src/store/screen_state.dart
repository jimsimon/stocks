import 'package:mobile/src/store/search_screen_state.dart';
import 'package:redux/redux.dart';

class ScreenState {
  final SearchScreenState search;

  ScreenState({this.search});

  factory ScreenState.initial() =>
    new ScreenState(search: new SearchScreenState());
}

ScreenState screenStateReducer(ScreenState state, action) {
  return new ScreenState(
    search: new TypedReducer<SearchScreenState, dynamic>(searchScreenReducer)(
      state.search, action));
}