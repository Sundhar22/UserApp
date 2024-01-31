import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/location/data/implements/implements.dart';
import 'package:user_app/src/features/location/data/models/models.dart';
import 'package:user_app/src/features/location/domain/entities/entities.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockLocationRemoteDataSource dataSource;
  late LocationRepositoryImp repository;

  setUp(() {
    dataSource = MockLocationRemoteDataSource();
    repository = LocationRepositoryImp(remoteDataSource: dataSource);
  });

  group('Testing repoImpl', () {
    test('checking .... ', () async {
      // arrange

      when(dataSource.upDateLocation(const GeoPoint(0, 0)))
          .thenAnswer((_) async => const LocationModel(status: 'success'));

      // act

      final result = await repository.upDateLocation(const GeoPoint(0, 0));

      // assert
      expect(
        result,
        equals(
          const Right<Failure, LocationEntity>(
            LocationEntity(status: 'success'),
          ),
        ),
      );
    });
  });
}
