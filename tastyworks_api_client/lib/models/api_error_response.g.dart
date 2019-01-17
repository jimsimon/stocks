// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) {
  return ApiErrorResponse(
      json['code'] as String,
      json['message'] as String,
      (json['errors'] as List)
          ?.map((e) => e == null
              ? null
              : ApiErrorDetail.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiErrorResponseToJson(ApiErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'errors': instance.errors
    };
