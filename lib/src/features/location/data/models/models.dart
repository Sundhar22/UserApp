import 'package:user_app/src/features/location/domain/entities/entities.dart';

class LocationModel extends LocationEntity {
  const LocationModel({required super.status});
  LocationEntity toEntity() {
    return LocationEntity(status: status);
  }
}
