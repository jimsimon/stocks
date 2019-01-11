import 'package:json_annotation/json_annotation.dart';

part 'data_transfer_objects.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponse {
  final String context;
  final Map data;

  ApiResponse(this.context, this.data);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
    _$ApiResponseFromJson(json);
}

@JsonSerializable()
class Session {
  final User user;
  final String sessionToken;

  Session(this.user, this.sessionToken);

  factory Session.fromJson(Map<String, dynamic> json) =>
    _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable()
class User {
  final String email;
  final String username;
  final String externalId;

  User(this.email, this.username, this.externalId);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class SessionValidation {
  final String email;
  final String username;
  final String externalId;
  final int id;

  SessionValidation(this.email, this.username, this.externalId, this.id);

  factory SessionValidation.fromJson(Map<String, dynamic> json) =>
    _$SessionValidationFromJson(json);

  Map<String, dynamic> toJson() => _$SessionValidationToJson(this);
}

@JsonSerializable()
class AccountWithLevel {
  final Account account;
  final String authorityLevel;

  AccountWithLevel(this.account, this.authorityLevel);

  factory AccountWithLevel.fromJson(Map<String, dynamic> json) =>
    _$AccountWithLevelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountWithLevelToJson(this);

  @override
  String toString() {
    return 'AccountWithLevel{account: $account, authorityLevel: $authorityLevel}';
  }
}

@JsonSerializable(fieldRename: FieldRename.kebab)
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

  Account(this.accountNumber, this.accountTypeName, this.dayTraderStatus,
    this.externalId, this.investmentObjective, this.isFirmError,
    this.isFirmProprietary, this.isForeign, this.isTestDrive,
    this.marginOrCash, this.nickname, this.openedAt);

  factory Account.fromJson(Map<String, dynamic> json) =>
    _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() {
    return 'Account{accountNumber: $accountNumber, accountTypeName: $accountTypeName, dayTraderStatus: $dayTraderStatus, externalId: $externalId, investmentObjective: $investmentObjective, isFirmError: $isFirmError, isFirmProprietary: $isFirmProprietary, isForeign: $isForeign, isTestDrive: $isTestDrive, marginOrCash: $marginOrCash, nickname: $nickname, openedAt: $openedAt}';
  }
}