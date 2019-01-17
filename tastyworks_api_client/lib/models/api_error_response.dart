import 'package:json_annotation/json_annotation.dart';
import 'package:tastyworks_api_client/models/api_error_detail.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse {
  final String code;
  final String message;
  final List<ApiErrorDetail> errors;

  ApiErrorResponse(this.code, this.message, this.errors);

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
    _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);

  @override
  String toString() {
    return 'ApiErrorResponse{code: $code, message: $message, errors: $errors}';
  }
}