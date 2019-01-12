import 'package:json_annotation/json_annotation.dart';
import 'package:tastyworks_api_client/models/account.dart';

part 'account_with_level.g.dart';

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