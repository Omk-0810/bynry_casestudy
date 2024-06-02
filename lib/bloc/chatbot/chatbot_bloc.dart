import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:meta/meta.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  late DialogFlowtter dialogFlowtter;

  ChatbotBloc() : super(ChatbotState(messages: [], isLoading: false)) {
    on<InitializeChatEvent>(_initializeChat);
    on<SendMessageEvent>(_sendMessage);
  }

  FutureOr<void> _initializeChat(InitializeChatEvent event, Emitter<ChatbotState> emit) async {
    emit(state.copyWith(isLoading: true));
    dialogFlowtter = await DialogFlowtter.fromFile();
    emit(state.copyWith(isLoading: false));
    }


  FutureOr<void> _sendMessage(SendMessageEvent event, Emitter<ChatbotState> emit) async {
    final text = event.message;
    if (text.isEmpty) return;

    final newMessage = {'message': Message(text: DialogText(text: [text])), 'isUserMessage': true};

    emit(state.copyWith(messages: [...state.messages, newMessage]));

    final response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message != null) {
      final responseMessage = {'message': response.message!, 'isUserMessage': false};
      emit(state.copyWith(messages: [...state.messages, responseMessage]));
    }
  }
}

