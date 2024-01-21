import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:user_app/src/features/location/data/models/current_location_model.dart';
import 'package:user_app/src/features/location/domain/entities/current_location_entites.dart';

void main() {
  final Position position = Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
  );

  CurrentLocationModel location = CurrentLocationModel(position: position);

  test('Model is subclass of entity', () async {
    expect(location, isA<CurrentLocation>());
  });

  //  json test from source to model test is not needed

  // same as above model to json test is not needed
}
