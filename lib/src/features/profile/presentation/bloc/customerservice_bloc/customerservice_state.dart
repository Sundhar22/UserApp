import 'package:user_app/src/features/profile/data/models/models.dart';

class ChatState {
  final List<Message> messages;
  final bool isLoading;
  final String? error;

  ChatState({required this.messages, required this.isLoading, this.error});

  // Copy method to facilitate updating state with new values
  ChatState copyWith({List<Message>? messages, bool? isLoading, String? error}) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
  
  // Factory methods to represent different states
  factory ChatState.loading() {
    return ChatState(messages: [], isLoading: true);
  }

  factory ChatState.loaded(List<Message> messages) {
    return ChatState(messages: messages, isLoading: false);
  }

  factory ChatState.error(String error) {
    return ChatState(messages: [], isLoading: false, error: error);
  }
}
