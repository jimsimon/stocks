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
