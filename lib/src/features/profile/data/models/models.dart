import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/features/profile/presentation/widgets/customerservice_ui.dart';

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

  // Check if any required field is missing
  if (data['content'] == null || data['timestamp'] == null || data['type'] == null) {
    throw Exception("Missing required fields in Firestore document: $data");
  }

  final typeString = data['type'] as String;
  final messageType = MessageType.values.firstWhere(
    (e) => e.toString().split('.').last == typeString,
    orElse: () => MessageType.user,
  );

  // Parse Firestore timestamp correctly
  final timestamp = Timestamp.fromDate(data['timestamp'] as DateTime);


  return Message(
    content: data['content'],
    timestamp: timestamp,
    type: messageType,
  );
}


}
