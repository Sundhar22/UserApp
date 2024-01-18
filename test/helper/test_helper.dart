import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/annotations.dart';
import 'package:user_app/src/features/location/data/sources/current_location_source.dart';
import 'package:user_app/src/features/location/data/sources/sources.dart';
import 'package:user_app/src/features/location/domain/repositories/current_location_repository.dart';
import 'package:user_app/src/features/location/domain/repositories/location_update_repositories.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';
import 'package:user_app/src/features/location/domain/usecases/usecases.dart';

@GenerateMocks(
  [
    LocationRepository,
    LocationRemoteDataSource,
    FirebaseFirestore, // Add the import for FirebaseFirestore
    DocumentReference, // Add the import for DocumentReference
    CollectionReference, // Add the import for CollectionReference
    GetLocationUseCase,
    //
    CurrentLocationRepository,
    CurrentLocationSource,
    CurrentLocationUseCase,
  ],
)
void main() {}
