import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';

import '../../domain/repositories/banner_repositories.dart';
import '../models/banner_models.dart';
import '../sources/banner_sources.dart';

class HomeRepositoryImp implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;
  HomeRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, BannerEntity>> getBanners() async {
    try {
      BannerModel result = await remoteDataSource.getBanners();
      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
