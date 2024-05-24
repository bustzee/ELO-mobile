// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bet_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBetDetails _$UserBetDetailsFromJson(Map<String, dynamic> json) =>
    UserBetDetails(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBetDetailsToJson(UserBetDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userBets: (json['user_bets'] as List<dynamic>?)
          ?.map((e) => UserBet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user_bets': instance.userBets,
    };

UserBet _$UserBetFromJson(Map<String, dynamic> json) => UserBet(
      betMainId: (json['bet_main_id'] as num?)?.toInt(),
      gameId: json['game_id'] as String?,
      amount: json['amount'] as String?,
      isClaimed: (json['is_claimed'] as num?)?.toInt(),
      claimedDate: json['claimed_date'] == null
          ? null
          : DateTime.parse(json['claimed_date'] as String),
      betDetails: json['bet_details'] == null
          ? null
          : BetDetails.fromJson(json['bet_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBetToJson(UserBet instance) => <String, dynamic>{
      'bet_main_id': instance.betMainId,
      'game_id': instance.gameId,
      'amount': instance.amount,
      'is_claimed': instance.isClaimed,
      'claimed_date': instance.claimedDate?.toIso8601String(),
      'bet_details': instance.betDetails,
    };

BetDetails _$BetDetailsFromJson(Map<String, dynamic> json) => BetDetails(
      betType: json['bet_type'] as String?,
      description: json['description'] as String?,
      betFor: json['bet_for'] as String?,
      betAgainst: json['bet_against'] as String?,
      winningAmount: json['winning_amount'] as String?,
      status: json['status'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BetDetailsToJson(BetDetails instance) =>
    <String, dynamic>{
      'bet_type': instance.betType,
      'description': instance.description,
      'bet_for': instance.betFor,
      'bet_against': instance.betAgainst,
      'winning_amount': instance.winningAmount,
      'status': instance.status,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      betOn: json['bet_on'] as String?,
      betAmount: json['bet_amount'] as String?,
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
      winningAmount: json['winning_amount'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'bet_on': instance.betOn,
      'bet_amount': instance.betAmount,
      'created_on': instance.createdOn?.toIso8601String(),
      'winning_amount': instance.winningAmount,
    };
