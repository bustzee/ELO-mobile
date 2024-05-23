// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_betting_master_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminBettingMasterList _$AdminBettingMasterListFromJson(
        Map<String, dynamic> json) =>
    AdminBettingMasterList(
      status: json['status'] as String?,
      message: json['message'] as String?,
      bettings: (json['bettings'] as List<dynamic>?)
          ?.map((e) => Betting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminBettingMasterListToJson(
        AdminBettingMasterList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'bettings': instance.bettings,
    };

Betting _$BettingFromJson(Map<String, dynamic> json) => Betting(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      addedBy: (json['added_by'] as num?)?.toInt(),
      bettingAmount: json['betting_amount'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BettingToJson(Betting instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'added_by': instance.addedBy,
      'betting_amount': instance.bettingAmount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
