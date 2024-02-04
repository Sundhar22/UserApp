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
