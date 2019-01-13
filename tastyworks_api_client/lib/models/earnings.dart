import 'package:json_annotation/json_annotation.dart';

part 'earnings.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Earnings {
  final String actualEps;
  final String consensusEstimate;
  final DateTime expectedReportDate;
  final bool isEstimated;
  final bool isVisible;
  final int lateFlag;
  final DateTime quarterEndDate;
  final String timeOfDayCode;

  Earnings(this.actualEps, this.consensusEstimate, this.expectedReportDate,
    this.isEstimated, this.isVisible, this.lateFlag, this.quarterEndDate,
    this.timeOfDayCode);

  factory Earnings.fromJson(Map<String, dynamic> json) =>
    _$EarningsFromJson(json);

  Map<String, dynamic> toJson() => _$EarningsToJson(this);

  @override
  String toString() {
    return 'Earnings{actualEps: $actualEps, consensusEstimate: $consensusEstimate, expectedReportDate: $expectedReportDate, isEstimated: $isEstimated, isVisible: $isVisible, lateFlag: $lateFlag, quarterEndDate: $quarterEndDate, timeOfDayCode: $timeOfDayCode}';
  }
}

