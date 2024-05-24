// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingReportResponse _$StreamingReportResponseFromJson(
        Map<String, dynamic> json) =>
    StreamingReportResponse(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StreamingReportResponseToJson(
        StreamingReportResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      streamerName: json['streamer_name'] as String?,
      totalStream: (json['total_stream'] as num?)?.toInt(),
      totalBetCount: (json['total_bet_count'] as num?)?.toInt(),
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      totalVigAmount: (json['total_vig_amount'] as num?)?.toInt(),
      streamerFee: (json['streamer_fee'] as num?)?.toInt(),
      profit: (json['profit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'streamer_name': instance.streamerName,
      'total_stream': instance.totalStream,
      'total_bet_count': instance.totalBetCount,
      'total_amount': instance.totalAmount,
      'total_vig_amount': instance.totalVigAmount,
      'streamer_fee': instance.streamerFee,
      'profit': instance.profit,
    };
