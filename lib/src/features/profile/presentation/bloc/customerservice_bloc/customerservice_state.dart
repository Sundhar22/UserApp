import '../../../data/models/models.dart';

class ChatState {
  final List<Message> messages;
  final bool isLoading;
  final String? error;

  ChatState({required this.messages, required this.isLoading, this.error});

  ChatState copyWith({List<Message>? messages, bool? isLoading, String? error}) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  factory ChatState.loading() {
    return ChatState(messages: [], isLoading: true);
  }

  factory ChatState.error(String error) {
    return ChatState(messages: [], isLoading: false, error: error);
  }
}