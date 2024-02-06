import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile/data/models/models.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_state.dart';
import 'package:user_app/src/features/profile/presentation/widgets/customerservice_ui.dart';
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.loading()) {
    FirebaseFirestore.instance
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots()
        .listen((snapshot) {
      final messages = snapshot.docs
          .map((doc) => Message.fromDocument(doc))
          .where((message) => message.content.isNotEmpty)
          .toList();
      add(MessageReceivedEvent(messages: messages));
    });

    on<MessageReceivedEvent>((event, emit) {
      emit(state.copyWith(messages: event.messages, isLoading: false));
    });

    on<SendMessageEvent>(_onSendMessage);
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    if (event.message.isNotEmpty) {
      try {
        final Timestamp timestamp = Timestamp.now();
        await FirebaseFirestore.instance.collection('messages').add({
          'content': event.message,
          'time': timestamp,
          'type': MessageType.user.toString(),
        });
      } catch (error) {
        emit(state.copyWith(error: error.toString()));
      }
    }
  }
}


