import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';

abstract class VerifyOtpRepositories {
  Future<Either<Failure, String>> verifyOtp(
      String otp, String verificationId);
}
