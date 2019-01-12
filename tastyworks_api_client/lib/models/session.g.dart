// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['session-token'] as String);
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'user': instance.user,
      'session-token': instance.sessionToken
    };
