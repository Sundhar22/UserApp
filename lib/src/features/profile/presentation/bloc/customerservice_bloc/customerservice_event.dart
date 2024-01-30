import 'package:user_app/src/features/profile/data/models/models.dart';

abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;

  SendMessageEvent({required this.message});
}

class MessageReceivedEvent extends ChatEvent {
  final List<Message> messages;

  MessageReceivedEvent({required this.messages});
}
