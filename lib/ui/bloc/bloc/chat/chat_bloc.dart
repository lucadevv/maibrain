import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maibrain/domain/models/person_model.dart';
import 'package:maibrain/domain/repository/user_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final UserRepository userRepository;
  ChatBloc({required this.userRepository}) : super(ChatState.initial()) {
    on<FetchChatEvent>(fetchChatEvent);
  }

  Future<void> fetchChatEvent(
      FetchChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.connecting));

    try {
      final response = await userRepository.getPerson(
          userId: event.userId, name: event.name);

      emit(state.copyWith(
        chatStatus: ChatStatus.connected,
        personModel: response,
      ));
    } catch (e) {
      emit(state.copyWith(chatStatus: ChatStatus.error));
    }
  }
}
