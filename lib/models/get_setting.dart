import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_setting.g.dart';

@JsonSerializable()
class GetSetting extends Equatable {
  GetSetting({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";

  GetSetting copyWith({
    String? status,
    Data? data,
  }) {
    return GetSetting(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory GetSetting.fromJson(Map<String, dynamic> json) =>
      _$GetSettingFromJson(json);

  Map<String, dynamic> toJson() => _$GetSettingToJson(this);

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
class Data extends Equatable {
  Data({
    required this.id,
    required this.vig,
    required this.extraVigDivisionFactor,
    required this.updatedAt,
    required this.noOfUserCanBet,
    required this.streamerPer,
    required this.minWalletTrasferAmount,
    required this.clientId,
    required this.apiUsername,
    required this.apiPassword,
    required this.apiSignature,
    required this.environment,
    required this.hideTwitchStream,
  });

  final int? id;
  static const String idKey = "id";

  final String? vig;
  static const String vigKey = "vig";

  @JsonKey(name: 'extra_vig_division_factor')
  final int? extraVigDivisionFactor;
  static const String extraVigDivisionFactorKey = "extra_vig_division_factor";

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  @JsonKey(name: 'no_of_user_can_bet')
  final int? noOfUserCanBet;
  static const String noOfUserCanBetKey = "no_of_user_can_bet";

  @JsonKey(name: 'streamer_per')
  final int? streamerPer;
  static const String streamerPerKey = "streamer_per";

  @JsonKey(name: 'min_wallet_trasfer_amount')
  final String? minWalletTrasferAmount;
  static const String minWalletTrasferAmountKey = "min_wallet_trasfer_amount";

  @JsonKey(name: 'client_id')
  final String? clientId;
  static const String clientIdKey = "client_id";

  @JsonKey(name: 'api_username')
  final String? apiUsername;
  static const String apiUsernameKey = "api_username";

  @JsonKey(name: 'api_password')
  final String? apiPassword;
  static const String apiPasswordKey = "api_password";

  @JsonKey(name: 'api_signature')
  final String? apiSignature;
  static const String apiSignatureKey = "api_signature";

  final String? environment;
  static const String environmentKey = "environment";

  @JsonKey(name: 'hide_twitch_stream')
  final int? hideTwitchStream;
  static const String hideTwitchStreamKey = "hide_twitch_stream";

  Data copyWith({
    int? id,
    String? vig,
    int? extraVigDivisionFactor,
    DateTime? updatedAt,
    int? noOfUserCanBet,
    int? streamerPer,
    String? minWalletTrasferAmount,
    String? clientId,
    String? apiUsername,
    String? apiPassword,
    String? apiSignature,
    String? environment,
    int? hideTwitchStream,
  }) {
    return Data(
      id: id ?? this.id,
      vig: vig ?? this.vig,
      extraVigDivisionFactor:
          extraVigDivisionFactor ?? this.extraVigDivisionFactor,
      updatedAt: updatedAt ?? this.updatedAt,
      noOfUserCanBet: noOfUserCanBet ?? this.noOfUserCanBet,
      streamerPer: streamerPer ?? this.streamerPer,
      minWalletTrasferAmount:
          minWalletTrasferAmount ?? this.minWalletTrasferAmount,
      clientId: clientId ?? this.clientId,
      apiUsername: apiUsername ?? this.apiUsername,
      apiPassword: apiPassword ?? this.apiPassword,
      apiSignature: apiSignature ?? this.apiSignature,
      environment: environment ?? this.environment,
      hideTwitchStream: hideTwitchStream ?? this.hideTwitchStream,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return "$id, $vig, $extraVigDivisionFactor, $updatedAt, $noOfUserCanBet, $streamerPer, $minWalletTrasferAmount, $clientId, $apiUsername, $apiPassword, $apiSignature, $environment, $hideTwitchStream, ";
  }

  @override
  List<Object?> get props => [
        id,
        vig,
        extraVigDivisionFactor,
        updatedAt,
        noOfUserCanBet,
        streamerPer,
        minWalletTrasferAmount,
        clientId,
        apiUsername,
        apiPassword,
        apiSignature,
        environment,
        hideTwitchStream,
      ];
}
