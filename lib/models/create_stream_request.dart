import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_stream_request.g.dart';

@JsonSerializable()
class CreateStreamRequest extends Equatable {
    CreateStreamRequest({
        required this.name,
        required this.description,
        required this.image,
    });

    final String? name;
    static const String nameKey = "name";
    
    final String? description;
    static const String descriptionKey = "description";
    
    final String? image;
    static const String imageKey = "image";
    

    CreateStreamRequest copyWith({
        String? name,
        String? description,
        String? image,
    }) {
        return CreateStreamRequest(
            name: name ?? this.name,
            description: description ?? this.description,
            image: image ?? this.image,
        );
    }

    factory CreateStreamRequest.fromJson(Map<String, dynamic> json) => _$CreateStreamRequestFromJson(json);

    Map<String, dynamic> toJson() => _$CreateStreamRequestToJson(this);

    @override
    String toString(){
        return "$name, $description, $image, ";
    }

    @override
    List<Object?> get props => [
    name, description, image, ];
}
