// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
