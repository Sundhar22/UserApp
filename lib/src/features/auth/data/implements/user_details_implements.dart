import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';

import '../../domain/repositories/user_details_repositories.dart';
import '../sources/user_detail_remote_sources.dart';

class UserDetailRepositoryImp extends UserRepository {
  final UserDetailRemoteSource remoteSource;

  UserDetailRepositoryImp(this.remoteSource);

  @override
  Future<Either<Failure, String>> updateUserDetails(
      {required String firstName,
      required String lastName,
      required String email}) async {
    try {
      var result = await remoteSource.updateUserDetails(
          firstName: firstName, lastName: lastName, email: email);
      return Right(result);
    } catch (e) {
      return Left(DetailUpdateFailure('Something went wrong'));
    }
  }
}
