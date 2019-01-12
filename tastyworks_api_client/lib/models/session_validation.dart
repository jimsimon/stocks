import 'package:json_annotation/json_annotation.dart';

part 'session_validation.g.dart';

@JsonSerializable()
class SessionValidation {
  final String email;
  final String username;
  final String externalId;
  final int id;

  SessionValidation(this.email, this.username, this.externalId, this.id);

  factory SessionValidation.fromJson(Map<String, dynamic> json) =>
    _$SessionValidationFromJson(json);

  Map<String, dynamic> toJson() => _$SessionValidationToJson(this);

  @override
  String toString() {
    return 'SessionValidation{email: $email, username: $username, externalId: $externalId, id: $id}';
  }
}