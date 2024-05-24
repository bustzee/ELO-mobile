import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_betting_master.g.dart';

@JsonSerializable()
class UpdateBettingMaster extends Equatable {
  UpdateBettingMaster({
    required this.id,
    required this.bettingAmount,
    required this.description,
    required this.addedBy,
  });

  final int? id;
  static const String idKey = "id";

  @JsonKey(name: 'betting_amount')
  final double? bettingAmount;
  static const String bettingAmountKey = "betting_amount";

  final String? description;
  static const String descriptionKey = "description";

  @JsonKey(name: 'added_by')
  final bool? addedBy;
  static const String addedByKey = "added_by";

  UpdateBettingMaster copyWith({
    int? id,
    double? bettingAmount,
    String? description,
    bool? addedBy,
  }) {
    return UpdateBettingMaster(
      id: id ?? this.id,
      bettingAmount: bettingAmount ?? this.bettingAmount,
      description: description ?? this.description,
      addedBy: addedBy ?? this.addedBy,
    );
  }

  factory UpdateBettingMaster.fromJson(Map<String, dynamic> json) =>
      _$UpdateBettingMasterFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBettingMasterToJson(this);

  @override
  String toString() {
    return "$id, $bettingAmount, $description, $addedBy, ";
  }

  @override
  List<Object?> get props => [
        id,
        bettingAmount,
        description,
        addedBy,
      ];
}
