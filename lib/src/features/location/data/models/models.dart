import 'package:user_app/src/features/location/domain/entities/entities.dart';

class LocationModel extends LocationEntity {
  LocationModel({required super.status});
  LocationEntity toEntity() {
    return LocationEntity(status: status);
  }
}
