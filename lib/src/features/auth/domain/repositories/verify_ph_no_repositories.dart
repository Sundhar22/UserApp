import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';

abstract class VerifyPhNumRepository {
  Future<Either<Failure, String>> verifyUserPhoneNumber(String userNumber);
}
