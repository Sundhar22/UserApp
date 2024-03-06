import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String serviceType;
  final String productServiceName;
  final List<String> products;

  const Service(
      {required this.serviceType,
      required this.productServiceName,
      required this.products});

  @override
  List<Object?> get props => [serviceType, productServiceName, products];
}

class BannerEntity extends Service {
  final String imageUrl;
  final Map offerPercentages;

  const BannerEntity({
    required super.serviceType,
    required super.productServiceName,
    required super.products,
    required this.imageUrl,
    required this.offerPercentages,
  });

  @override
  List<Object?> get props => [imageUrl, offerPercentages, ...super.props];
}

class UserDataEntity extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  const UserDataEntity(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address});
  factory UserDataEntity.fromJson(Map<String, dynamic> json) {
    return UserDataEntity(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  @override
  List<Object?> get props => [name, email, phoneNumber, address];
}
