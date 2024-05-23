// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_streams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportedStreams _$ReportedStreamsFromJson(Map<String, dynamic> json) =>
    ReportedStreams(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportedStreamsToJson(ReportedStreams instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      streamId: (json['stream_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      streamName: json['stream_name'] as String?,
      streamType: json['stream_type'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      remark: json['remark'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'stream_id': instance.streamId,
      'name': instance.name,
      'stream_name': instance.streamName,
      'stream_type': instance.streamType,
      'email': instance.email,
      'mobile': instance.mobile,
      'remark': instance.remark,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
