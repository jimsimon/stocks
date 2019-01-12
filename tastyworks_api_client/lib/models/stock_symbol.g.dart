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
      json['exchange'] as String,
      json['has_weekly_options'] as bool,
      json['is_notable'] as bool,
      json['liquidity_rank'] as String,
      json['liquidity_rating'] as int,
      json['liquidity_value'] as String,
      json['symbol'] as String,
      json['tos_volatility_percentile'] as String,
      json['volatility_index'] as String,
      json['volatility_index5_day_change'] as String,
      json['volatility_percentile'] as String);
}

Map<String, dynamic> _$StockSymbolToJson(StockSymbol instance) =>
    <String, dynamic>{
      'beta': instance.beta,
      'description': instance.description,
      'dividend_ex_date': instance.dividendExDate?.toIso8601String(),
      'dividend_rate_per_share': instance.dividendRatePerShare,
      'exchange': instance.exchange,
      'has_weekly_options': instance.hasWeeklyOptions,
      'is_notable': instance.isNotable,
      'liquidity_rank': instance.liquidityRank,
      'liquidity_rating': instance.liquidityRating,
      'liquidity_value': instance.liquidityValue,
      'symbol': instance.symbol,
      'tos_volatility_percentile': instance.tosVolatilityPercentile,
      'volatility_index': instance.volatilityIndex,
      'volatility_index5_day_change': instance.volatilityIndex5DayChange,
      'volatility_percentile': instance.volatilityPercentile
    };
