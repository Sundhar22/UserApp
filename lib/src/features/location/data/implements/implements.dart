import 'package:cloud_firestore_platform_interface/src/geo_point.dart';
import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/location/domain/entities/entities.dart';

import '../../domain/repositories/repositories.dart';
import '../sources/sources.dart';

class LocationRepositoryImp implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;
  LocationRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, LocationEntity>> upDateLocation(
      GeoPoint location) async {
    var result = await remoteDataSource.upDateLocation(location);
    try {
      return Right(result.toEntity());
    } catch (e) {
      return Left(CatchError(e.toString()));
    }
  }
}
