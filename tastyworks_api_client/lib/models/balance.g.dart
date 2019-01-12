// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
      json['account-number'] as String,
      json['available-trading-funds'] as String,
      json['cash-available-to-withdraw'] as String,
      json['cash-balance'] as String,
      json['day-equity-call-value'] as String,
      json['day-trade-excess'] as String,
      json['day-trading-buying-power'] as String,
      json['day-trading-call-value'] as String,
      json['debit-margin-balance'] as String,
      json['derivative-buying-power'] as String,
      json['equity-buying-power'] as String,
      json['futures-intraday-margin-requirement'] as String,
      json['futures-margin-requirement'] as String,
      json['futures-overnight-margin-requirement'] as String,
      json['long-derivative-value'] as String,
      json['long-equity-value'] as String,
      json['long-futures-derivative-value'] as String,
      json['long-futures-value'] as String,
      json['long-margineable-value'] as String,
      json['maintenance-call-value'] as String,
      json['maintenance-requirement'] as String,
      json['margin-equity'] as String,
      json['net-liquidating-value'] as String,
      json['pending-cash'] as String,
      json['pending-cash-effect'] as String,
      json['reg-t-call-value'] as String,
      json['reg-t-margin-requirement'] as String,
      json['short-derivative-value'] as String,
      json['short-equity-value'] as String,
      json['short-futures-derivative-value'] as String,
      json['short-futures-value'] as String,
      json['short-margineable-value'] as String,
      json['snapshot-date'] == null
          ? null
          : DateTime.parse(json['snapshot-date'] as String));
}

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'account-number': instance.accountNumber,
      'available-trading-funds': instance.availableTradingFunds,
      'cash-available-to-withdraw': instance.cashAvailableToWithdraw,
      'cash-balance': instance.cashBalance,
      'day-equity-call-value': instance.dayEquityCallValue,
      'day-trade-excess': instance.dayTradeExcess,
      'day-trading-buying-power': instance.dayTradingBuyingPower,
      'day-trading-call-value': instance.dayTradingCallValue,
      'debit-margin-balance': instance.debitMarginBalance,
      'derivative-buying-power': instance.derivativeBuyingPower,
      'equity-buying-power': instance.equityBuyingPower,
      'futures-intraday-margin-requirement':
          instance.futuresIntradayMarginRequirement,
      'futures-margin-requirement': instance.futuresMarginRequirement,
      'futures-overnight-margin-requirement':
          instance.futuresOvernightMarginRequirement,
      'long-derivative-value': instance.longDerivativeValue,
      'long-equity-value': instance.longEquityValue,
      'long-futures-derivative-value': instance.longFuturesDerivativeValue,
      'long-futures-value': instance.longFuturesValue,
      'long-margineable-value': instance.longMargineableValue,
      'maintenance-call-value': instance.maintenanceCallValue,
      'maintenance-requirement': instance.maintenanceRequirement,
      'margin-equity': instance.marginEquity,
      'net-liquidating-value': instance.netLiquidatingValue,
      'pending-cash': instance.pendingCash,
      'pending-cash-effect': instance.pendingCashEffect,
      'reg-t-call-value': instance.regTCallValue,
      'reg-t-margin-requirement': instance.regTMarginRequirement,
      'short-derivative-value': instance.shortDerivativeValue,
      'short-equity-value': instance.shortEquityValue,
      'short-futures-derivative-value': instance.shortFuturesDerivativeValue,
      'short-futures-value': instance.shortFuturesValue,
      'short-margineable-value': instance.shortMargineableValue,
      'snapshot-date': instance.snapshotDate?.toIso8601String()
    };
