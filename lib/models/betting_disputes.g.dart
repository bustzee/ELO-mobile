// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'betting_disputes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BettingDisputes _$BettingDisputesFromJson(Map<String, dynamic> json) =>
    BettingDisputes(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BettingDisputesToJson(BettingDisputes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      streamId: (json['stream_id'] as num?)?.toInt(),
      disputeFor: json['dispute_for'] as String?,
      betId: (json['bet_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
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
      'dispute_for': instance.disputeFor,
      'bet_id': instance.betId,
      'user_id': instance.userId,
      'remark': instance.remark,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
