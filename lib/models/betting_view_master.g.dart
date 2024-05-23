// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'betting_view_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BettingViewMaster _$BettingViewMasterFromJson(Map<String, dynamic> json) =>
    BettingViewMaster(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BettingViewMasterToJson(BettingViewMaster instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      noOfViews: (json['no_of_views'] as num?)?.toInt(),
      noOfBet: (json['no_of_bet'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'no_of_views': instance.noOfViews,
      'no_of_bet': instance.noOfBet,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
