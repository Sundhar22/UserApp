import 'package:user_app/src/features/home/domain/entities/entities.dart';

class BannerModel extends BannerEntity {
  const BannerModel(
      {required super.serviceType,
      required super.productServiceName,
      required super.products,
      required super.imageUrl,
      required super.offerPercentages});

  // ...
  // A model is a more generic term and can represent structured data used within an application.
  // ...
  // fromJson
  // ...
  // toJson

  BannerModel.fromJson(Map<String, dynamic> json)
      : super(
            serviceType: json['service type'],
            productServiceName: json['productServiceName'],
            products: json['product'],
            imageUrl: json['link'],
            offerPercentages: json['offer percentage']);

  BannerEntity toEntity() {
    return BannerEntity(
        serviceType: serviceType,
        productServiceName: productServiceName,
        products: products,
        imageUrl: imageUrl,
        offerPercentages: offerPercentages);
  }
}
