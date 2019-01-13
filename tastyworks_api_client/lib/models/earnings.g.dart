// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Earnings _$EarningsFromJson(Map<String, dynamic> json) {
  return Earnings(
      json['actual_eps'] as String,
      json['consensus_estimate'] as String,
      json['expected_report_date'] == null
          ? null
          : DateTime.parse(json['expected_report_date'] as String),
      json['is_estimated'] as bool,
      json['is_visible'] as bool,
      json['late_flag'] as int,
      json['quarter_end_date'] == null
          ? null
          : DateTime.parse(json['quarter_end_date'] as String),
      json['time_of_day_code'] as String);
}

Map<String, dynamic> _$EarningsToJson(Earnings instance) => <String, dynamic>{
      'actual_eps': instance.actualEps,
      'consensus_estimate': instance.consensusEstimate,
      'expected_report_date': instance.expectedReportDate?.toIso8601String(),
      'is_estimated': instance.isEstimated,
      'is_visible': instance.isVisible,
      'late_flag': instance.lateFlag,
      'quarter_end_date': instance.quarterEndDate?.toIso8601String(),
      'time_of_day_code': instance.timeOfDayCode
    };
