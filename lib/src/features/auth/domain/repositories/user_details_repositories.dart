import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> updateUserDetails(
      {required String firstName,
      required String lastName,
      required String email});
}
