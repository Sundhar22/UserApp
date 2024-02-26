import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';

abstract class ProfileEditRepository {
  Future<Either<Failure,ProfileEditEntity>>fetchUserDetails();
  Future<Either<Failure,ProfileEditEntity>> updateUserDetails(ProfileEditEntity profile);
}
