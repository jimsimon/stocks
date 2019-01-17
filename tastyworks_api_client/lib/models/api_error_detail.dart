import 'package:json_annotation/json_annotation.dart';

part 'api_error_detail.g.dart';

@JsonSerializable()
class ApiErrorDetail {
  final String domain;
  final String reason;

  ApiErrorDetail(this.domain, this.reason);

  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) =>
    _$ApiErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorDetailToJson(this);

  @override
  String toString() {
    return 'ApiErrorDetail{domain: $domain, reason: $reason}';
  }
}