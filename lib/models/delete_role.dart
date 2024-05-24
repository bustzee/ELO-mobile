import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_role.g.dart';

@JsonSerializable()
class DeleteRole extends Equatable {
  DeleteRole({
    required this.id,
  });

  final String? id;
  static const String idKey = "id";

  DeleteRole copyWith({
    String? id,
  }) {
    return DeleteRole(
      id: id ?? this.id,
    );
  }

  factory DeleteRole.fromJson(Map<String, dynamic> json) =>
      _$DeleteRoleFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRoleToJson(this);

  @override
  String toString() {
    return "$id, ";
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
