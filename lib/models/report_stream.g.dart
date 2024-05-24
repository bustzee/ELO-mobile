// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportStream _$ReportStreamFromJson(Map<String, dynamic> json) => ReportStream(
      streamId: json['stream_id'] as String?,
      streamType: json['stream_type'] as String?,
      streamName: json['stream_name'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      reportFor: json['report_for'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$ReportStreamToJson(ReportStream instance) =>
    <String, dynamic>{
      'stream_id': instance.streamId,
      'stream_type': instance.streamType,
      'stream_name': instance.streamName,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'report_for': instance.reportFor,
      'remark': instance.remark,
    };
