// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iv_percentile_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IVPercentileInput _$IVPercentileInputFromJson(Map<String, dynamic> json) {
  return IVPercentileInput(
      json['mean_1y'] as String,
      json['mean_6m'] as String,
      json['mean_30d'] as String,
      json['mean_60d'] as String,
      json['snapshot_at'] == null
          ? null
          : DateTime.parse(json['snapshot_at'] as String),
      json['standard_deviation_1y'] as String,
      json['standard_deviation_6m'] as String,
      json['standard_deviation_30d'] as String,
      json['standard_deviation_60d'] as String);
}

Map<String, dynamic> _$IVPercentileInputToJson(IVPercentileInput instance) =>
    <String, dynamic>{
      'mean_1y': instance.mean1y,
      'mean_6m': instance.mean6m,
      'mean_30d': instance.mean30d,
      'mean_60d': instance.mean60d,
      'snapshot_at': instance.snapshotAt?.toIso8601String(),
      'standard_deviation_1y': instance.standardDeviation1y,
      'standard_deviation_6m': instance.standardDeviation6m,
      'standard_deviation_30d': instance.standardDeviation30d,
      'standard_deviation_60d': instance.standardDeviation60d
    };
