import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tutorial.g.dart';

@JsonSerializable()
class Tutorial extends Equatable {
    Tutorial({
        required this.status,
        required this.data,
    });

    final String? status;
    static const String statusKey = "status";
    
    final List<Datum>? data;
    static const String dataKey = "data";
    

    Tutorial copyWith({
        String? status,
        List<Datum>? data,
    }) {
        return Tutorial(
            status: status ?? this.status,
            data: data ?? this.data,
        );
    }

    factory Tutorial.fromJson(Map<String, dynamic> json) => _$TutorialFromJson(json);

    Map<String, dynamic> toJson() => _$TutorialToJson(this);

    @override
    String toString(){
        return "$status, $data, ";
    }

    @override
    List<Object?> get props => [
    status, data, ];
}

@JsonSerializable()
class Datum extends Equatable {
    Datum({
        required this.id,
        required this.type,
        required this.name,
        required this.description,
        required this.tutorialUrl,
        required this.documentAttachment,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;
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
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    Datum copyWith({
        int? id,
        String? type,
        String? name,
        String? description,
        String? tutorialUrl,
        String? documentAttachment,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) {
        return Datum(
            id: id ?? this.id,
            type: type ?? this.type,
            name: name ?? this.name,
            description: description ?? this.description,
            tutorialUrl: tutorialUrl ?? this.tutorialUrl,
            documentAttachment: documentAttachment ?? this.documentAttachment,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );
    }

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);

    @override
    String toString(){
        return "$id, $type, $name, $description, $tutorialUrl, $documentAttachment, $createdAt, $updatedAt, ";
    }

    @override
    List<Object?> get props => [
    id, type, name, description, tutorialUrl, documentAttachment, createdAt, updatedAt, ];
}
