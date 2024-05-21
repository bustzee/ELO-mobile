import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse extends Equatable {
    CommonResponse({
        required this.status,
        required this.message,
    });

    final String? status;
    static const String statusKey = "status";
    
    final String? message;
    static const String messageKey = "message";
    

    CommonResponse copyWith({
        String? status,
        String? message,
    }) {
        return CommonResponse(
            status: status ?? this.status,
            message: message ?? this.message,
        );
    }

    factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

    Map<String, dynamic> toJson() => _$CommonResponseToJson(this);

    @override
    String toString(){
        return "$status, $message, ";
    }

    @override
    List<Object?> get props => [
    status, message, ];
}
