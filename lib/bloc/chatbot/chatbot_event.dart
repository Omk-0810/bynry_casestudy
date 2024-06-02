part of 'chatbot_bloc.dart';

@immutable
sealed class ChatbotEvent {}
class SendMessageEvent extends ChatbotEvent {
  final String message;

  SendMessageEvent(this.message);
}

class InitializeChatEvent extends ChatbotEvent {}
