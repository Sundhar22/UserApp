import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../entities/entities.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
}
