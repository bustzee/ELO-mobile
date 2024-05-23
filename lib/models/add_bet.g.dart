// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetDetails _$BetDetailsFromJson(Map<String, dynamic> json) => BetDetails(
      gameId: (json['game_id'] as num?)?.toInt(),
      bettingId: json['betting_id'] as String?,
      customAmount: (json['custom_amount'] as num?)?.toInt(),
      forText: json['for_text'] as String?,
      againstText: json['against_text'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BetDetailsToJson(BetDetails instance) =>
    <String, dynamic>{
      'game_id': instance.gameId,
      'betting_id': instance.bettingId,
      'custom_amount': instance.customAmount,
      'for_text': instance.forText,
      'against_text': instance.againstText,
      'description': instance.description,
    };
