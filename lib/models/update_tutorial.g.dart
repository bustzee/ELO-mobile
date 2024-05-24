// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_tutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTutorial _$UpdateTutorialFromJson(Map<String, dynamic> json) =>
    UpdateTutorial(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      tutorialUrl: json['tutorial_url'] as String?,
      documentAttachment: json['document_attachment'] as String?,
    );

Map<String, dynamic> _$UpdateTutorialToJson(UpdateTutorial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'tutorial_url': instance.tutorialUrl,
      'document_attachment': instance.documentAttachment,
    };
