import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_tutorial.g.dart';

@JsonSerializable()
class UpdateTutorial extends Equatable {
  UpdateTutorial({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.tutorialUrl,
    required this.documentAttachment,
  });

  final String? id;
  static const String idKey = "id";

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

  UpdateTutorial copyWith({
    String? id,
    String? type,
    String? name,
    String? description,
    String? tutorialUrl,
    String? documentAttachment,
  }) {
    return UpdateTutorial(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      tutorialUrl: tutorialUrl ?? this.tutorialUrl,
      documentAttachment: documentAttachment ?? this.documentAttachment,
    );
  }

  factory UpdateTutorial.fromJson(Map<String, dynamic> json) =>
      _$UpdateTutorialFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTutorialToJson(this);

  @override
  String toString() {
    return "$id, $type, $name, $description, $tutorialUrl, $documentAttachment, ";
  }

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        description,
        tutorialUrl,
        documentAttachment,
      ];
}
