import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/chatbot/chatbot_bloc.dart';
import 'Messages.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotBloc()..add(InitializeChatEvent()),
      child: _ChatBotView(),
    );
  }
}

class _ChatBotView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        title: Text('Chat Bot', style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<ChatbotBloc, ChatbotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: MessagesScreen(messages: state.messages),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: Colors.deepPurple[600],
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Ask questions and tips',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final text = _controller.text;
                        context.read<ChatbotBloc>().add(SendMessageEvent(text));
                        _controller.clear();
                      },
                      icon: Icon(Icons.send, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
