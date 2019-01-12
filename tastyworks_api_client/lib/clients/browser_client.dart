import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:http_client/http_client.dart';
import 'package:http_client/browser.dart' as http;

class BrowserClient extends ApiClient {

  @override
  Client get client => new http.BrowserClient();

}