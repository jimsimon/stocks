// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorDetail _$ApiErrorDetailFromJson(Map<String, dynamic> json) {
  return ApiErrorDetail(json['domain'] as String, json['reason'] as String);
}

Map<String, dynamic> _$ApiErrorDetailToJson(ApiErrorDetail instance) =>
    <String, dynamic>{'domain': instance.domain, 'reason': instance.reason};
