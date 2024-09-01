import 'dart:convert';

import 'package:maibrain/domain/models/request/message_model.dart';

class MessageEntity {
  final String personId;
  final String prompt;

  MessageEntity({
    required this.personId,
    required this.prompt,
  });

  MessageEntity copyWith({
    String? personId,
    String? prompt,
  }) =>
      MessageEntity(
        personId: personId ?? this.personId,
        prompt: prompt ?? this.prompt,
      );

  factory MessageEntity.fromJson(String source) {
    Map<String, dynamic> map = jsonDecode(source);
    return MessageEntity.fromMap(map);
  }

  factory MessageEntity.fromMap(Map<String, dynamic> map) {
    return MessageEntity(
      personId: map['personId'],
      prompt: map['prompt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "personId": personId,
        "prompt": prompt,
      };
  //TO MODEL

  factory MessageEntity.fromToModel({required MessageModel model}) =>
      MessageEntity(
        personId: model.personId,
        prompt: model.prompt,
      );
}
