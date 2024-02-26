import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/data/models/profile_edit_model.dart';
import 'package:user_app/src/features/profile/data/sources/profile_details_fetch.dart';
import 'package:user_app/src/features/profile/data/sources/profile_details_update.dart';
import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';
import 'package:user_app/src/features/profile/domain/repositories/profile_edit_repository.dart';

class ProfileEditImpl implements ProfileEditRepository {
  final UserDetailsFetchSource _userDetailsFetchSource;
  final UserDetailsUpdateSource _userDetailsUpdateSource;

  ProfileEditImpl(
    this._userDetailsFetchSource,
    this._userDetailsUpdateSource,
  );

  @override
  Future<Either<Failure, ProfileEditEntity>> fetchUserDetails() async {
    try {
      var details = await _userDetailsFetchSource.fetchUserDetails();
      return Right(details);
    } catch (e) {
      return Left(Failure("Failed to fetch user details: $e"));
    }
  }

  @override
  Future<Either<Failure, ProfileEditEntity>> updateUserDetails(
      ProfileEditEntity profile) async {
    try {
      var updatedDetails = await _userDetailsUpdateSource
          .updateUserDetails(ProfileEditEntity as ProfileEditModel);
      return Right(updatedDetails);
    } catch (e) {
      return Left(Failure("Failed to update user details: $e"));
    }
  }
}
