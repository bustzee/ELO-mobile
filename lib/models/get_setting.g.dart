// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSetting _$GetSettingFromJson(Map<String, dynamic> json) => GetSetting(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSettingToJson(GetSetting instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      vig: json['vig'] as String?,
      extraVigDivisionFactor:
          (json['extra_vig_division_factor'] as num?)?.toInt(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      noOfUserCanBet: (json['no_of_user_can_bet'] as num?)?.toInt(),
      streamerPer: (json['streamer_per'] as num?)?.toInt(),
      minWalletTrasferAmount: json['min_wallet_trasfer_amount'] as String?,
      clientId: json['client_id'] as String?,
      apiUsername: json['api_username'] as String?,
      apiPassword: json['api_password'] as String?,
      apiSignature: json['api_signature'] as String?,
      environment: json['environment'] as String?,
      hideTwitchStream: (json['hide_twitch_stream'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'vig': instance.vig,
      'extra_vig_division_factor': instance.extraVigDivisionFactor,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'no_of_user_can_bet': instance.noOfUserCanBet,
      'streamer_per': instance.streamerPer,
      'min_wallet_trasfer_amount': instance.minWalletTrasferAmount,
      'client_id': instance.clientId,
      'api_username': instance.apiUsername,
      'api_password': instance.apiPassword,
      'api_signature': instance.apiSignature,
      'environment': instance.environment,
      'hide_twitch_stream': instance.hideTwitchStream,
    };
