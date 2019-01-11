import 'dart:async';
import 'dart:convert';
import 'package:http_client/http_client.dart';
import 'package:tastyworks_api_client/data_transfer_objects.dart';

abstract class ApiClient {
  final String baseUrl;

  Client get client;

  ApiClient({this.baseUrl = 'https://api.tastyworks.com'});

  dynamic _makeRequest(urlFragment, method, {params, sessionToken}) async {
    String url = baseUrl + urlFragment;
    var headers = {
      'Content-Type': 'application/json'
    };
    if (sessionToken != null) {
      headers['Authorization'] = sessionToken;
    }
    final response = await client.send(new Request(method, url,
      body: params != null ? json.encode(params) : null,
      headers: headers
    ));
    await client.close();

    if (response.statusCode < 200 || response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.reasonPhrase, await response.readAsString());
    }

    var jsonString = await response.readAsString();
    return ApiResponse.fromJson(json.decode(jsonString));
  }

  Future<Session> createSession(String login, String password) async {
    ApiResponse response = await _makeRequest('/sessions', 'POST', params: {
      "login": login,
      "password": password
    });
    return Session.fromJson(response.data);
  }

  Future<SessionValidation> validateSession(String sessionToken) async {
    ApiResponse response = await _makeRequest('/sessions/validate', 'POST',
      sessionToken: sessionToken
    );
    return SessionValidation.fromJson(response.data);
  }

  Future<List<AccountWithLevel>> getAccounts(String sessionToken) async {
    ApiResponse response = await _makeRequest('/customers/me/accounts', 'GET',
      sessionToken: sessionToken
    );
    return (response.data['items'] as List).map((json) => AccountWithLevel.fromJson(json)).toList();
  }

//  Future<Map<String, StockData>> getBatchStockData(List<String> symbols) async {
//    if (symbols.isEmpty) {
//      return {};
//    }
//
//    Map json = await _makeRequest(
//        '/stock/market/batch?symbols=${symbols.join(',')}&types=quote,chart&range=1d');
//    return Map<String, StockData>.from(json.map((symbol, data) =>
//        MapEntry<String, StockData>(symbol, StockData.fromJson(data))));
//  }
}

class ApiException {
  final int statusCode;
  final String reasonPhrase;
  final String body;

  ApiException(this.statusCode, this.reasonPhrase, this.body);

  @override
  String toString() {
    return '''Bad API Response: $statusCode - $reasonPhrase
    
    $body''';
  }
}
