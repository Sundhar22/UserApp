import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repositories/verify_otp_repositories.dart';

class VerifyOtpUseCases {
  final VerifyOtpRepositories repository;
  VerifyOtpUseCases({required this.repository});

  Future<Either<Failure, String>> verifyOtp(
      {required String otp, required String verificationId}) async {
    return await repository.verifyOtp(otp: otp, verificationId: verificationId);
  }
}
