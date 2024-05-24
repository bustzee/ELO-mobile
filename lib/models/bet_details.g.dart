// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetDetails _$BetDetailsFromJson(Map<String, dynamic> json) => BetDetails(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BetDetailsToJson(BetDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      streamName: json['stream_name'] as String?,
      description: json['description'] as String?,
      potAmount: (json['pot_amount'] as num?)?.toInt(),
      bets: (json['bets'] as List<dynamic>?)
          ?.map((e) => Bet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'stream_name': instance.streamName,
      'description': instance.description,
      'pot_amount': instance.potAmount,
      'bets': instance.bets,
    };

Bet _$BetFromJson(Map<String, dynamic> json) => Bet(
      betType: json['bet_type'] as String?,
      description: json['description'] as String?,
      betFor: json['bet_for'] as String?,
      gameId: json['game_id'] as String?,
      betAgainst: json['bet_against'] as String?,
      winningAmount: json['winning_amount'] as String?,
      noOfBets: json['no_of_bets'] as String?,
      activeHours: json['active_hours'] as String?,
      status: json['status'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BetToJson(Bet instance) => <String, dynamic>{
      'bet_type': instance.betType,
      'description': instance.description,
      'bet_for': instance.betFor,
      'game_id': instance.gameId,
      'bet_against': instance.betAgainst,
      'winning_amount': instance.winningAmount,
      'no_of_bets': instance.noOfBets,
      'active_hours': instance.activeHours,
      'status': instance.status,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      betOn: json['bet_on'] as String?,
      betAmount: json['bet_amount'] as String?,
      vig: json['vig'] as String?,
      total: (json['total'] as num?)?.toInt(),
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
      winningAmount: json['winning_amount'],
      isBetted: json['is_betted'] as bool?,
      isWon: json['is_won'],
      isClaimed: json['is_claimed'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'bet_on': instance.betOn,
      'bet_amount': instance.betAmount,
      'vig': instance.vig,
      'total': instance.total,
      'created_on': instance.createdOn?.toIso8601String(),
      'winning_amount': instance.winningAmount,
      'is_betted': instance.isBetted,
      'is_won': instance.isWon,
      'is_claimed': instance.isClaimed,
    };
