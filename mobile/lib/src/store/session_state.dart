import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:redux/redux.dart';
import 'package:tastyworks_api_client/clients/vm_client.dart';
import 'package:tastyworks_api_client/models/account_with_level.dart';
import 'package:tastyworks_api_client/models/session.dart';
import 'package:tastyworks_api_client/services/account_service.dart';

class AccountsState {
  final List<AccountWithLevel> accounts;
  final bool loading;
  final AccountWithLevel active;

  AccountsState({
    this.accounts = const [],
    this.loading = false,
    this.active
  });

  AccountsState copyWith({accounts, leading, active}) {
    return AccountsState(
      accounts: accounts ?? this.accounts,
      loading: loading ?? this.loading,
      active: active ?? this.active
    );
  }
}

class FetchAccountsAction extends ThunkAction<AppState> {
  final Session session;

  FetchAccountsAction(this.session);

  call (Store<AppState> store) async {
    var apiClient = VmClient();
    var accountService = AccountService(apiClient, session.sessionToken);
    try {
      store.dispatch(SetAccountsLoadingAction(true));
      var accounts = await accountService.getAccounts();
      store.dispatch(SetActiveAccountAction(accounts[0]));
      store.dispatch(SetAccountsAction(accounts));
    } on ApiException catch (e) {
//      store.dispatch(SetLoginErrorAction(e?.response?.message));
    } finally {
      store.dispatch(SetAccountsLoadingAction(false));
    }
  }
}

class SetAccountsAction {
  final List<AccountWithLevel> accounts;

  SetAccountsAction(this.accounts);
}

class SetAccountsLoadingAction {
  final bool loading;

  SetAccountsLoadingAction(this.loading);
}

class SetActiveAccountAction {
  final AccountWithLevel account;

  SetActiveAccountAction(this.account);
}

AccountsState accountsStateReducer(AccountsState state, action) {
  return AccountsState(
    accounts: TypedReducer(setAccounts)(state.accounts, action),
    loading: TypedReducer(setLoading)(state.loading, action),
    active: TypedReducer(setActive)(state.active, action)
  );
}

bool setLoading(bool state, SetAccountsLoadingAction action) {
  return action.loading;
}

List<AccountWithLevel> setAccounts(List<AccountWithLevel> state, SetAccountsAction action) {
  return action.accounts;
}

AccountWithLevel setActive(AccountWithLevel state, SetActiveAccountAction action) {
  return action.account;
}