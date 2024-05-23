// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminUpdateSettings _$AdminUpdateSettingsFromJson(Map<String, dynamic> json) =>
    AdminUpdateSettings(
      vig: (json['vig'] as num?)?.toInt(),
      extraVigDivisionFactor:
          (json['extra_vig_division_factor'] as num?)?.toInt(),
      streamerPer: (json['streamer_per'] as num?)?.toInt(),
      noOfUserCanBet: (json['no_of_user_can_bet'] as num?)?.toInt(),
      minWalletTrasferAmount:
          (json['min_wallet_trasfer_amount'] as num?)?.toInt(),
      hideTwitchStream: json['hide_twitch_stream'] as bool?,
      clientId: json['client_id'] as String?,
      apiUsername: json['api_username'] as String?,
      apiPassword: json['api_password'] as String?,
      apiSignature: json['api_signature'] as String?,
      environment: json['environment'] as String?,
    );

Map<String, dynamic> _$AdminUpdateSettingsToJson(
        AdminUpdateSettings instance) =>
    <String, dynamic>{
      'vig': instance.vig,
      'extra_vig_division_factor': instance.extraVigDivisionFactor,
      'streamer_per': instance.streamerPer,
      'no_of_user_can_bet': instance.noOfUserCanBet,
      'min_wallet_trasfer_amount': instance.minWalletTrasferAmount,
      'hide_twitch_stream': instance.hideTwitchStream,
      'client_id': instance.clientId,
      'api_username': instance.apiUsername,
      'api_password': instance.apiPassword,
      'api_signature': instance.apiSignature,
      'environment': instance.environment,
    };
