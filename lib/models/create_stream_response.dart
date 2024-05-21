import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_stream_response.g.dart';

@JsonSerializable()
class CreateStreamResponse extends Equatable {
    CreateStreamResponse({
        required this.status,
        required this.message,
        required this.stream,
    });

    final String? status;
    static const String statusKey = "status";
    
    final String? message;
    static const String messageKey = "message";
    
    final Stream? stream;
    static const String streamKey = "stream";
    

    CreateStreamResponse copyWith({
        String? status,
        String? message,
        Stream? stream,
    }) {
        return CreateStreamResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            stream: stream ?? this.stream,
        );
    }

    factory CreateStreamResponse.fromJson(Map<String, dynamic> json) => _$CreateStreamResponseFromJson(json);

    Map<String, dynamic> toJson() => _$CreateStreamResponseToJson(this);

    @override
    String toString(){
        return "$status, $message, $stream, ";
    }

    @override
    List<Object?> get props => [
    status, message, stream, ];
}

@JsonSerializable()
class Stream extends Equatable {
    Stream({
        required this.userId,
        required this.name,
        required this.description,
        required this.image,
        required this.streamId,
        required this.status,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
        required this.fileLink,
    });

    @JsonKey(name: 'user_id') 
    final int? userId;
    static const String userIdKey = "user_id";
    
    final String? name;
    static const String nameKey = "name";
    
    final String? description;
    static const String descriptionKey = "description";
    
    final String? image;
    static const String imageKey = "image";
    

    @JsonKey(name: 'stream_id') 
    final String? streamId;
    static const String streamIdKey = "stream_id";
    
    final String? status;
    static const String statusKey = "status";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    
    final int? id;
    static const String idKey = "id";
    
    final bool? fileLink;
    static const String fileLinkKey = "fileLink";
    

    Stream copyWith({
        int? userId,
        String? name,
        String? description,
        String? image,
        String? streamId,
        String? status,
        DateTime? updatedAt,
        DateTime? createdAt,
        int? id,
        bool? fileLink,
    }) {
        return Stream(
            userId: userId ?? this.userId,
            name: name ?? this.name,
            description: description ?? this.description,
            image: image ?? this.image,
            streamId: streamId ?? this.streamId,
            status: status ?? this.status,
            updatedAt: updatedAt ?? this.updatedAt,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
            fileLink: fileLink ?? this.fileLink,
        );
    }

    factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);

    Map<String, dynamic> toJson() => _$StreamToJson(this);

    @override
    String toString(){
        return "$userId, $name, $description, $image, $streamId, $status, $updatedAt, $createdAt, $id, $fileLink, ";
    }

    @override
    List<Object?> get props => [
    userId, name, description, image, streamId, status, updatedAt, createdAt, id, fileLink, ];
}
