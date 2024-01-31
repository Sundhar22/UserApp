import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repositories/verify_otp_repositories.dart';
import '../sources/verify_otp_sources.dart';

class VerifyOtpRepositoriesImpl extends VerifyOtpRepositories {
  final VerifyOtpRemoteDataSource remoteDataSource;

  VerifyOtpRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> verifyOtp(
      String otp, String verificationId) async {
    try {
      var result = await remoteDataSource.verifyOtp(
          otp, verificationId);
      return Right(result);
    } on OtpInvalidException {
      return Future.value(Left(OtpFailure('Otp Invalid or Expired or Failed')));
    }
  }
}
