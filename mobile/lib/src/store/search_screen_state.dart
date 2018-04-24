import 'package:redux/redux.dart';


class SearchScreenState {
  final String searchTerm;

  SearchScreenState({this.searchTerm = ''});

  SearchScreenState copyWith({searchTerm}) {
    return new SearchScreenState(searchTerm: searchTerm ?? this.searchTerm);
  }
}

SearchScreenState searchScreenReducer(SearchScreenState state, action) {
  return new SearchScreenState(
    searchTerm: new TypedReducer<String, SetSymbolSearchTermAction>(
      storeSymbolSearchTerm)(state.searchTerm, action));
}

class SetSymbolSearchTermAction {
  final String searchTerm;

  SetSymbolSearchTermAction(this.searchTerm);
}

String storeSymbolSearchTerm(String state, SetSymbolSearchTermAction action) {
  return action.searchTerm;
}