import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'streaming_report_request.g.dart';

@JsonSerializable()
class StreamingReportRequest extends Equatable {
  StreamingReportRequest({
    required this.fromDate,
    required this.toDate,
  });

  @JsonKey(name: 'from_date')
  final DateTime? fromDate;
  static const String fromDateKey = "from_date";

  @JsonKey(name: 'to_date')
  final DateTime? toDate;
  static const String toDateKey = "to_date";

  StreamingReportRequest copyWith({
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return StreamingReportRequest(
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }

  factory StreamingReportRequest.fromJson(Map<String, dynamic> json) =>
      _$StreamingReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingReportRequestToJson(this);

  @override
  String toString() {
    return "$fromDate, $toDate, ";
  }

  @override
  List<Object?> get props => [
        fromDate,
        toDate,
      ];
}
