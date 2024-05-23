import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'betting_disputes.g.dart';

@JsonSerializable()
class BettingDisputes extends Equatable {
  BettingDisputes({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final List<Datum>? data;
  static const String dataKey = "data";

  BettingDisputes copyWith({
    String? status,
    List<Datum>? data,
  }) {
    return BettingDisputes(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory BettingDisputes.fromJson(Map<String, dynamic> json) =>
      _$BettingDisputesFromJson(json);

  Map<String, dynamic> toJson() => _$BettingDisputesToJson(this);

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
    required this.streamId,
    required this.disputeFor,
    required this.betId,
    required this.userId,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  static const String idKey = "id";

  @JsonKey(name: 'stream_id')
  final int? streamId;
  static const String streamIdKey = "stream_id";

  @JsonKey(name: 'dispute_for')
  final String? disputeFor;
  static const String disputeForKey = "dispute_for";

  @JsonKey(name: 'bet_id')
  final int? betId;
  static const String betIdKey = "bet_id";

  @JsonKey(name: 'user_id')
  final int? userId;
  static const String userIdKey = "user_id";

  final String? remark;
  static const String remarkKey = "remark";

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  Datum copyWith({
    int? id,
    int? streamId,
    String? disputeFor,
    int? betId,
    int? userId,
    String? remark,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      streamId: streamId ?? this.streamId,
      disputeFor: disputeFor ?? this.disputeFor,
      betId: betId ?? this.betId,
      userId: userId ?? this.userId,
      remark: remark ?? this.remark,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  String toString() {
    return "$id, $streamId, $disputeFor, $betId, $userId, $remark, $createdAt, $updatedAt, ";
  }

  @override
  List<Object?> get props => [
        id,
        streamId,
        disputeFor,
        betId,
        userId,
        remark,
        createdAt,
        updatedAt,
      ];
}
