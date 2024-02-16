import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';
import 'package:user_app/src/features/home/domain/repositories/user_data_repo.dart';

class UserDataUseCase {
  final UserDataRepo userDataRepo;
  const UserDataUseCase(this.userDataRepo);
  Future<Either<Failure, UserDataEntity>> execute() async {
    return await userDataRepo.getUserData();
  }
}
