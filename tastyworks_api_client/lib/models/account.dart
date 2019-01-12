import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String accountNumber;
  final String accountTypeName;
  final bool dayTraderStatus;
  final String externalId;
  final String investmentObjective;
  final bool isFirmError;
  final bool isFirmProprietary;
  final bool isForeign;
  final bool isTestDrive;
  final String marginOrCash;
  final String nickname;
  final DateTime openedAt;

  Account(this.accountNumber,
    this.accountTypeName,
    this.dayTraderStatus,
    this.externalId,
    this.investmentObjective,
    this.isFirmError,
    this.isFirmProprietary,
    this.isForeign,
    this.isTestDrive,
    this.marginOrCash,
    this.nickname,
    this.openedAt);

  factory Account.fromJson(Map<String, dynamic> json) =>
    _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() {
    return 'Account{accountNumber: $accountNumber, accountTypeName: $accountTypeName, dayTraderStatus: $dayTraderStatus, externalId: $externalId, investmentObjective: $investmentObjective, isFirmError: $isFirmError, isFirmProprietary: $isFirmProprietary, isForeign: $isForeign, isTestDrive: $isTestDrive, marginOrCash: $marginOrCash, nickname: $nickname, openedAt: $openedAt}';
  }
}
