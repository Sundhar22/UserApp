import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/features/location/data/models/current_location_model.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockCurrentLocationSource currentLocationSourceImpl;

  setUp(() {
    currentLocationSourceImpl = MockCurrentLocationSource();
  });
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
  group('getCurrentLocation', () {
    test('get success', () async {
      // arrange
      when(currentLocationSourceImpl.getCurrentLocation())
          .thenAnswer((_) async => CurrentLocationModel(
                position: position,
              ));
      // act
      var result = await currentLocationSourceImpl.getCurrentLocation();
      // assert
      expect(result, isA<CurrentLocationModel>());
      expect(result, equals(CurrentLocationModel(position: position)));
    });

    test('get failure', () async {
      // arrange
      when(currentLocationSourceImpl.getCurrentLocation())
          .thenThrow(Exception());
      try {
        // act
        await currentLocationSourceImpl.getCurrentLocation();
        fail('Expected a Exception');
      } catch (e) {
        expect(e, isA<Exception>());
      }
      // assert
    });
  });
}
