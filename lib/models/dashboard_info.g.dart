// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardInfo _$DashboardInfoFromJson(Map<String, dynamic> json) =>
    DashboardInfo(
      status: json['status'] as String?,
      users: (json['users'] as num?)?.toInt(),
      start: (json['start'] as num?)?.toInt(),
      stop: (json['stop'] as num?)?.toInt(),
      chat: (json['chat'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardInfoToJson(DashboardInfo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'users': instance.users,
      'start': instance.start,
      'stop': instance.stop,
      'chat': instance.chat,
    };
