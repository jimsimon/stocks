import 'package:json_annotation/json_annotation.dart';

part 'stock_symbol.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StockSymbol {
  final String beta;
  final String description;
  final DateTime dividendExDate;
  final String dividendRatePerShare;

//  earnings: {
//    actual_eps: "1.08"
//    consensus_estimate: "1.25"
//    expected_report_date: "2019-01-30"
//    is_estimated: false
//    is_visible: true
//    late_flag: 0
//    quarter_end_date: "2018-12-01"
//    time_of_day_code: "AMC"
//  }
  final String exchange;

//  expiration_volatilities: [
//    {expiration_date: "2019-12-20", option_chain_type: "standard", implied_volatility: "20.70406040096445"}
//  ]
  final bool hasWeeklyOptions;

//  implied_volatility_percentile_input: {
//    mean_1y: "16.73067168431563"
//    mean_6m: "17.09359936980892"
//    mean_30d: "24.29690194379774"
//    mean_60d: "22.80278994186752"
//    snapshot_at: "2019-01-11"
//    standard_deviation_1y: "5.741404954137365"
//    standard_deviation_6m: "6.408161292915959"
//    standard_deviation_30d: "6.403880226289415"
//    standard_deviation_60d: "5.365321418016254"
//  }
  final bool isNotable;
  final String liquidityRank;
  final int liquidityRating;
  final String liquidityValue;

//  notabilities: [{name: "Liquid ETF", description: ""}]
//  research_team: {corr_SPY_3month: "1.0"}
  final String symbol;
  final String tosVolatilityPercentile;
  final String volatilityIndex;
  final String volatilityIndex5DayChange;
  final String volatilityPercentile;

  StockSymbol(this.beta, this.description, this.dividendExDate,
    this.dividendRatePerShare, this.exchange, this.hasWeeklyOptions,
    this.isNotable, this.liquidityRank, this.liquidityRating,
    this.liquidityValue, this.symbol, this.tosVolatilityPercentile,
    this.volatilityIndex, this.volatilityIndex5DayChange,
    this.volatilityPercentile);

  factory StockSymbol.fromJson(Map<String, dynamic> json) =>
    _$StockSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$StockSymbolToJson(this);

  @override
  String toString() {
    return 'StockSymbol{beta: $beta, description: $description, dividendExDate: $dividendExDate, dividendRatePerShare: $dividendRatePerShare, exchange: $exchange, hasWeeklyOptions: $hasWeeklyOptions, isNotable: $isNotable, liquidityRank: $liquidityRank, liquidityRating: $liquidityRating, liquidityValue: $liquidityValue, symbol: $symbol, tosVolatilityPercentile: $tosVolatilityPercentile, volatilityIndex: $volatilityIndex, volatilityIndex5DayChange: $volatilityIndex5DayChange, volatilityPercentile: $volatilityPercentile}';
  }
}