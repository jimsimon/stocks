import 'package:tastyworks_api_client/vm_client.dart';

void main(List<String> args) async {
  final VmClient client = new VmClient();

  var session = await client.createSession(args[0], args[1]);
  var sessionToken = session.sessionToken;
  print(sessionToken);

  var validation = await client.validateSession(sessionToken);
  print(validation.id);

  var accounts = await client.getAccounts(sessionToken);
  print(accounts);

  var accountNumber = accounts.first.account.accountNumber;

  var balance = await client.getBalances(sessionToken, accountNumber);
  print(balance);
  
  var position = await client.getPositions(sessionToken, accountNumber);
  print(position);
}
