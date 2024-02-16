import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';

import '../entities/current_location_entites.dart';

abstract class CurrentLocationRepository {
  Future <Either<Failure,CurrentLocation> > getCurrentLocation();
}
