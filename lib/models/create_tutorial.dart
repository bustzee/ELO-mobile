import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_tutorial.g.dart';

@JsonSerializable()
class CreateTutorial extends Equatable {
  CreateTutorial({
    required this.type,
    required this.name,
    required this.description,
    required this.tutorialUrl,
    required this.documentAttachment,
  });

  final String? type;
  static const String typeKey = "type";

  final String? name;
  static const String nameKey = "name";

  final String? description;
  static const String descriptionKey = "description";

  @JsonKey(name: 'tutorial_url')
  final String? tutorialUrl;
  static const String tutorialUrlKey = "tutorial_url";

  @JsonKey(name: 'document_attachment')
  final String? documentAttachment;
  static const String documentAttachmentKey = "document_attachment";

  CreateTutorial copyWith({
    String? type,
    String? name,
    String? description,
    String? tutorialUrl,
    String? documentAttachment,
  }) {
    return CreateTutorial(
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      tutorialUrl: tutorialUrl ?? this.tutorialUrl,
      documentAttachment: documentAttachment ?? this.documentAttachment,
    );
  }

  factory CreateTutorial.fromJson(Map<String, dynamic> json) =>
      _$CreateTutorialFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTutorialToJson(this);

  @override
  String toString() {
    return "$type, $name, $description, $tutorialUrl, $documentAttachment, ";
  }

  @override
  List<Object?> get props => [
        type,
        name,
        description,
        tutorialUrl,
        documentAttachment,
      ];
}
