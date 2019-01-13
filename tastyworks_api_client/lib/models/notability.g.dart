// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notability _$NotabilityFromJson(Map<String, dynamic> json) {
  return Notability(json['name'] as String, json['description'] as String);
}

Map<String, dynamic> _$NotabilityToJson(Notability instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description
    };
