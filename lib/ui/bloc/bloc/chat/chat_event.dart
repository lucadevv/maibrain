part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchChatEvent extends ChatEvent {
  final UserModel userModel;

  const FetchChatEvent({
    required this.userModel,
  });
  @override
  List<Object> get props => [userModel];
}

class InitChatEnvet extends ChatEvent {
  final String promtMessage;

  const InitChatEnvet({
    required this.promtMessage,
  });
  @override
  List<Object> get props => [promtMessage];
}
