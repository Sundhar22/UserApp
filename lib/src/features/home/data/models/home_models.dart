import 'package:user_app/src/features/home/domain/entities/home_entity.dart';

class ServiceModel extends Service {
  @override
  final List<SubServiceModel> subServices;

  ServiceModel({
    required String name,
    required this.subServices,
  }) : super(name: name, subServices: []);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> subServicesJson = json['subServices'];
    List<SubServiceModel> subServices =
        subServicesJson.map((e) => SubServiceModel.fromJson(e)).toList();
    return ServiceModel(
      name: json['name'],
      subServices: subServices,
    );
  }
}

class SubServiceModel extends SubService {
  @override
  final List<ItemModel> items;

  SubServiceModel({
    required String name,
    required this.items,
  }) : super(name: name, items: []);

  factory SubServiceModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<ItemModel> items = itemsJson.map((e) => ItemModel.fromJson(e)).toList();
    return SubServiceModel(
      name: json['name'],
      items: items,
    );
  }
}

class ItemModel extends Item {
  ItemModel({
    required String name,
  }) : super(name: name);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
    );
  }
}
