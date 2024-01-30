library services;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:user_app/src/core/config/firebase_config.dart';
import 'package:user_app/src/features/auth/data/implements/user_details_implements.dart';
import 'package:user_app/src/features/auth/data/implements/verify_otp_implements.dart';
import 'package:user_app/src/features/auth/data/implements/verify_ph_no_implements.dart';
import 'package:user_app/src/features/auth/data/sources/user_detail_remote_sources.dart';
import 'package:user_app/src/features/auth/domain/repositories/verify_otp_repositories.dart';
import 'package:user_app/src/features/auth/domain/repositories/verify_ph_no_repositories.dart';
import 'package:user_app/src/features/auth/domain/usecases/user_details_usecases.dart';
import 'package:user_app/src/features/auth/domain/usecases/verify_otp_usecases.dart';
import 'package:user_app/src/features/auth/domain/usecases/verify_ph_no_usecases.dart';
import 'package:user_app/src/features/auth/presentation/bloc/register_bloc.dart';
import 'package:user_app/src/features/location/data/implements/current_location_implementation.dart';
import 'package:user_app/src/features/location/data/implements/implements.dart';
import 'package:user_app/src/features/location/data/sources/sources.dart';
import 'package:user_app/src/features/location/domain/repositories/current_location_repository.dart';
import 'package:user_app/src/features/location/domain/repositories/location_update_repositories.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';
import 'package:user_app/src/features/location/domain/usecases/usecases.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';

import '../../features/auth/data/sources/verify_otp_sources.dart';
import '../../features/auth/data/sources/verify_ph_no_sources.dart';
import '../../features/auth/domain/repositories/user_details_repositories.dart';
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
  locator.registerFactory(() => RegisterBloc(locator(), locator(), locator()));

  // usecase
  locator
      .registerLazySingleton(() => GetLocationUseCase(repository: locator()));

  locator.registerLazySingleton(
      () => CurrentLocationUseCase(currentLocationRepository: locator()));
  locator
      .registerLazySingleton(() => VerifyPhNumUseCase(repository: locator()));
  locator.registerLazySingleton(() => VerifyOtpUseCases(repository: locator()));

  locator.registerLazySingleton(
      () => UserDetailsUseCases(userRepository: locator()));

  // repository
  locator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImp(remoteDataSource: locator()));

  locator.registerLazySingleton<CurrentLocationRepository>(
      () => CurrentLocationImplementation(currentLocationSource: locator()));

  locator.registerLazySingleton<VerifyPhNumRepository>(
      () => VerifyPhNumRepoImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<VerifyOtpRepositories>(
      () => VerifyOtpRepositoriesImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<UserRepository>(
      () => UserDetailRepositoryImp(locator()));

  // source

  locator.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImp(docReference: locator()));

  locator.registerLazySingleton<CurrentLocationSource>(
      () => CurrentLocationSourceImpl());

  locator.registerLazySingleton<VerifyPhNumRemoteDataSource>(
      () => VerifyPhNumRemoteDataSourceImpl(auth: locator()));
  locator.registerLazySingleton<VerifyOtpRemoteDataSource>(
      () => VerifyOtpRemoteDataSourceImp(locator(), locator()));
  
  locator.registerLazySingleton<UserDetailRemoteSource>(
      () => UserDetailRemoteSourceImp(docReference: locator()));
}
