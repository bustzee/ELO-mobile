import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_update_settings.g.dart';

@JsonSerializable()
class AdminUpdateSettings extends Equatable {
  AdminUpdateSettings({
    required this.vig,
    required this.extraVigDivisionFactor,
    required this.streamerPer,
    required this.noOfUserCanBet,
    required this.minWalletTrasferAmount,
    required this.hideTwitchStream,
    required this.clientId,
    required this.apiUsername,
    required this.apiPassword,
    required this.apiSignature,
    required this.environment,
  });

  final int? vig;
  static const String vigKey = "vig";

  @JsonKey(name: 'extra_vig_division_factor')
  final int? extraVigDivisionFactor;
  static const String extraVigDivisionFactorKey = "extra_vig_division_factor";

  @JsonKey(name: 'streamer_per')
  final int? streamerPer;
  static const String streamerPerKey = "streamer_per";

  @JsonKey(name: 'no_of_user_can_bet')
  final int? noOfUserCanBet;
  static const String noOfUserCanBetKey = "no_of_user_can_bet";

  @JsonKey(name: 'min_wallet_trasfer_amount')
  final int? minWalletTrasferAmount;
  static const String minWalletTrasferAmountKey = "min_wallet_trasfer_amount";

  @JsonKey(name: 'hide_twitch_stream')
  final bool? hideTwitchStream;
  static const String hideTwitchStreamKey = "hide_twitch_stream";

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

  AdminUpdateSettings copyWith({
    int? vig,
    int? extraVigDivisionFactor,
    int? streamerPer,
    int? noOfUserCanBet,
    int? minWalletTrasferAmount,
    bool? hideTwitchStream,
    String? clientId,
    String? apiUsername,
    String? apiPassword,
    String? apiSignature,
    String? environment,
  }) {
    return AdminUpdateSettings(
      vig: vig ?? this.vig,
      extraVigDivisionFactor:
          extraVigDivisionFactor ?? this.extraVigDivisionFactor,
      streamerPer: streamerPer ?? this.streamerPer,
      noOfUserCanBet: noOfUserCanBet ?? this.noOfUserCanBet,
      minWalletTrasferAmount:
          minWalletTrasferAmount ?? this.minWalletTrasferAmount,
      hideTwitchStream: hideTwitchStream ?? this.hideTwitchStream,
      clientId: clientId ?? this.clientId,
      apiUsername: apiUsername ?? this.apiUsername,
      apiPassword: apiPassword ?? this.apiPassword,
      apiSignature: apiSignature ?? this.apiSignature,
      environment: environment ?? this.environment,
    );
  }

  factory AdminUpdateSettings.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminUpdateSettingsToJson(this);

  @override
  String toString() {
    return "$vig, $extraVigDivisionFactor, $streamerPer, $noOfUserCanBet, $minWalletTrasferAmount, $hideTwitchStream, $clientId, $apiUsername, $apiPassword, $apiSignature, $environment, ";
  }

  @override
  List<Object?> get props => [
        vig,
        extraVigDivisionFactor,
        streamerPer,
        noOfUserCanBet,
        minWalletTrasferAmount,
        hideTwitchStream,
        clientId,
        apiUsername,
        apiPassword,
        apiSignature,
        environment,
      ];
}
