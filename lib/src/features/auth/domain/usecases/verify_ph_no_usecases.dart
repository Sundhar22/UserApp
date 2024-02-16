import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';

import '../repositories/verify_ph_no_repositories.dart';

class VerifyPhNumUseCase {
  VerifyPhNumUseCase({required this.repository});
  final VerifyPhNumRepository repository;
  Future<Either<Failure, String>> verifyUserPhoneNumber(
      String userNumber) async {
    return await repository.verifyUserPhoneNumber(userNumber);
  }
}
