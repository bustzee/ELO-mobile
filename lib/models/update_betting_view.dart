import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_betting_view.g.dart';

@JsonSerializable()
class UpdateBettingViewMaster extends Equatable {
  UpdateBettingViewMaster({
    required this.id,
    required this.noOfViews,
    required this.noOfBet,
  });

  final String? id;
  static const String idKey = "id";

  @JsonKey(name: 'no_of_views')
  final String? noOfViews;
  static const String noOfViewsKey = "no_of_views";

  @JsonKey(name: 'no_of_bet')
  final String? noOfBet;
  static const String noOfBetKey = "no_of_bet";

  UpdateBettingViewMaster copyWith({
    String? id,
    String? noOfViews,
    String? noOfBet,
  }) {
    return UpdateBettingViewMaster(
      id: id ?? this.id,
      noOfViews: noOfViews ?? this.noOfViews,
      noOfBet: noOfBet ?? this.noOfBet,
    );
  }

  factory UpdateBettingViewMaster.fromJson(Map<String, dynamic> json) =>
      _$UpdateBettingViewMasterFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBettingViewMasterToJson(this);

  @override
  String toString() {
    return "$id, $noOfViews, $noOfBet, ";
  }

  @override
  List<Object?> get props => [
        id,
        noOfViews,
        noOfBet,
      ];
}
