class NotificationContent {
  final String title;
  final String content;
  final String date;

  NotificationContent({
    required this.title,
    required this.content,
    required this.date,
  });

  factory NotificationContent.fromMap(Map<String, dynamic> map) {
    return NotificationContent(
      title: map['title'] as String,
      content: map['body'] as String,
      date: map['time'] as String,
    );
  }
}
