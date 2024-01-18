// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/location/domain/entities/current_location_entites.dart';
import 'package:user_app/src/features/location/domain/repositories/current_location_repository.dart';

import '../../../../core/error/exception.dart';
import '../sources/current_location_source.dart';

class CurrentLocationImplementation extends CurrentLocationRepository {
  final CurrentLocationSource currentLocationSource;
  CurrentLocationImplementation({
    required this.currentLocationSource,
  });

  @override
  Future<Either<Failure, CurrentLocation>> getCurrentLocation() async {
    try {
      var result = await currentLocationSource.getCurrentLocation();
      // Assuming that result is of type CurrentLocation
      return Right(result.toEntity());
    } on LocationDisableException {
      return Future.value(Left(LocationPermissionFailure('Location Disable')));
    } on LocationDeniedException {
      return Future.value(Left(LocationPermissionFailure('Location Denied')));
    } on LocationPermanentDeniedException {
      return Future.value(
          Left(LocationPermissionFailure('Location Permanent Denied')));
    }
  }
}
