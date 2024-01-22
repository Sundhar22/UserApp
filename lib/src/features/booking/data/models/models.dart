class BookingModel {
  final String id;
  final String serviceName;
  final String bookingType;
  final String date;
  final String time;
  final String price;
  final String imgUrl;

  BookingModel({
    required this.id,
    required this.serviceName,
    required this.bookingType,
    required this.date,
    required this.time,
    required this.price,
    required this.imgUrl,
  });
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      serviceName: json['serviceName'] ?? '',
      bookingType: json['bookingType'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      price: json['price'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceName': serviceName,
      'bookingType': bookingType,
      'date': date,
      'time': time,
      'price': price,
      'imgUrl': imgUrl,
    };
  }
}
