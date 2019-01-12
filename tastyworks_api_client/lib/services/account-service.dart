import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:tastyworks_api_client/models/account_with_level.dart';
import 'package:tastyworks_api_client/models/api_response.dart';
import 'package:tastyworks_api_client/models/balance.dart';
import 'package:tastyworks_api_client/models/position.dart';

class AccountService {
  final ApiClient client;
  final String sessionToken;

  AccountService(this.client, this.sessionToken);

  Future<List<AccountWithLevel>> getAccounts() async {
    ApiResponse response = await client.request('/customers/me/accounts', 'GET',
      sessionToken: sessionToken
    );
    return (response.data['items'] as List).map((json) =>
      AccountWithLevel.fromJson(json)).toList();
  }

  Future<Balance> getBalances(String accountNumber) async {
    ApiResponse response = await client.request(
      '/accounts/$accountNumber/balances', 'GET', sessionToken: sessionToken);
    return Balance.fromJson(response.data);
  }

  Future<List<Position>> getPositions(String accountNumber) async {
    ApiResponse response = await client.request(
      '/accounts/$accountNumber/positions', 'GET', sessionToken: sessionToken);
    return (response.data['items'] as List).map((json) =>
      Position.fromJson(json)).toList();
  }
}