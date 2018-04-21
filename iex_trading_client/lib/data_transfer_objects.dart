import 'package:json_annotation/json_annotation.dart';

part 'data_transfer_objects.g.dart';

@JsonSerializable()
class StockSymbol extends Object with _$StockSymbolSerializerMixin {
  final String symbol;
  final String name;

  StockSymbol(this.symbol, this.name);

  factory StockSymbol.fromJson(Map<String, dynamic> json) => _$StockSymbolFromJson(json);
}

@JsonSerializable()
class StockData extends Object with _$StockDataSerializerMixin {
  final Quote quote;
  final List<ChartEntry> chart;

  StockData(this.quote, this.chart);

  factory StockData.fromJson(Map<String, dynamic> json) => _$StockDataFromJson(json);
}

@JsonSerializable()
class Quote extends Object with _$QuoteSerializerMixin {
  final String symbol;
  final double latestPrice;

  Quote(this.symbol, this.latestPrice);

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}

@JsonSerializable()
class ChartEntry extends Object with _$ChartEntrySerializerMixin {
  final String label;
  final double average;

  ChartEntry(this.label, this.average);

  factory ChartEntry.fromJson(Map<String, dynamic> json) => _$ChartEntryFromJson(json);
}