// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_betting_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBettingMaster _$UpdateBettingMasterFromJson(Map<String, dynamic> json) =>
    UpdateBettingMaster(
      id: (json['id'] as num?)?.toInt(),
      bettingAmount: (json['betting_amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      addedBy: json['added_by'] as bool?,
    );

Map<String, dynamic> _$UpdateBettingMasterToJson(
        UpdateBettingMaster instance) =>
    <String, dynamic>{
      'id': instance.id,
      'betting_amount': instance.bettingAmount,
      'description': instance.description,
      'added_by': instance.addedBy,
    };
