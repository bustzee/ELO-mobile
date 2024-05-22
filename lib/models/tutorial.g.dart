// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutorial _$TutorialFromJson(Map<String, dynamic> json) => Tutorial(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorialToJson(Tutorial instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      tutorialUrl: json['tutorial_url'] as String?,
      documentAttachment: json['document_attachment'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'tutorial_url': instance.tutorialUrl,
      'document_attachment': instance.documentAttachment,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
