part of 'chatbot_bloc.dart';

@immutable
class ChatbotState {
  final List<Map<String, dynamic>> messages;
  final bool isLoading;

  ChatbotState({required this.messages, required this.isLoading});

  ChatbotState copyWith({List<Map<String, dynamic>>? messages, bool? isLoading}) {
    return ChatbotState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
