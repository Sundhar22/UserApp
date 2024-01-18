import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/location/domain/entities/current_location_entites.dart';
import 'package:user_app/src/features/location/domain/repositories/current_location_repository.dart';

class CurrentLocationUseCase {
  final CurrentLocationRepository currentLocationRepository;

  CurrentLocationUseCase({required this.currentLocationRepository});

  Future<Either<Failure, CurrentLocation>> getCurrentLocation() async {
    return await currentLocationRepository.getCurrentLocation();
  }
}
