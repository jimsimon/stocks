// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockSymbol _$StockSymbolFromJson(Map<String, dynamic> json) {
  return StockSymbol(
      json['beta'] as String,
      json['description'] as String,
      json['dividend_ex_date'] == null
          ? null
          : DateTime.parse(json['dividend_ex_date'] as String),
      json['dividend_rate_per_share'] as String,
      json['earnings'] == null
          ? null
          : Earnings.fromJson(json['earnings'] as Map<String, dynamic>),
      json['exchange'] as String,
      (json['expiration_volatilities'] as List)
          ?.map((e) => e == null
              ? null
              : ExpirationVolatility.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['has_weekly_options'] as bool,
      json['implied_volatility_percentile_input'] == null
          ? null
          : IVPercentileInput.fromJson(
              json['implied_volatility_percentile_input']
                  as Map<String, dynamic>),
      json['is_notable'] as bool,
      json['liquidity_rank'] as String,
      json['liquidity_rating'] as int,
      json['liquidity_value'] as String,
      (json['notabilities'] as List)
          ?.map((e) =>
              e == null ? null : Notability.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['research_team'] == null
          ? null
          : ResearchTeam.fromJson(
              json['research_team'] as Map<String, dynamic>),
      json['symbol'] as String,
      json['tos_volatility_percentile'] as String,
      json['volatility_index'] as String,
      json['volatility_index_5_day_change'] as String,
      json['volatility_percentile'] as String);
}

Map<String, dynamic> _$StockSymbolToJson(StockSymbol instance) =>
    <String, dynamic>{
      'beta': instance.beta,
      'description': instance.description,
      'dividend_ex_date': instance.dividendExDate?.toIso8601String(),
      'dividend_rate_per_share': instance.dividendRatePerShare,
      'earnings': instance.earnings,
      'exchange': instance.exchange,
      'expiration_volatilities': instance.expirationVolatilities,
      'has_weekly_options': instance.hasWeeklyOptions,
      'implied_volatility_percentile_input':
          instance.impliedVolatilityPercentileInput,
      'is_notable': instance.isNotable,
      'liquidity_rank': instance.liquidityRank,
      'liquidity_rating': instance.liquidityRating,
      'liquidity_value': instance.liquidityValue,
      'notabilities': instance.notabilities,
      'research_team': instance.researchTeam,
      'symbol': instance.symbol,
      'tos_volatility_percentile': instance.tosVolatilityPercentile,
      'volatility_index': instance.volatilityIndex,
      'volatility_index_5_day_change': instance.volatilityIndex5DayChange,
      'volatility_percentile': instance.volatilityPercentile
    };
