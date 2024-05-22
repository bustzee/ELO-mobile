// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminRole _$AdminRoleFromJson(Map<String, dynamic> json) => AdminRole(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminRoleToJson(AdminRole instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
