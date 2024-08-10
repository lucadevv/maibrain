import 'package:maibrain/data/entity/person_entity.dart';

class PersonModel {
  final String photoUrl;
  final String voiceId;
  final String name;
  final String userId;
  final List<KnowledgeModel> knowledge;

  PersonModel({
    required this.photoUrl,
    required this.voiceId,
    required this.name,
    required this.userId,
    required this.knowledge,
  });

  PersonModel copyWith({
    String? photoUrl,
    String? voiceId,
    String? name,
    String? userId,
    List<KnowledgeModel>? knowledge,
  }) =>
      PersonModel(
        photoUrl: photoUrl ?? this.photoUrl,
        voiceId: voiceId ?? this.voiceId,
        name: name ?? this.name,
        userId: userId ?? this.userId,
        knowledge: knowledge ?? this.knowledge,
      );
  factory PersonModel.fromEntity(PersonEntity entity) {
    return PersonModel(
      photoUrl: entity.photoUrl,
      voiceId: entity.voiceId,
      name: entity.name,
      userId: entity.userId,
      knowledge: entity.knowledge
          .map((knowledge) => KnowledgeModel.fromEntity(knowledge))
          .toList(),
    );
  }

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        photoUrl: json["photoUrl"],
        voiceId: json["voiceId"],
        name: json["name"],
        userId: json["userId"],
        knowledge: List<KnowledgeModel>.from(
            json["knowledge"].map((x) => KnowledgeModel.fromJson(x))),
      );

  factory PersonModel.empty() {
    return PersonModel(
      photoUrl: '',
      voiceId: '',
      name: '',
      userId: '',
      knowledge: [],
    );
  }

  Map<String, dynamic> toJson() => {
        "photoUrl": photoUrl,
        "voiceId": voiceId,
        "name": name,
        "userId": userId,
        "knowledge": List<dynamic>.from(knowledge.map((x) => x.toJson())),
      };
}

class KnowledgeModel {
  final String description;
  final String title;

  KnowledgeModel({
    required this.description,
    required this.title,
  });

  KnowledgeModel copyWith({
    String? description,
    String? title,
  }) =>
      KnowledgeModel(
        description: description ?? this.description,
        title: title ?? this.title,
      );
  factory KnowledgeModel.fromEntity(Knowledge entity) {
    return KnowledgeModel(
      description: entity.description,
      title: entity.title,
    );
  }

  factory KnowledgeModel.fromJson(Map<String, dynamic> json) => KnowledgeModel(
        description: json["description"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
      };
}
