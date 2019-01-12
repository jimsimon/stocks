import 'package:json_annotation/json_annotation.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance {
  final String accountNumber;
  final String availableTradingFunds;
  final String cashAvailableToWithdraw;
  final String cashBalance;
  final String dayEquityCallValue;
  final String dayTradeExcess;
  final String dayTradingBuyingPower;
  final String dayTradingCallValue;
  final String debitMarginBalance;
  final String derivativeBuyingPower;
  final String equityBuyingPower;
  final String futuresIntradayMarginRequirement;
  final String futuresMarginRequirement;
  final String futuresOvernightMarginRequirement;
  final String longDerivativeValue;
  final String longEquityValue;
  final String longFuturesDerivativeValue;
  final String longFuturesValue;
  final String longMargineableValue;
  final String maintenanceCallValue;
  final String maintenanceRequirement;
  final String marginEquity;
  final String netLiquidatingValue;
  final String pendingCash;
  final String pendingCashEffect;
  final String regTCallValue;
  final String regTMarginRequirement;
  final String shortDerivativeValue;
  final String shortEquityValue;
  final String shortFuturesDerivativeValue;
  final String shortFuturesValue;
  final String shortMargineableValue;
  final DateTime snapshotDate;

  Balance(this.accountNumber,
    this.availableTradingFunds,
    this.cashAvailableToWithdraw,
    this.cashBalance,
    this.dayEquityCallValue,
    this.dayTradeExcess,
    this.dayTradingBuyingPower,
    this.dayTradingCallValue,
    this.debitMarginBalance,
    this.derivativeBuyingPower,
    this.equityBuyingPower,
    this.futuresIntradayMarginRequirement,
    this.futuresMarginRequirement,
    this.futuresOvernightMarginRequirement,
    this.longDerivativeValue,
    this.longEquityValue,
    this.longFuturesDerivativeValue,
    this.longFuturesValue,
    this.longMargineableValue,
    this.maintenanceCallValue,
    this.maintenanceRequirement,
    this.marginEquity,
    this.netLiquidatingValue,
    this.pendingCash,
    this.pendingCashEffect,
    this.regTCallValue,
    this.regTMarginRequirement,
    this.shortDerivativeValue,
    this.shortEquityValue,
    this.shortFuturesDerivativeValue,
    this.shortFuturesValue,
    this.shortMargineableValue,
    this.snapshotDate);

  factory Balance.fromJson(Map<String, dynamic> json) =>
    _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);

  @override
  String toString() {
    return 'Balance{accountNumber: $accountNumber, availableTradingFunds: $availableTradingFunds, cashAvailableToWithdraw: $cashAvailableToWithdraw, cashBalance: $cashBalance, dayEquityCallValue: $dayEquityCallValue, dayTradeExcess: $dayTradeExcess, dayTradingBuyingPower: $dayTradingBuyingPower, dayTradingCallValue: $dayTradingCallValue, debitMarginBalance: $debitMarginBalance, derivativeBuyingPower: $derivativeBuyingPower, equityBuyingPower: $equityBuyingPower, futuresIntradayMarginRequirement: $futuresIntradayMarginRequirement, futuresMarginRequirement: $futuresMarginRequirement, futuresOvernightMarginRequirement: $futuresOvernightMarginRequirement, longDerivativeValue: $longDerivativeValue, longEquityValue: $longEquityValue, longFuturesDerivativeValue: $longFuturesDerivativeValue, longFuturesValue: $longFuturesValue, longMargineableValue: $longMargineableValue, maintenanceCallValue: $maintenanceCallValue, maintenanceRequirement: $maintenanceRequirement, marginEquity: $marginEquity, netLiquidatingValue: $netLiquidatingValue, pendingCash: $pendingCash, pendingCashEffect: $pendingCashEffect, regTCallValue: $regTCallValue, regTMarginRequirement: $regTMarginRequirement, shortDerivativeValue: $shortDerivativeValue, shortEquityValue: $shortEquityValue, shortFuturesDerivativeValue: $shortFuturesDerivativeValue, shortFuturesValue: $shortFuturesValue, shortMargineableValue: $shortMargineableValue, snapshotDate: $snapshotDate}';
  }
}
