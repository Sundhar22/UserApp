import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';
import 'package:user_app/src/features/home/domain/repositories/user_data_repo.dart';

import '../sources/user_data_source.dart';

class UserDataImplementation extends UserDataRepo {
  final UserDataSource userDataSource;
  UserDataImplementation(this.userDataSource);

  @override
  Future<Either<Failure, UserDataEntity>> getUserData() async {
    try {
      var data = await userDataSource.getUser();
      
      return Right(data.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
