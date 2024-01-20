import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';

import '../entities/current_location_entites.dart';

abstract class CurrentLocationRepository {
  Future <Either<Failure,CurrentLocation> > getCurrentLocation();
}
