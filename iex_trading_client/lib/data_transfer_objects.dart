import 'package:json_annotation/json_annotation.dart';

part 'package:iex_trading_client/data_transfer_objects.g.dart';

@JsonSerializable()
class StockSymbol extends Object with _$StockSymbolSerializerMixin {
  final String symbol;
  final String name;

  StockSymbol(this.symbol, this.name);

  factory StockSymbol.fromJson(Map<String, dynamic> json) => _$StockSymbolFromJson(json);
}