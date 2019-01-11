import 'package:tastyworks_api_client/api_client.dart';
import 'package:http_client/http_client.dart';
import 'package:http_client/console.dart';

export 'package:tastyworks_api_client/data_transfer_objects.dart';

class VmClient extends ApiClient {

  @override
  Client get client => new ConsoleClient();

}