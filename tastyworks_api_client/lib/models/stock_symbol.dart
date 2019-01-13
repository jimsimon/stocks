import 'package:json_annotation/json_annotation.dart';
import 'package:tastyworks_api_client/models/earnings.dart';
import 'package:tastyworks_api_client/models/expiration_volatility.dart';
import 'package:tastyworks_api_client/models/iv_percentile_input.dart';
import 'package:tastyworks_api_client/models/notability.dart';
import 'package:tastyworks_api_client/models/research_team.dart';

part 'stock_symbol.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StockSymbol {
  final String beta;
  final String description;
  final DateTime dividendExDate;
  final String dividendRatePerShare;
  final Earnings earnings;
  final String exchange;
  final List<ExpirationVolatility> expirationVolatilities;
  final bool hasWeeklyOptions;
  final IVPercentileInput impliedVolatilityPercentileInput;
  final bool isNotable;
  final String liquidityRank;
  final int liquidityRating;
  final String liquidityValue;
  final List<Notability> notabilities;
  final ResearchTeam researchTeam;
  final String symbol;
  final String tosVolatilityPercentile;
  final String volatilityIndex;
  @JsonKey(name: 'volatility_index_5_day_change')
  final String volatilityIndex5DayChange;
  final String volatilityPercentile;

  StockSymbol(this.beta, this.description, this.dividendExDate,
    this.dividendRatePerShare, this.earnings, this.exchange,
    this.expirationVolatilities, this.hasWeeklyOptions,
    this.impliedVolatilityPercentileInput, this.isNotable, this.liquidityRank,
    this.liquidityRating, this.liquidityValue, this.notabilities,
    this.research_team, this.symbol, this.tosVolatilityPercentile,
    this.volatilityIndex, this.volatilityIndex5DayChange,
    this.volatilityPercentile);

  factory StockSymbol.fromJson(Map<String, dynamic> json) =>
    _$StockSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$StockSymbolToJson(this);

  @override
  String toString() {
    return 'StockSymbol{beta: $beta, description: $description, dividendExDate: $dividendExDate, dividendRatePerShare: $dividendRatePerShare, earnings: $earnings, exchange: $exchange, expirationVolatilities: $expirationVolatilities, hasWeeklyOptions: $hasWeeklyOptions, impliedVolatilityPercentileInput: $impliedVolatilityPercentileInput, isNotable: $isNotable, liquidityRank: $liquidityRank, liquidityRating: $liquidityRating, liquidityValue: $liquidityValue, notabilities: $notabilities, research_team: $research_team, symbol: $symbol, tosVolatilityPercentile: $tosVolatilityPercentile, volatilityIndex: $volatilityIndex, volatilityIndex5DayChange: $volatilityIndex5DayChange, volatilityPercentile: $volatilityPercentile}';
  }
}