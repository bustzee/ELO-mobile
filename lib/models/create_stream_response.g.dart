// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stream_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStreamResponse _$CreateStreamResponseFromJson(Map<String, dynamic> json) => CreateStreamResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      stream: json['stream'] == null
          ? null
          : Stream.fromJson(json['stream'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateStreamResponseToJson(CreateStreamResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'stream': instance.stream,
    };

Stream _$StreamFromJson(Map<String, dynamic> json) => Stream(
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      streamId: json['stream_id'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: (json['id'] as num?)?.toInt(),
      fileLink: json['fileLink'] as bool?,
    );

Map<String, dynamic> _$StreamToJson(Stream instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'stream_id': instance.streamId,
      'status': instance.status,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'fileLink': instance.fileLink,
    };
