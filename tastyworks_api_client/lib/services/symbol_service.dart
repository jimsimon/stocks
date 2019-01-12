import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:tastyworks_api_client/models/stock_symbol.dart';
import 'package:tastyworks_api_client/models/symbol_search_result.dart';

class SymbolService {
  final ApiClient client;

  SymbolService(this.client);

  Future<List<SymbolSearchResult>> searchSymbols(String searchTerm,
    {String baseUrl = 'https://trade.tastyworks.com'}) async {
    var json = await client.rawRequest(
      '/symbol_search/search/${searchTerm.toUpperCase()}', 'GET',
      baseUrl: baseUrl);

    return (json as List)
      .map((json) => SymbolSearchResult.fromJson(json))
      .toList();
  }

  Future<List<StockSymbol>> getSymbols(List<String> symbols,
    {String baseUrl = 'https://trade.dough.com'}) async {
    var json = await client.rawRequest(
      '/api/stocks/search', 'POST',
      baseUrl: baseUrl, params: {
      'symbols': symbols
    });

    return (json['stocks'] as List)
      .map((json) => StockSymbol.fromJson(json))
      .toList();
  }
}