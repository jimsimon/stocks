import 'package:json_annotation/json_annotation.dart';
import 'package:tastyworks_api_client/models/user.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final User user;
  final String sessionToken;

  Session(this.user, this.sessionToken);

  factory Session.fromJson(Map<String, dynamic> json) =>
    _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  @override
  String toString() {
    return 'Session{user: $user, sessionToken: $sessionToken}';
  }
}