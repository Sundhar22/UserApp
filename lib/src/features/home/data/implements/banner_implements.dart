import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../../domain/entities/entities.dart';

import '../../domain/repositories/banner_repositories.dart';
import '../models/banner_models.dart';
import '../sources/banner_sources.dart';

class BannerRepositoryImp implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;
  BannerRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      List<BannerModel> result = await remoteDataSource.getBanners();

      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
