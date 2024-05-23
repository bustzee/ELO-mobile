import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_betting_view_record.g.dart';

@JsonSerializable()
class DeleteBettingViewRecord extends Equatable {
  DeleteBettingViewRecord({
    required this.id,
  });

  final String? id;
  static const String idKey = "id";

  DeleteBettingViewRecord copyWith({
    String? id,
  }) {
    return DeleteBettingViewRecord(
      id: id ?? this.id,
    );
  }

  factory DeleteBettingViewRecord.fromJson(Map<String, dynamic> json) =>
      _$DeleteBettingViewRecordFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteBettingViewRecordToJson(this);

  @override
  String toString() {
    return "$id, ";
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
