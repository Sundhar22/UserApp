import '../../domain/entities/entities.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required String serviceType,
    required String productServiceName,
    required List<String> products,
    required String imageUrl,
    required Map offerPercentages,
  }) : super(
          serviceType: serviceType,
          productServiceName: productServiceName,
          products: products,
          imageUrl: imageUrl,
          offerPercentages: offerPercentages,
        );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      serviceType: json['service type'],
      productServiceName: json['productServiceName'],
      products: List<String>.from(json['product']),
      imageUrl: json['link'],
      offerPercentages: Map<String, dynamic>.from(json['offer percentage']),
    );
  }

  BannerEntity toEntity() {
    return BannerEntity(
      serviceType: serviceType,
      productServiceName: productServiceName,
      products: products,
      imageUrl: imageUrl,
      offerPercentages: offerPercentages,
    );
  }
}
