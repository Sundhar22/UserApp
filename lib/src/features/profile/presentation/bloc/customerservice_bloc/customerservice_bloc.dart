import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile/data/models/models.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_state.dart';
import 'package:user_app/src/features/profile/presentation/widgets/customerservice_ui.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final now = DateTime.now();

  ChatBloc() : super(ChatState(messages: [], isLoading: true)) {
    on<ChatEvent>(_onEvent);

    FirebaseFirestore.instance
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots()
        .listen((snapshot) {
      add(SendMessageEvent(
          message: snapshot.docs.map((doc) => Message.fromDocument(doc)).toList().toString()));
    });
  }

  void _onEvent(ChatEvent event, Emitter<ChatState> emit) async {
    if (event is SendMessageEvent) {
      try {
         final Timestamp timestamp = Timestamp.fromDate(now);
        await FirebaseFirestore.instance.collection('messages').add({
          'content': event.message,
          'time': DateTime.now(),
          'type': MessageType.user.toString(),
        });
        // Emitting the updated state after sending a message
        emit(state.copyWith(
            messages: [
              ...state.messages,
              Message(
                  content: event.message,
                  type: MessageType.user,
                  timestamp: timestamp)
            ],
            isLoading: false));
            
      } catch (error) {
        // Emitting an error state if message sending fails
        emit(state.copyWith(isLoading: false, error: error.toString()));
      }
    } else if (event is MessageReceivedEvent) {
      // Emitting the state with received messages
      emit(state.copyWith(messages: event.messages, isLoading: false));
    }
  }
}
