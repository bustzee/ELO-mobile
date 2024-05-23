import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reported_streams.g.dart';

@JsonSerializable()
class ReportedStreams extends Equatable {
  ReportedStreams({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final List<Datum>? data;
  static const String dataKey = "data";

  ReportedStreams copyWith({
    String? status,
    List<Datum>? data,
  }) {
    return ReportedStreams(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory ReportedStreams.fromJson(Map<String, dynamic> json) =>
      _$ReportedStreamsFromJson(json);

  Map<String, dynamic> toJson() => _$ReportedStreamsToJson(this);

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
    required this.id,
    required this.streamId,
    required this.name,
    required this.streamName,
    required this.streamType,
    required this.email,
    required this.mobile,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  static const String idKey = "id";

  @JsonKey(name: 'stream_id')
  final int? streamId;
  static const String streamIdKey = "stream_id";

  final String? name;
  static const String nameKey = "name";

  @JsonKey(name: 'stream_name')
  final String? streamName;
  static const String streamNameKey = "stream_name";

  @JsonKey(name: 'stream_type')
  final String? streamType;
  static const String streamTypeKey = "stream_type";

  final String? email;
  static const String emailKey = "email";

  final String? mobile;
  static const String mobileKey = "mobile";

  final String? remark;
  static const String remarkKey = "remark";

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  Datum copyWith({
    int? id,
    int? streamId,
    String? name,
    String? streamName,
    String? streamType,
    String? email,
    String? mobile,
    String? remark,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      streamId: streamId ?? this.streamId,
      name: name ?? this.name,
      streamName: streamName ?? this.streamName,
      streamType: streamType ?? this.streamType,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      remark: remark ?? this.remark,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  String toString() {
    return "$id, $streamId, $name, $streamName, $streamType, $email, $mobile, $remark, $createdAt, $updatedAt, ";
  }

  @override
  List<Object?> get props => [
        id,
        streamId,
        name,
        streamName,
        streamType,
        email,
        mobile,
        remark,
        createdAt,
        updatedAt,
      ];
}
