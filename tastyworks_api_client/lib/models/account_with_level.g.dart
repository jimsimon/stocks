// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_with_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountWithLevel _$AccountWithLevelFromJson(Map<String, dynamic> json) {
  return AccountWithLevel(
      json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      json['authority-level'] as String);
}

Map<String, dynamic> _$AccountWithLevelToJson(AccountWithLevel instance) =>
    <String, dynamic>{
      'account': instance.account,
      'authority-level': instance.authorityLevel
    };
