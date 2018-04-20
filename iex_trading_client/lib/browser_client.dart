import 'package:iex_trading_client/api_client.dart';
import 'package:http_client/http_client.dart';
import 'package:http_client/browser.dart' as http;

export 'package:iex_trading_client/data_transfer_objects.dart';

class BrowserClient extends ApiClient {

  @override
  Client get client => new http.BrowserClient();

}