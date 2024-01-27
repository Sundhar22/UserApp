import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/core/error/exception.dart';

import '../models/models.dart';

abstract class LocationRemoteDataSource {
  Future<LocationModel> upDateLocation(GeoPoint geoPoint, String address);
}

class LocationRemoteDataSourceImp extends LocationRemoteDataSource {
  final DocumentReference docReference;

  LocationRemoteDataSourceImp({required this.docReference});

  @override
  Future<LocationModel> upDateLocation(
      GeoPoint geoPoint, String address) async {
    var result = await docReference.update({
      'isLocationSelected': true,
      'address': address,
      'locations': FieldValue.arrayUnion([geoPoint]),
    }).then((_) {
      return Future.value(LocationModel(status: "success"));
    }).catchError((error) => throw DBException());

    return result;
  }
}
