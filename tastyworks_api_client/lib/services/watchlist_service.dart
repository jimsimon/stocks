import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:tastyworks_api_client/models/watchlist.dart';

class WatchlistService {
  final ApiClient client;
  final String sessionToken;

  WatchlistService(this.client, this.sessionToken);

  Future<List<Watchlist>> getWatchlists() async {
    var response = await client.request('/watchlists', 'GET',
      sessionToken: sessionToken
    );

    return (response.data['items'] as List).map((json) =>
      Watchlist.fromJson(json)).toList();
  }
}