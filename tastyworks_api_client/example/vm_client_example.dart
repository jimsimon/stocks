import 'package:tastyworks_api_client/vm_client.dart';

void main(List<String> args) async {
  final VmClient client = new VmClient();

  var session = await client.createSession(args[0], args[1]);
  print(session.sessionToken);

  var validation = await client.validateSession(session.sessionToken);
  print(validation.id);

  var accounts = await client.getAccounts(session.sessionToken);
  print(accounts);
}
