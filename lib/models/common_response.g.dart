// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) =>
    CommonResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
