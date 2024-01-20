import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/location/domain/entities/current_location_entites.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockCurrentLocationUseCase useCase;
  late LocationBloc bloc;

  setUp(() {
    useCase = MockCurrentLocationUseCase();
    bloc = LocationBloc(useCase);
  });

  test('test initial bloc', () async {
    expect(bloc.state, LocationInitial());
  });
  blocTest<LocationBloc, LocationState>(
    'should emit [LocationInitial] when nothing is added',
    build: () {
      when(useCase.getCurrentLocation()).thenAnswer(
          (_) async => const Right(CurrentLocation(geoPoint: GeoPoint(0, 0))));
      return bloc;
    },
    act: (bloc) => bloc.add(GetCurrentLocationEvent()),
    expect: () => [
      CurrentLocationLoadedState(
          currentLocation: const CurrentLocation(geoPoint: GeoPoint(0, 0))),
    ],
  );

//  fail test

  blocTest<LocationBloc, LocationState>(
    'should emit [LocationErrorState]',
    build: () {
      when(useCase.getCurrentLocation()).thenAnswer(
          (_) async => Left(LocationUpDateFailure('unable to get location')));
      return bloc;
    },
    act: (bloc) => bloc.add(GetCurrentLocationEvent()),
    expect: () => [
      CurrentLocationErrorState(message: 'unable to get location'),
    ],
  );
}
