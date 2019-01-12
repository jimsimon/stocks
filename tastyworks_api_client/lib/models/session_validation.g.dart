// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionValidation _$SessionValidationFromJson(Map<String, dynamic> json) {
  return SessionValidation(json['email'] as String, json['username'] as String,
      json['external-id'] as String, json['id'] as int);
}

Map<String, dynamic> _$SessionValidationToJson(SessionValidation instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'external-id': instance.externalId,
      'id': instance.id
    };
