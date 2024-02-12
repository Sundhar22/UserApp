import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
}
