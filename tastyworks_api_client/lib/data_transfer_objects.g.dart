// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_transfer_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
      json['context'] as String, json['data'] as Map<String, dynamic>);
}

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

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['email'] as String, json['username'] as String,
      json['external-id'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'external-id': instance.externalId
    };

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

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
      json['account-number'] as String,
      json['account-type-name'] as String,
      json['day-trader-status'] as bool,
      json['external-id'] as String,
      json['investment-objective'] as String,
      json['is-firm-error'] as bool,
      json['is-firm-proprietary'] as bool,
      json['is-foreign'] as bool,
      json['is-test-drive'] as bool,
      json['margin-or-cash'] as String,
      json['nickname'] as String,
      json['opened-at'] == null
          ? null
          : DateTime.parse(json['opened-at'] as String));
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'account-number': instance.accountNumber,
      'account-type-name': instance.accountTypeName,
      'day-trader-status': instance.dayTraderStatus,
      'external-id': instance.externalId,
      'investment-objective': instance.investmentObjective,
      'is-firm-error': instance.isFirmError,
      'is-firm-proprietary': instance.isFirmProprietary,
      'is-foreign': instance.isForeign,
      'is-test-drive': instance.isTestDrive,
      'margin-or-cash': instance.marginOrCash,
      'nickname': instance.nickname,
      'opened-at': instance.openedAt?.toIso8601String()
    };
