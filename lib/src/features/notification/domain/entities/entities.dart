
    class NotificationEntities {
  final String title;
  final String content;
  final String date;

  NotificationEntities({
    required this.title,
    required this.content,
    required this.date,
  });

  factory NotificationEntities.fromMap(Map<String, dynamic> map) {
    return NotificationEntities(
      title: map['title'] as String,
      content: map['body'] as String, date: map['time'] as String,
    );
  }
}