// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiration_volatility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpirationVolatility _$ExpirationVolatilityFromJson(Map<String, dynamic> json) {
  return ExpirationVolatility(
      json['expiration_date'] == null
          ? null
          : DateTime.parse(json['expiration_date'] as String),
      json['option_chain_type'] as String,
      json['implied_volatility'] as String);
}

Map<String, dynamic> _$ExpirationVolatilityToJson(
        ExpirationVolatility instance) =>
    <String, dynamic>{
      'expiration_date': instance.expirationDate?.toIso8601String(),
      'option_chain_type': instance.optionChainType,
      'implied_volatility': instance.impliedVolatility
    };
