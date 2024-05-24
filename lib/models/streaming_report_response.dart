import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'streaming_report_response.g.dart';

@JsonSerializable()
class StreamingReportResponse extends Equatable {
  StreamingReportResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final List<Datum>? data;
  static const String dataKey = "data";

  StreamingReportResponse copyWith({
    String? status,
    List<Datum>? data,
  }) {
    return StreamingReportResponse(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory StreamingReportResponse.fromJson(Map<String, dynamic> json) =>
      _$StreamingReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingReportResponseToJson(this);

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
    required this.streamerName,
    required this.totalStream,
    required this.totalBetCount,
    required this.totalAmount,
    required this.totalVigAmount,
    required this.streamerFee,
    required this.profit,
  });

  @JsonKey(name: 'streamer_name')
  final String? streamerName;
  static const String streamerNameKey = "streamer_name";

  @JsonKey(name: 'total_stream')
  final int? totalStream;
  static const String totalStreamKey = "total_stream";

  @JsonKey(name: 'total_bet_count')
  final int? totalBetCount;
  static const String totalBetCountKey = "total_bet_count";

  @JsonKey(name: 'total_amount')
  final int? totalAmount;
  static const String totalAmountKey = "total_amount";

  @JsonKey(name: 'total_vig_amount')
  final int? totalVigAmount;
  static const String totalVigAmountKey = "total_vig_amount";

  @JsonKey(name: 'streamer_fee')
  final int? streamerFee;
  static const String streamerFeeKey = "streamer_fee";

  final int? profit;
  static const String profitKey = "profit";

  Datum copyWith({
    String? streamerName,
    int? totalStream,
    int? totalBetCount,
    int? totalAmount,
    int? totalVigAmount,
    int? streamerFee,
    int? profit,
  }) {
    return Datum(
      streamerName: streamerName ?? this.streamerName,
      totalStream: totalStream ?? this.totalStream,
      totalBetCount: totalBetCount ?? this.totalBetCount,
      totalAmount: totalAmount ?? this.totalAmount,
      totalVigAmount: totalVigAmount ?? this.totalVigAmount,
      streamerFee: streamerFee ?? this.streamerFee,
      profit: profit ?? this.profit,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  String toString() {
    return "$streamerName, $totalStream, $totalBetCount, $totalAmount, $totalVigAmount, $streamerFee, $profit, ";
  }

  @override
  List<Object?> get props => [
        streamerName,
        totalStream,
        totalBetCount,
        totalAmount,
        totalVigAmount,
        streamerFee,
        profit,
      ];
}
