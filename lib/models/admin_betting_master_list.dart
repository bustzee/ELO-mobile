import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_betting_master_list.g.dart';

@JsonSerializable()
class AdminBettingMasterList extends Equatable {
  AdminBettingMasterList({
    required this.status,
    required this.message,
    required this.bettings,
  });

  final String? status;
  static const String statusKey = "status";

  final String? message;
  static const String messageKey = "message";

  final List<Betting>? bettings;
  static const String bettingsKey = "bettings";

  AdminBettingMasterList copyWith({
    String? status,
    String? message,
    List<Betting>? bettings,
  }) {
    return AdminBettingMasterList(
      status: status ?? this.status,
      message: message ?? this.message,
      bettings: bettings ?? this.bettings,
    );
  }

  factory AdminBettingMasterList.fromJson(Map<String, dynamic> json) =>
      _$AdminBettingMasterListFromJson(json);

  Map<String, dynamic> toJson() => _$AdminBettingMasterListToJson(this);

  @override
  String toString() {
    return "$status, $message, $bettings, ";
  }

  @override
  List<Object?> get props => [
        status,
        message,
        bettings,
      ];
}

@JsonSerializable()
class Betting extends Equatable {
  Betting({
    required this.id,
    required this.description,
    required this.addedBy,
    required this.bettingAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  final int? id;
  static const String idKey = "id";

  final String? description;
  static const String descriptionKey = "description";

  @JsonKey(name: 'added_by')
  final int? addedBy;
  static const String addedByKey = "added_by";

  @JsonKey(name: 'betting_amount')
  final String? bettingAmount;
  static const String bettingAmountKey = "betting_amount";

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  @JsonKey(name: 'is_active')
  final int? isActive;
  static const String isActiveKey = "is_active";

  Betting copyWith({
    int? id,
    String? description,
    int? addedBy,
    String? bettingAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isActive,
  }) {
    return Betting(
      id: id ?? this.id,
      description: description ?? this.description,
      addedBy: addedBy ?? this.addedBy,
      bettingAmount: bettingAmount ?? this.bettingAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
    );
  }

  factory Betting.fromJson(Map<String, dynamic> json) =>
      _$BettingFromJson(json);

  Map<String, dynamic> toJson() => _$BettingToJson(this);

  @override
  String toString() {
    return "$id, $description, $addedBy, $bettingAmount, $createdAt, $updatedAt, $isActive, ";
  }

  @override
  List<Object?> get props => [
        id,
        description,
        addedBy,
        bettingAmount,
        createdAt,
        updatedAt,
        isActive,
      ];
}
