class BookingModel {
  final String id;
  final String serviceName;
  final String bookingType;
  final String date;
  final String time;
  final String price;
  final String imgUrl;
  final String serviceDetail;
  final String location;
  final String transactionId;
  final String paymentMethod;
  final String transactionDate;
  final String transactionTime;
  final String paymentStatus;
  final String subtotal;
  final String discount;
  final String tax;
  final String totalPrice;

  BookingModel({
    required this.id,
    required this.serviceName,
    required this.bookingType,
    required this.date,
    required this.time,
    required this.price,
    required this.imgUrl,
    required this.serviceDetail,
    required this.location,
    required this.transactionId,
    required this.paymentMethod,
    required this.transactionDate,
    required this.transactionTime,
    required this.paymentStatus,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.totalPrice,
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
      serviceDetail: json['serviceDetail'] ?? '',
      location: json['location'] ?? '',
      transactionId: json['transactionId'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      transactionDate: json['transactionDate'] ?? '',
      transactionTime: json['transactionTime'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
      subtotal: json['subtotal'] ?? '',
      discount: json['discount'] ?? '',
      tax: json['tax'] ?? '',
      totalPrice: json['totalPrice'] ?? '',
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
      'transactionId': transactionId,
      'paymentMethod': paymentMethod,
      'transactionDate': transactionDate,
      'transactionTime': transactionTime,
      'paymentStatus': paymentStatus,
      'subtotal': subtotal,
      'discount': discount,
      'tax': tax,
      'totalPrice': totalPrice,
    };
  }
}
