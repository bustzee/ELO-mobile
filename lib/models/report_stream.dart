import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_stream.g.dart';

@JsonSerializable()
class ReportStream extends Equatable {
    ReportStream({
        required this.streamId,
        required this.streamType,
        required this.streamName,
        required this.name,
        required this.email,
        required this.mobile,
        required this.reportFor,
        required this.remark,
    });

    @JsonKey(name: 'stream_id') 
    final String? streamId;
    static const String streamIdKey = "stream_id";
    

    @JsonKey(name: 'stream_type') 
    final String? streamType;
    static const String streamTypeKey = "stream_type";
    

    @JsonKey(name: 'stream_name') 
    final String? streamName;
    static const String streamNameKey = "stream_name";
    
    final String? name;
    static const String nameKey = "name";
    
    final String? email;
    static const String emailKey = "email";
    
    final String? mobile;
    static const String mobileKey = "mobile";
    

    @JsonKey(name: 'report_for') 
    final String? reportFor;
    static const String reportForKey = "report_for";
    
    final String? remark;
    static const String remarkKey = "remark";
    

    ReportStream copyWith({
        String? streamId,
        String? streamType,
        String? streamName,
        String? name,
        String? email,
        String? mobile,
        String? reportFor,
        String? remark,
    }) {
        return ReportStream(
            streamId: streamId ?? this.streamId,
            streamType: streamType ?? this.streamType,
            streamName: streamName ?? this.streamName,
            name: name ?? this.name,
            email: email ?? this.email,
            mobile: mobile ?? this.mobile,
            reportFor: reportFor ?? this.reportFor,
            remark: remark ?? this.remark,
        );
    }

    factory ReportStream.fromJson(Map<String, dynamic> json) => _$ReportStreamFromJson(json);

    Map<String, dynamic> toJson() => _$ReportStreamToJson(this);

    @override
    String toString(){
        return "$streamId, $streamType, $streamName, $name, $email, $mobile, $reportFor, $remark, ";
    }

    @override
    List<Object?> get props => [
    streamId, streamType, streamName, name, email, mobile, reportFor, remark, ];
}
