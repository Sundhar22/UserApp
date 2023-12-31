class PaymentHistoryContent {
  final String title;
  final String content;
  final String date;
  final String time;
  final String id;
  final String rate;

  PaymentHistoryContent({
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.id,
    required this.rate,
  });

  factory PaymentHistoryContent.fromMap(Map<String, dynamic> map) {
    return PaymentHistoryContent(
      title: map['title'] as String,
      content: map['body'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      id: map['id'] as String,
      rate: map['rate'] as String,
    );
  }
}
