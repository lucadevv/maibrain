import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maibrain/domain/models/request/message_model.dart';
import 'package:maibrain/domain/models/response/user_model.dart';
import 'package:maibrain/domain/repository/user_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final UserRepository userRepository;
  ChatBloc({required this.userRepository}) : super(ChatState.initial()) {
    on<FetchChatEvent>(fetchChatEvent);
    on<InitChatEnvet>(initChatEnvet);
  }

  Future<void> fetchChatEvent(
      FetchChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.connecting));

    try {
      emit(state.copyWith(
        chatStatus: ChatStatus.connected,
        userModel: event.userModel,
      ));
    } catch (e) {
      emit(state.copyWith(chatStatus: ChatStatus.error));
    }
  }

  Future<void> initChatEnvet(
      InitChatEnvet event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.sending));

    if (event.promtMessage.isNotEmpty) {
      // Agregar el mensaje del usuario a la lista de mensajes.
      final List<String> messages2 = List.from(state.listMessage);
      messages2.add(event.promtMessage);

      // Emitir el estado actualizado con el nuevo mensaje del usuario.
      emit(state.copyWith(
        listMessage: messages2,
        chatStatus: ChatStatus.connecting,
      ));

      // Crear el modelo de mensaje.
      final message = MessageModel(
          personId: state.userModel.personId, prompt: event.promtMessage);

      try {
        // Enviar el mensaje y obtener la respuesta.
        final messageResponse =
            await userRepository.sendMessage(message: message);

        // Agregar la respuesta del servidor a la lista de mensajes.
        final List<String> messages = List.from(state.listMessage);
        messages.add(messageResponse);

        // Emitir el estado actualizado con el mensaje del servidor.
        emit(state.copyWith(
          listMessage: messages,
          chatStatus: ChatStatus.connected,
        ));
      } catch (e) {
        // Manejar errores si es necesario.
        emit(state.copyWith(chatStatus: ChatStatus.error));
      }
    }
  }
}
