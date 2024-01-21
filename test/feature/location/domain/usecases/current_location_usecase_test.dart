import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/features/location/domain/entities/current_location_entites.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late CurrentLocationUseCase usecase;
  late MockCurrentLocationRepository mockCurrentLocationRepository;

  setUp(() {
    mockCurrentLocationRepository = MockCurrentLocationRepository();
    usecase = CurrentLocationUseCase(
      currentLocationRepository: mockCurrentLocationRepository,
    );
  });

  test('should get current location from the repository', () async {
    // arrange
    when(mockCurrentLocationRepository.getCurrentLocation()).thenAnswer(
        (_) async => const Right(CurrentLocation(geoPoint: GeoPoint(0, 0))));
    // act
    var result = await usecase.getCurrentLocation();
    // assert

    expect(result, const Right(CurrentLocation(geoPoint: GeoPoint(0, 0))));
  });
}
