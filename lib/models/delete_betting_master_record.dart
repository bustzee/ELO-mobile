import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_betting_master_record.g.dart';

@JsonSerializable()
class DeleteBettingMasterRecord extends Equatable {
  DeleteBettingMasterRecord({
    required this.id,
  });

  final int? id;
  static const String idKey = "id";

  DeleteBettingMasterRecord copyWith({
    int? id,
  }) {
    return DeleteBettingMasterRecord(
      id: id ?? this.id,
    );
  }

  factory DeleteBettingMasterRecord.fromJson(Map<String, dynamic> json) =>
      _$DeleteBettingMasterRecordFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteBettingMasterRecordToJson(this);

  @override
  String toString() {
    return "$id, ";
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
