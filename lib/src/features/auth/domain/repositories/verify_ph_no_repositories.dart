import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';

abstract class VerifyPhNumRepository {
  Future<Either<Failure, String>> verifyUserPhoneNumber(String userNumber);
}
