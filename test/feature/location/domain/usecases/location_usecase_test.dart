import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/features/location/domain/entities/entities.dart';
import 'package:user_app/src/features/location/domain/usecases/usecases.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late GetLocationUseCase useCase;

  late MockLocationRepository mockLocationRepository;

  setUp(() {
    mockLocationRepository = MockLocationRepository();
    useCase = GetLocationUseCase(repository: mockLocationRepository);
  });

  GeoPoint geoPoint = const GeoPoint(-10.8544921875, 59.478568831926395);

  var locationEntity = LocationEntity(status: "success");
  test('checking repository through usecases', () async {
    // arrange
    when(mockLocationRepository.upDateLocation(geoPoint))
        .thenAnswer((_) async => Right(locationEntity));

    // act
    final result = await useCase.execute(geoPoint);

    // assert

    expect(result, Right(locationEntity));
  });
}
