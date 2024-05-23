import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_betting_master.g.dart';

@JsonSerializable()
class CreateBettingMaster extends Equatable {
  CreateBettingMaster({
    required this.bettingAmount,
    required this.description,
    required this.addedBy,
  });

  @JsonKey(name: 'betting_amount')
  final double? bettingAmount;
  static const String bettingAmountKey = "betting_amount";

  final String? description;
  static const String descriptionKey = "description";

  @JsonKey(name: 'added_by')
  final bool? addedBy;
  static const String addedByKey = "added_by";

  CreateBettingMaster copyWith({
    double? bettingAmount,
    String? description,
    bool? addedBy,
  }) {
    return CreateBettingMaster(
      bettingAmount: bettingAmount ?? this.bettingAmount,
      description: description ?? this.description,
      addedBy: addedBy ?? this.addedBy,
    );
  }

  factory CreateBettingMaster.fromJson(Map<String, dynamic> json) =>
      _$CreateBettingMasterFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBettingMasterToJson(this);

  @override
  String toString() {
    return "$bettingAmount, $description, $addedBy, ";
  }

  @override
  List<Object?> get props => [
        bettingAmount,
        description,
        addedBy,
      ];
}
