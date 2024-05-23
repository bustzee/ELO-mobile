// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_betting_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBettingMaster _$CreateBettingMasterFromJson(Map<String, dynamic> json) =>
    CreateBettingMaster(
      bettingAmount: (json['betting_amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      addedBy: json['added_by'] as bool?,
    );

Map<String, dynamic> _$CreateBettingMasterToJson(
        CreateBettingMaster instance) =>
    <String, dynamic>{
      'betting_amount': instance.bettingAmount,
      'description': instance.description,
      'added_by': instance.addedBy,
    };
