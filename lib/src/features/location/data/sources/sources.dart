import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/exception.dart';

import '../models/models.dart';

abstract class LocationRemoteDataSource {
  Future<LocationModel> upDateLocation(GeoPoint geoPoint, String address);
}

class LocationRemoteDataSourceImp extends LocationRemoteDataSource {
final CollectionReference collectionReference;
  final FirebaseAuth firebaseAuth;

  LocationRemoteDataSourceImp({required this.collectionReference, required this.firebaseAuth});
  
  @override
  Future<LocationModel> upDateLocation(
      GeoPoint geoPoint, String address) async {
        final uid = firebaseAuth.currentUser?.uid;
    var docReference = collectionReference.doc(uid);
    var result = await docReference.update({
      'isLocationSelected': true,
      'address': address,
      'locations': FieldValue.arrayUnion([geoPoint]),
    }).then((_) {
      return Future.value(const LocationModel(status: "success"));
    }).catchError((error) => throw DBException());

    return result;
  }
}
