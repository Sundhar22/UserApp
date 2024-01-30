import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/auth/data/sources/verify_ph_no_sources.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repositories/verify_ph_no_repositories.dart';

class VerifyPhNumRepoImpl implements VerifyPhNumRepository {
  final VerifyPhNumRemoteDataSource remoteDataSource;

  VerifyPhNumRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> verifyUserPhoneNumber(
      String userNumber) async {
    try {
      String verificationId = await remoteDataSource.verifyPhNum(userNumber);
      return Right(verificationId);
    } on Exception catch (e) {
      if (e is InvalidException) {
        return Left(
            VerifyPhNumFailure("The provided phone number is not valid."));
      } else {
        return Left(VerifyPhNumFailure("Something went wrong."));
      }
    }
  }
}
