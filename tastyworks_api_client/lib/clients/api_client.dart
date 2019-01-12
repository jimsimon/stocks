import 'dart:async';
import 'dart:convert';
import 'package:http_client/http_client.dart';
import 'package:tastyworks_api_client/models/api_response.dart';

abstract class ApiClient {
  final String baseUrl;

  Client get client;

  ApiClient({this.baseUrl = 'https://api.tastyworks.com'});

  Future<ApiResponse> request(urlFragment, method, {params, sessionToken}) async {
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
      throw new ApiException(response.statusCode, response.reasonPhrase,
        await response.readAsString());
    }

    var jsonString = await response.readAsString();
    return ApiResponse.fromJson(json.decode(jsonString));
  }
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
