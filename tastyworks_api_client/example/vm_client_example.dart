import 'package:tastyworks_api_client/clients/vm_client.dart';
import 'package:tastyworks_api_client/services/account_service.dart';
import 'package:tastyworks_api_client/services/session_service.dart';
import 'package:tastyworks_api_client/services/symbol_service.dart';
import 'package:tastyworks_api_client/services/watchlist_service.dart';

void main(List<String> args) async {
  final VmClient client = VmClient();
  final sessionService = SessionService(client);

  var session = await sessionService.createSession(args[0], args[1]);
  var sessionToken = session.sessionToken;
  print(session);

  var validation = await sessionService.validateSession(sessionToken);
  print(validation);

  final accountService = AccountService(client, sessionToken);
  var accounts = await accountService.getAccounts();
  print(accounts);

  var accountNumber = accounts.first.account.accountNumber;

  var balance = await accountService.getBalances(accountNumber);
  print(balance);
  
  var position = await accountService.getPositions(accountNumber);
  print(position);

  final watchlistService = WatchlistService(client, sessionToken);
  var watchlists = await watchlistService.getWatchlists();
  print(watchlists);
  
  final symbolService = SymbolService(client);
  var searchResults = await symbolService.searchSymbols('Vang');
  print(searchResults);
  
  var stockSymbols = await symbolService.getSymbols(['SPY', 'V']);
  print(stockSymbols);
}
