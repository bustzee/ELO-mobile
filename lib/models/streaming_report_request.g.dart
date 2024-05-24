// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingReportRequest _$StreamingReportRequestFromJson(
        Map<String, dynamic> json) =>
    StreamingReportRequest(
      fromDate: json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      toDate: json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
    );

Map<String, dynamic> _$StreamingReportRequestToJson(
        StreamingReportRequest instance) =>
    <String, dynamic>{
      'from_date': instance.fromDate?.toIso8601String(),
      'to_date': instance.toDate?.toIso8601String(),
    };
