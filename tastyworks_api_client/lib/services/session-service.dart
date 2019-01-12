import 'package:tastyworks_api_client/clients/api_client.dart';
import 'package:tastyworks_api_client/models/api_response.dart';
import 'package:tastyworks_api_client/models/session.dart';
import 'package:tastyworks_api_client/models/session_validation.dart';

class SessionService {
  final ApiClient client;

  SessionService(this.client);

  Future<Session> createSession(String login, String password) async {
    ApiResponse response = await client.request('/sessions', 'POST', params: {
      "login": login,
      "password": password
    });
    return Session.fromJson(response.data);
  }

  Future<SessionValidation> validateSession(String sessionToken) async {
    ApiResponse response = await client.request('/sessions/validate', 'POST',
      sessionToken: sessionToken
    );
    return SessionValidation.fromJson(response.data);
  }
}