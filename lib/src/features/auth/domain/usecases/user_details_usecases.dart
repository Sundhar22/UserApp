import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repositories/user_details_repositories.dart';

class UserDetailsUseCases {
  final UserRepository userRepository;

  UserDetailsUseCases({required this.userRepository});

  Future<Either<Failure, String>> call(
      {required String firstName,
      required String lastName,
      required String email}) async {
    return await userRepository.updateUserDetails(
        firstName: firstName, lastName: lastName, email: email);
  }
}
