import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/core/routes/names.dart';

import '../../domain/repositories/verify_otp_repositories.dart';
import '../sources/verify_otp_sources.dart';

class VerifyOtpRepositoriesImpl extends VerifyOtpRepositories {
  final VerifyOtpRemoteDataSource remoteDataSource;

  VerifyOtpRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> verifyOtp(
      {String? otp, String? verificationId}) async {
    try {
      var result = await remoteDataSource.verifyOtp(
          otp: otp, verificationId: verificationId);

      return Right(result);
    } catch (e) {
      return Left(OtpFailure('Otp Invalid or Expired or Failed'));
    }
  }
}
