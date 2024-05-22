import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_role.g.dart';

@JsonSerializable()
class AdminRole extends Equatable {
  AdminRole({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final List<Datum>? data;
  static const String dataKey = "data";

  AdminRole copyWith({
    String? status,
    List<Datum>? data,
  }) {
    return AdminRole(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory AdminRole.fromJson(Map<String, dynamic> json) =>
      _$AdminRoleFromJson(json);

  Map<String, dynamic> toJson() => _$AdminRoleToJson(this);

  @override
  String toString() {
    return "$status, $data, ";
  }

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

@JsonSerializable()
class Datum extends Equatable {
  Datum({
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
  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  Datum copyWith({
    int? id,
    String? name,
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

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
