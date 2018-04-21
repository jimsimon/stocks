import 'dart:async';
import 'dart:convert';
import 'package:http_client/http_client.dart';
import 'package:iex_trading_client/data_transfer_objects.dart';

abstract class ApiClient {
  final String baseUrl;

  Client get client;

  ApiClient({this.baseUrl = 'https://api.iextrading.com/1.0'});

  dynamic _makeRequest(urlFragment) async {
    String url = baseUrl + urlFragment;
    print(url);
    final response = await client.send(new Request('GET', url));
//    await client.close();

    if (response.statusCode < 200 || response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.reasonPhrase);
    }

    var jsonString = await response.readAsString();
    return json.decode(jsonString);
  }

  Future<List<StockSymbol>> getSymbols() async {
    List json = await _makeRequest('/ref-data/symbols');
    return new List<StockSymbol>.from(
        json.map((e) => new StockSymbol.fromJson(e)));
  }

  Future<Map<String, StockData>> getBatchStockData(List<String> symbols) async {
    if (symbols.isEmpty) {
      return {};
    }

    Map json = await _makeRequest(
        '/stock/market/batch?symbols=${symbols.join(',')}&types=quote,chart&range=1d');
    return new Map<String, StockData>.from(json.map((symbol, data) =>
        new MapEntry<String, StockData>(symbol, StockData.fromJson(data))));
  }
}

class ApiException {
  final int statusCode;
  final String reasonPhrase;

  ApiException(this.statusCode, this.reasonPhrase);

  @override
  String toString() {
    return 'Bad API Response: $statusCode - $reasonPhrase';
  }
}
