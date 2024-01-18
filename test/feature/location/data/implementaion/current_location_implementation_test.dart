import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/core/error/exception.dart';
import 'package:user_app/src/features/location/data/implements/current_location_implementation.dart';
import 'package:user_app/src/features/location/data/models/current_location_model.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockCurrentLocationSource mockCurrentLocationSource;
  late CurrentLocationImplementation currentLocationImplementation;

  setUp(() {
    mockCurrentLocationSource = MockCurrentLocationSource();
    currentLocationImplementation = CurrentLocationImplementation(
      currentLocationSource: mockCurrentLocationSource,
    );
  });

  CurrentLocationModel tCurrentLocationModel = CurrentLocationModel(
    position: Position(
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
    ),
  );

  group('Current Location Implementation', () {
    test('should return current location', () async {
      // arrange
      when(mockCurrentLocationSource.getCurrentLocation())
          .thenAnswer((_) async => tCurrentLocationModel);

      // act

      var result = await currentLocationImplementation.getCurrentLocation();

      // assert

      expect(result, equals(Right(tCurrentLocationModel.toEntity())));
    });

    test('should return failure when unable to get current location', () async {
      // arrange
      when(mockCurrentLocationSource.getCurrentLocation())
          .thenThrow(LocationDisableException());

      // act
      var result = await currentLocationImplementation.getCurrentLocation();

      // assert
     

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<LocationPermissionFailure>()),
        (r) => fail("Should not return right"),
      );
    });
  });
}
