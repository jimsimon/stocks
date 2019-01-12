import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponse {
  final String context;
  final Map data;

  ApiResponse(this.context, this.data);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
    _$ApiResponseFromJson(json);

  @override
  String toString() {
    return 'ApiResponse{context: $context, data: $data}';
  }
}