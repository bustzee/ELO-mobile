import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_betting_view_master.g.dart';

@JsonSerializable()
class CreateBettingViewMaster extends Equatable {
  CreateBettingViewMaster({
    required this.noOfViews,
    required this.noOfBet,
  });

  @JsonKey(name: 'no_of_views')
  final String? noOfViews;
  static const String noOfViewsKey = "no_of_views";

  @JsonKey(name: 'no_of_bet')
  final String? noOfBet;
  static const String noOfBetKey = "no_of_bet";

  CreateBettingViewMaster copyWith({
    String? noOfViews,
    String? noOfBet,
  }) {
    return CreateBettingViewMaster(
      noOfViews: noOfViews ?? this.noOfViews,
      noOfBet: noOfBet ?? this.noOfBet,
    );
  }

  factory CreateBettingViewMaster.fromJson(Map<String, dynamic> json) =>
      _$CreateBettingViewMasterFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBettingViewMasterToJson(this);

  @override
  String toString() {
    return "$noOfViews, $noOfBet, ";
  }

  @override
  List<Object?> get props => [
        noOfViews,
        noOfBet,
      ];
}
