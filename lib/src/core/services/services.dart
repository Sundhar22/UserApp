library services;

import 'package:get_it/get_it.dart';
import 'package:user_app/src/features/location/data/implements/current_location_implementation.dart';
import 'package:user_app/src/features/location/domain/repositories/current_location_repository.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';

import '../../features/location/data/sources/current_location_source.dart';

final locator = GetIt.instance;

void setUpLocator() {
  // bloc
  locator.registerFactory(() => LocationBloc(locator()));

  // usecase
  locator.registerLazySingleton(
      () => CurrentLocationUseCase(currentLocationRepository: locator()));

  // repository
  locator.registerLazySingleton<CurrentLocationRepository>(
      () => CurrentLocationImplementation(currentLocationSource: locator()));

  // source
  locator.registerLazySingleton<CurrentLocationSource>(
      () => CurrentLocationSourceImpl());
}
