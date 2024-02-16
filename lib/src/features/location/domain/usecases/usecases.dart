import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../entities/entities.dart';

import '../repositories/location_update_repositories.dart';

class GetLocationUseCase {
  final LocationRepository repository;

  GetLocationUseCase({required this.repository});

  Future<Either<Failure, LocationEntity>> execute(GeoPoint geoPoint,String address) async {
    return await repository.upDateLocation(geoPoint,address);
  }
}
