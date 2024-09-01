import 'package:maibrain/data/entity/request/message_entity.dart';

class MessageModel {
  final String personId;
  final String prompt;

  MessageModel({
    required this.personId,
    required this.prompt,
  });

  MessageModel copyWith({
    String? personId,
    String? prompt,
  }) =>
      MessageModel(
        personId: personId ?? this.personId,
        prompt: prompt ?? this.prompt,
      );

  factory MessageModel.empty() {
    return MessageModel(
      personId: '',
      prompt: '',
    );
  }

  //TO MODEL
  factory MessageModel.fromToEntity(MessageEntity entity) {
    return MessageModel(
      personId: entity.personId,
      prompt: entity.prompt,
    );
  }
}
