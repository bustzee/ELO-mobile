import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'betting_view_master.g.dart';

@JsonSerializable()
class BettingViewMaster extends Equatable {
  BettingViewMaster({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final List<Datum>? data;
  static const String dataKey = "data";

  BettingViewMaster copyWith({
    String? status,
    List<Datum>? data,
  }) {
    return BettingViewMaster(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory BettingViewMaster.fromJson(Map<String, dynamic> json) =>
      _$BettingViewMasterFromJson(json);

  Map<String, dynamic> toJson() => _$BettingViewMasterToJson(this);

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
    required this.noOfViews,
    required this.noOfBet,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  static const String idKey = "id";

  @JsonKey(name: 'no_of_views')
  final int? noOfViews;
  static const String noOfViewsKey = "no_of_views";

  @JsonKey(name: 'no_of_bet')
  final int? noOfBet;
  static const String noOfBetKey = "no_of_bet";

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  Datum copyWith({
    int? id,
    int? noOfViews,
    int? noOfBet,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      noOfViews: noOfViews ?? this.noOfViews,
      noOfBet: noOfBet ?? this.noOfBet,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  String toString() {
    return "$id, $noOfViews, $noOfBet, $createdAt, $updatedAt, ";
  }

  @override
  List<Object?> get props => [
        id,
        noOfViews,
        noOfBet,
        createdAt,
        updatedAt,
      ];
}
