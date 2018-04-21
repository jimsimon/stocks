// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_transfer_objects.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

StockSymbol _$StockSymbolFromJson(Map<String, dynamic> json) =>
    new StockSymbol(json['symbol'] as String, json['name'] as String);

abstract class _$StockSymbolSerializerMixin {
  String get symbol;
  String get name;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'symbol': symbol, 'name': name};
}

StockData _$StockDataFromJson(Map<String, dynamic> json) => new StockData(
    json['quote'] == null
        ? null
        : new Quote.fromJson(json['quote'] as Map<String, dynamic>),
    (json['chart'] as List)
        ?.map((e) => e == null
            ? null
            : new ChartEntry.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$StockDataSerializerMixin {
  Quote get quote;
  List<ChartEntry> get chart;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'quote': quote, 'chart': chart};
}

Quote _$QuoteFromJson(Map<String, dynamic> json) => new Quote(
    json['symbol'] as String, (json['latestPrice'] as num)?.toDouble());

abstract class _$QuoteSerializerMixin {
  String get symbol;
  double get latestPrice;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'symbol': symbol, 'latestPrice': latestPrice};
}

ChartEntry _$ChartEntryFromJson(Map<String, dynamic> json) => new ChartEntry(
    json['label'] as String, (json['average'] as num)?.toDouble());

abstract class _$ChartEntrySerializerMixin {
  String get label;
  double get average;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'label': label, 'average': average};
}
