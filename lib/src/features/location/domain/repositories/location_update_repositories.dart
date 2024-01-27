import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:user_app/src/features/location/domain/entities/entities.dart';

import '../../../../core/error/error.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationEntity>> upDateLocation(GeoPoint location,String address);
}
