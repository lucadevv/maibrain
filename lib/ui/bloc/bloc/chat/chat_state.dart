part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final ChatStatus chatStatus;
  final UserModel userModel;
  final MessageModel messageModel;
  final List<String> listMessage;
  const ChatState({
    required this.chatStatus,
    required this.userModel,
    required this.messageModel,
    required this.listMessage,
  });
  ChatState copyWith({
    ChatStatus? chatStatus,
    UserModel? userModel,
    MessageModel? messageModel,
    List<String>? listMessage,
  }) =>
      ChatState(
        chatStatus: chatStatus ?? this.chatStatus,
        userModel: userModel ?? this.userModel,
        messageModel: messageModel ?? this.messageModel,
        listMessage: listMessage ?? this.listMessage,
      );
  factory ChatState.initial() {
    return ChatState(
      chatStatus: ChatStatus.initializing,
      userModel: UserModel.empty(),
      messageModel: MessageModel.empty(),
      listMessage: const [],
    );
  }
  @override
  List<Object> get props => [chatStatus, userModel, messageModel];
}

enum ChatStatus {
  initializing, // When the chat is being created or set up
  connecting, // When the connection to the chat server is being established
  connected, // When the chat is connected and ready to send and receive messages
  waitingForMessage, // When the chat is open but no new messages have been received
  sending, // When a message is in the process of being sent
  sent, // When the message has been sent to the server
  delivered, // When the message has been received by the server and delivered to the recipient
  read, // When the recipient has read the message
  disconnected, // When the chat has lost connection to the server
  error, // When an error occurs in the chat
  retrying, // When a message that failed is being retried
  archived, // When the chat has been archived by the user
  deleted, // When the chat has been deleted
  notification, // When a notification of a new message is received
  inCall, // When an audio or video call is in progress
}


// enum ChatStatus {
//   inicial, // Cuando el chat está siendo creado o configurado
//   conectando, // Cuando se está estableciendo la conexión con el servidor de chat
//   conectado, // Cuando el chat está conectado y listo para enviar y recibir mensajes
//   esperandoMensaje, // Cuando el chat está abierto, pero no se han recibido mensajes nuevos
//   enviando, // Cuando un mensaje está en proceso de ser enviado
//   enviado, // Cuando el mensaje ha sido enviado al servidor
//   recibido, // Cuando el mensaje ha sido recibido por el servidor y entregado al destinatario
//   leido, // Cuando el destinatario ha leído el mensaje
//   desconectado, // Cuando el chat ha perdido la conexión con el servidor
//   error, // Cuando ocurre algún error en el chat
//   reintentando, // Cuando se está intentando reenviar un mensaje que falló
//   archivado, // Cuando el chat ha sido archivado por el usuario
//   eliminado, // Cuando el chat ha sido eliminado
//   notificacion, // Cuando se recibe una notificación de un nuevo mensaje
//   enLlamada, // Cuando se está en una llamada de audio o video
// }
