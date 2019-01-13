import 'package:json_annotation/json_annotation.dart';

part 'iv_percentile_input.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IVPercentileInput {
  @JsonKey(name: 'mean_1y') final String mean1y;
  @JsonKey(name: 'mean_6m') final String mean6m;
  @JsonKey(name: 'mean_30d') final String mean30d;
  @JsonKey(name: 'mean_60d') final String mean60d;
  final DateTime snapshotAt;
  @JsonKey(name: 'standard_deviation_1y') final String standardDeviation1y;
  @JsonKey(name: 'standard_deviation_6m') final String standardDeviation6m;
  @JsonKey(name: 'standard_deviation_30d') final String standardDeviation30d;
  @JsonKey(name: 'standard_deviation_60d') final String standardDeviation60d;

  IVPercentileInput(this.mean1y, this.mean6m, this.mean30d, this.mean60d,
    this.snapshotAt, this.standardDeviation1y, this.standardDeviation6m,
    this.standardDeviation30d, this.standardDeviation60d);

  factory IVPercentileInput.fromJson(Map<String, dynamic> json) =>
    _$IVPercentileInputFromJson(json);

  Map<String, dynamic> toJson() => _$IVPercentileInputToJson(this);

  @override
  String toString() {
    return 'IVPercentileInput{mean1y: $mean1y, mean6m: $mean6m, mean30d: $mean30d, mean60d: $mean60d, snapshotAt: $snapshotAt, standardDeviation1y: $standardDeviation1y, standardDeviation6m: $standardDeviation6m, standardDeviation30d: $standardDeviation30d, standardDeviation60d: $standardDeviation60d}';
  }
}