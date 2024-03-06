import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';

abstract class ProfileEditRepository {
  Future<Either<DataFetchFailure,ProfileEditEntity>>fetchUserDetails();
  Future<Either<DataUpdateFailure,ProfileEditEntity>> updateUserDetails(ProfileEditEntity profile);
}
