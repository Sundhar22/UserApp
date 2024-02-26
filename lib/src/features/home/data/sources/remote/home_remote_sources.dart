import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/features/home/data/models/home_models.dart';

abstract class RemoteServiceDataSource {
  Future<List<ServiceModel>> getServices();
}

class ServiceRemoteDataSourceImpl implements RemoteServiceDataSource {
  final FirebaseFirestore _firestore;

  ServiceRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<ServiceModel>> getServices() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('services').get();

      List<ServiceModel> services = [];
      for (var doc in querySnapshot.docs) {
        List<SubServiceModel> subServices = [];

        var subServicesSnapshot = await _firestore
            .collection('services')
            .doc(doc.id)
            .collection('subservices')
            .get();

        for (var subDoc in subServicesSnapshot.docs) {
          List<ItemModel> items = [];

          var itemsSnapshot = await _firestore
              .collection('services')
              .doc(doc.id)
              .collection('subservices')
              .doc(subDoc.id)
              .collection('items')
              .get();

          for (var itemDoc in itemsSnapshot.docs) {
            ItemModel item = ItemModel.fromJson(itemDoc.data());
            items.add(item);
          }

          SubServiceModel subService = SubServiceModel(
            name: subDoc.id,
            items: items,
          );

          subServices.add(subService);
        }

        ServiceModel service = ServiceModel(
          name: doc.id,
          subServices: subServices,
        );

        services.add(service);
      }

      return services;
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }
}
