// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stream_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStreamRequest _$CreateStreamRequestFromJson(Map<String, dynamic> json) =>
    CreateStreamRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CreateStreamRequestToJson(
        CreateStreamRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
