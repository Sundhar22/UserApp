import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../entities/current_location_entites.dart';
import '../repositories/current_location_repository.dart';

class CurrentLocationUseCase {
  final CurrentLocationRepository currentLocationRepository;

  CurrentLocationUseCase({required this.currentLocationRepository});

  Future<Either<Failure, CurrentLocation>> getCurrentLocation() async {
    return await currentLocationRepository.getCurrentLocation();
  }
}
