// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_role_permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminRolePermission _$AdminRolePermissionFromJson(Map<String, dynamic> json) =>
    AdminRolePermission(
      status: json['status'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminRolePermissionToJson(
        AdminRolePermission instance) =>
    <String, dynamic>{
      'status': instance.status,
      'permissions': instance.permissions,
    };

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
