import 'package:json_annotation/json_annotation.dart';

part 'expiration_volatility.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExpirationVolatility {
  final DateTime expirationDate;
  final String optionChainType;
  final String impliedVolatility;

  ExpirationVolatility(this.expirationDate, this.optionChainType,
    this.impliedVolatility);

  factory ExpirationVolatility.fromJson(Map<String, dynamic> json) =>
    _$ExpirationVolatilityFromJson(json);

  Map<String, dynamic> toJson() => _$ExpirationVolatilityToJson(this);

  @override
  String toString() {
    return 'ExpirationVolatility{expirationDate: $expirationDate, optionChainType: $optionChainType, impliedVolatility: $impliedVolatility}';
  }
}