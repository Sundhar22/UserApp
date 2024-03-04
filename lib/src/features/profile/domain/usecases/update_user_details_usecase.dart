import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/core/usecases/usecases.dart';
import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';
import 'package:user_app/src/features/profile/domain/repositories/profile_edit_repository.dart';

class UpdateUserDetailsUsecae
    implements UseCase<Either<Failure, ProfileEditEntity>, ProfileEditEntity> {
  final ProfileEditRepository _profileEditRepository;

  UpdateUserDetailsUsecae(this._profileEditRepository);

  @override
  Future<Either<Failure, ProfileEditEntity>> call( {ProfileEditEntity? params}) {
    return _profileEditRepository
        .updateUserDetails(params!);
  }
}
