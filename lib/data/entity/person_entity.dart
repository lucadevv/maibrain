import 'package:cloud_firestore/cloud_firestore.dart';

class PersonEntity {
  final String photoUrl;
  final String voiceId;
  final String name;
  final String userId;
  final String personId;
  final List<Knowledge> knowledge;

  PersonEntity({
    required this.photoUrl,
    required this.voiceId,
    required this.name,
    required this.userId,
    required this.personId,
    required this.knowledge,
  });

  PersonEntity copyWith({
    String? photoUrl,
    String? voiceId,
    String? name,
    String? userId,
    String? personId,
    List<Knowledge>? knowledge,
  }) {
    return PersonEntity(
      photoUrl: photoUrl ?? this.photoUrl,
      voiceId: voiceId ?? this.voiceId,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      knowledge: knowledge ?? this.knowledge,
      personId: personId ?? this.personId,
    );
  }

  factory PersonEntity.fromDocument(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>?;

    if (map == null) {
      // Manejar el caso donde el documento no tiene datos
      throw Exception('El documento no contiene datos.');
    }

    return PersonEntity.fromMap(map);
  }

  factory PersonEntity.fromMap(Map<String, dynamic> map) {
    return PersonEntity(
      photoUrl: map["photoUrl"] as String? ?? '',
      voiceId: map["voiceId"] as String? ?? '',
      name: map["name"] as String? ?? '',
      userId: map["userId"] as String? ?? '',
      personId: map["personId"] as String,
      knowledge: (map["knowledge"] as List<dynamic>? ?? [])
          .map((item) => Knowledge.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  static List<PersonEntity> personFromDocList(QuerySnapshot query) {
    final iterable = query.docs;
    return iterable.map((doc) => PersonEntity.fromDocument(doc)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "photoUrl": photoUrl,
      "voiceId": voiceId,
      "name": name,
      "userId": userId,
      "knowledge": knowledge.map((item) => item.toJson()).toList(),
    };
  }
}

class Knowledge {
  final String description;
  final String title;

  Knowledge({
    required this.description,
    required this.title,
  });

  Knowledge copyWith({
    String? description,
    String? title,
  }) {
    return Knowledge(
      description: description ?? this.description,
      title: title ?? this.title,
    );
  }

  factory Knowledge.fromJson(Map<String, dynamic> json) {
    return Knowledge(
      description: json["description"] as String? ?? '',
      title: json["title"] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "title": title,
    };
  }
}
