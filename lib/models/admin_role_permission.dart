import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_role_permission.g.dart';

@JsonSerializable()
class AdminRolePermission extends Equatable {
  AdminRolePermission({
    required this.status,
    required this.permissions,
  });

  final String? status;
  static const String statusKey = "status";

  final List<Permission>? permissions;
  static const String permissionsKey = "permissions";

  AdminRolePermission copyWith({
    String? status,
    List<Permission>? permissions,
  }) {
    return AdminRolePermission(
      status: status ?? this.status,
      permissions: permissions ?? this.permissions,
    );
  }

  factory AdminRolePermission.fromJson(Map<String, dynamic> json) =>
      _$AdminRolePermissionFromJson(json);

  Map<String, dynamic> toJson() => _$AdminRolePermissionToJson(this);

  @override
  String toString() {
    return "$status, $permissions, ";
  }

  @override
  List<Object?> get props => [
        status,
        permissions,
      ];
}

@JsonSerializable()
class Permission extends Equatable {
  Permission({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? slug;
  static const String slugKey = "slug";

  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  static const String createdAtKey = "created_at";

  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;
  static const String updatedAtKey = "updated_at";

  Permission copyWith({
    int? id,
    String? name,
    String? slug,
    dynamic? createdAt,
    dynamic? updatedAt,
  }) {
    return Permission(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);

  @override
  String toString() {
    return "$id, $name, $slug, $createdAt, $updatedAt, ";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        createdAt,
        updatedAt,
      ];
}
