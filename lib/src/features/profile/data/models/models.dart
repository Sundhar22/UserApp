import 'package:cloud_firestore/cloud_firestore.dart';
import '../../presentation/widgets/customerservice_ui.dart';

class Message {
  final String content;
  final Timestamp timestamp;
  final MessageType type;

  Message({
    required this.content,
    required this.timestamp,
    required this.type,
  });

  factory Message.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    final typeString = data['type'] as String;
    final messageType = MessageType.values.firstWhere(
      (e) => e.toString().split('.').last == typeString,
      orElse: () => MessageType.user,
    );

    // Parse Firestore timestamp correctly
    final timestamp = Timestamp.fromDate(data['time'].toDate());

    // Provide a default value for content if it's empty
    final content = data['content']?.toString() ?? '';

    return Message(
      content: content,
      timestamp: timestamp,
      type: messageType,
    );
  }
}






