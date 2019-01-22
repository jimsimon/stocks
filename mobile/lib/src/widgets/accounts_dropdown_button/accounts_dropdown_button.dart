import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:tastyworks_api_client/models/account_with_level.dart';

class AccountsDropdownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AccountsDropdownButtonViewModel>(
      converter: (Store store) => new AccountsDropdownButtonViewModel(store),
      builder: (BuildContext context, AccountsDropdownButtonViewModel viewModel) {
        if (viewModel.loading) {
          return _buildLoadingState();
        }
        if (viewModel.accounts.isEmpty) {
          return _buildEmptyState();
        }
        return _buildDropdownButton(viewModel);
      }
    );
  }

  Widget _buildLoadingState () {
    return CircularProgressIndicator();
  }

  Widget _buildEmptyState () {
    return Text('No accounts found');
  }

  Widget _buildDropdownButton (AccountsDropdownButtonViewModel viewModel) {
    return DropdownButton<AccountWithLevel>(
      onChanged: viewModel.onAccountChange,
      value: viewModel.activeAccount,
      items: viewModel.accounts.map((accountWithLevel) {
        return DropdownMenuItem<AccountWithLevel>(
          value: accountWithLevel,
          child: Text(accountWithLevel.account.nickname ?? accountWithLevel.account.accountTypeName),
        );
      }).toList()
    );
  }
}

class AccountsDropdownButtonViewModel {
  final Store<AppState> store;

  AccountsDropdownButtonViewModel(this.store);

  bool get loading => store.state.accountsState.loading;

  List<AccountWithLevel> get accounts => store.state.accountsState.accounts;

  AccountWithLevel get activeAccount => store.state.accountsState.active;

  void onAccountChange (AccountWithLevel account) {
    print(account);
  }
}