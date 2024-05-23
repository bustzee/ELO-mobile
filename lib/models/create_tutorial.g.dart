// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_tutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTutorial _$CreateTutorialFromJson(Map<String, dynamic> json) =>
    CreateTutorial(
      type: json['type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      tutorialUrl: json['tutorial_url'] as String?,
      documentAttachment: json['document_attachment'] as String?,
    );

Map<String, dynamic> _$CreateTutorialToJson(CreateTutorial instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'tutorial_url': instance.tutorialUrl,
      'document_attachment': instance.documentAttachment,
    };
