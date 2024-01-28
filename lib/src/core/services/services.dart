library services;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:user_app/src/core/config/firebase_config.dart';
import 'package:user_app/src/features/location/data/implements/current_location_implementation.dart';
import 'package:user_app/src/features/location/data/implements/implements.dart';
import 'package:user_app/src/features/location/data/sources/sources.dart';
import 'package:user_app/src/features/location/domain/repositories/current_location_repository.dart';
import 'package:user_app/src/features/location/domain/repositories/location_update_repositories.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';
import 'package:user_app/src/features/location/domain/usecases/usecases.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';

import '../../features/location/data/sources/current_location_source.dart';

final locator = GetIt.instance;

void setUpLocator() {
  // firebase in getit
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  locator.registerLazySingleton<CollectionReference>(
      () => collectionReference(firebaseFirestore: locator()));

  locator.registerLazySingleton<DocumentReference>(() => documentReference(
      collectionReference: locator(), firebaseAuth: locator()));

  // bloc
  locator.registerFactory(() => LocationBloc(locator(), locator()));

  // usecase
  locator
      .registerLazySingleton(() => GetLocationUseCase(repository: locator()));

  locator.registerLazySingleton(
      () => CurrentLocationUseCase(currentLocationRepository: locator()));

  // repository
  locator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImp(remoteDataSource: locator()));

  locator.registerLazySingleton<CurrentLocationRepository>(
      () => CurrentLocationImplementation(currentLocationSource: locator()));

  // source

  locator.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImp(docReference: locator()));

  locator.registerLazySingleton<CurrentLocationSource>(
      () => CurrentLocationSourceImpl());
}
