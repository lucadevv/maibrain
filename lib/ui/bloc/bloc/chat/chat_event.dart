part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchChatEvent extends ChatEvent {
  final String userId;
  final String name;

  const FetchChatEvent({
    required this.userId,
    required this.name,
  });
  @override
  List<Object> get props => [userId, name];
}
